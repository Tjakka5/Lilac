

/*
export default class Workspace extends Runtime {
	private virtualGame: VirtualGame;
	private canvas: Canvas = love.graphics.newCanvas(640, 640);
	private errorTraceback: ErrorTraceback | undefined;

	private sandbox = {
		love: love,
		tostring: tostring,
		error: error,
	};

	constructor() {
		super();

		const virtualGameScreenSize = new Vector2(640, 640);

		this.virtualGame = new VirtualGame(virtualGameScreenSize);
		this.canvas = love.graphics.newCanvas(virtualGameScreenSize.x, virtualGameScreenSize.y);
	}

	load(): void {
		this.virtualGame.load();
	}

	unload(): void {
		this.virtualGame.unload();
	}

	update(gameContext: GameContext, args: UpdateEventArgs): void {
		const [success, errorTraceback] = this.virtualGame.update(gameContext, args);
		if (!success) {
			this.errorTraceback = errorTraceback as ErrorTraceback;
		}
		
		if (love.keyboard.isDown("f4")) {
			love.event.quit("restart");
		}

		if (love.keyboard.isDown("f5")) {
			this.virtualGame.reload();
		}

		if (love.keyboard.isDown("f7")) {
			const file = this.errorTraceback?.trace.get(0)?.tracebackTS.filename;
			const line = this.errorTraceback?.trace.get(0)?.tracebackTS.lineNumber;
			os.execute("code --goto " + love.filesystem.getSourceBaseDirectory() + "/src/" + file + ":" + line);
		}

		if (love.keyboard.isDown("f8")) {
			const file = this.errorTraceback?.trace.get(0)?.tracebackLua.filename;
			const line = this.errorTraceback?.trace.get(0)?.tracebackLua.lineNumber;
			os.execute("code --goto " + love.filesystem.getSourceBaseDirectory() + "/build/" + file + ":" + line);
		}
	}

	draw(gameContext: GameContext, args: DrawEventArgs): void {
		love.graphics.print("Hello I am the Workspace\nPress F5 to reload Game\nPress F6 to cause error)");

		love.graphics.setCanvas(this.canvas);
		love.graphics.clear();

		const [success, errorTraceback] = this.virtualGame.draw(gameContext, args);
		if (!success) {
			this.errorTraceback = errorTraceback as ErrorTraceback;
		}

		love.graphics.setCanvas();

		love.graphics.rectangle("line", 0, 360, 640, 640);
		love.graphics.draw(this.canvas, 0, 360);

		if (this.errorTraceback) {
			love.graphics.printf(this.errorTraceback.error, 0, 0, 640, "right");

			for (const [i,trace] of this.errorTraceback.trace.values()) {
				love.graphics.printf(trace.tracebackTS.filename + ":" + trace.tracebackTS.lineNumber, 0, (i - 1) * 14 + 20, 640, "right");
			}
		}
		
	}

	quit(gameContext: GameContext, args: QuitEventArgs): void {
		const [success, errorTraceback] = this.virtualGame.quit(gameContext, args);
		if (!success) {
			this.errorTraceback = errorTraceback as ErrorTraceback;
		}
	}
}
*/