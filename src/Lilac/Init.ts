import Game from "Game";
import { filesystem } from "love";
import { temporaryAllocators } from "./Allocators/TemporaryAllocator";
import { WindowData } from "./Editor/WindowData";
import { MousePressedEventArgs, MouseReleasedEventArgs, QuitEventArgs } from "./Events/EventArgs";
import { GameContext } from "./GameContext";
import Vector2 from "./Numerics/Vector2";
import Runtime from "./Runtime";

love.run = () => {
	{
		const [contents,] = love.filesystem.read("windowData.json");
		if (contents == undefined) {
			love.window.setMode(700, 1000, {});
		} else {
			const windowData: WindowData = json.decode(contents);
	
			love.window.setMode(windowData.w, windowData.h, {
				x: windowData.x,
				y: windowData.y,
				display: windowData.display,
				resizable: true,
			});
		}
	}

	love.timer.step();

	let dt = 0;

	const gameContext: GameContext = {
		frame: 0,
		uptime: 0,
		screenDimensions: new Vector2(love.graphics.getWidth(), love.graphics.getHeight()),
	};

	//const runtime: Runtime = new Workspace();
	const runtime: Runtime = new Game();
	runtime["onLoad"](gameContext);

	return function() {
		love.event.pump();
		for (const [name, a, b, c, d, e, f] of love.event.poll()) {
			if (name == "quit") {
				const quitEventArgs: QuitEventArgs = {
					cancelled: false,
				}

				runtime["onQuiting"](quitEventArgs, gameContext);

				if (!quitEventArgs.cancelled) {
					//runtime.unload();

					const [w, h, flags] = love.window.getMode();

					const windowData: WindowData = {
						x: flags.x!,
						y: flags.y!,

						w: w,
						h: h,

						display: flags.display!,
					}

					const serData = json.encode(windowData);

					filesystem.write("windowData.json", serData);

					return a == undefined ? true : a;
				}
			} else if (name == "mousepressed") {
				const mousePressedEvent: MousePressedEventArgs = {
					position: Vector2.new(a, b),
					button: c,
					isTouch: d,
					pressed: e,
				}

				runtime["onMousePressed"](mousePressedEvent, gameContext);
			} else if (name == "mousereleased") {
				const mouseReleasedEvent: MouseReleasedEventArgs = {
					position: Vector2.new(a, b),
					button: c,
					isTouch: d,
					pressed: e,
				}

				runtime["onMouseReleased"](mouseReleasedEvent, gameContext);
			}
		}

		for (const [,temporaryAllocator] of temporaryAllocators.values())
			temporaryAllocator.clean();

		dt = love.timer.step();
		gameContext.frame++;
		gameContext.uptime += dt;

		runtime["onUpdate"]({
			dt: dt,
			frame: gameContext.frame,
		}, gameContext);

		if (love.graphics.isActive()) {
			love.graphics.origin();
			love.graphics.clear(love.graphics.getBackgroundColor());

			runtime["onDraw"]({
				frame: gameContext.frame,
			}, gameContext);

			love.graphics.present();
		}
		
		for (const [,temporaryAllocator] of temporaryAllocators.values())
			temporaryAllocator.clean();

		love.timer.sleep(0.001);
	}
}