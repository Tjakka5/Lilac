
// enum ActivityState {
// 	Running,
// 	Paused,
// } 

// export default class VirtualGame {
// 	private game: Game;
// 	private sandbox: Table<any, any>;
// 	private gameContext: GameContext;
// 	private activityState: ActivityState; 

// 	constructor(size: Vector2) {
// 		this.sandbox = new Table();
// 		for (const [key, value] of pairs(_G)) {
// 			this.sandbox.set(key, value);
// 		}

// 		this.gameContext = {
// 			frame: 0,
// 			uptime: 0,
// 			screenDimensions: size, // TODO: size.copy
// 		}

// 		this.activityState = ActivityState.Running;

// 		this.game = this.makeGameInSandbox();
// 	}

// 	load() {
// 		this.game.load();
// 	}

// 	unload() {
// 		this.game.unload();
// 	}

// 	reload() {
// 		this.game.unload();
		
// 		this.game = this.makeGameInSandbox();

// 		const gameContext = this.gameContext;
// 		gameContext.frame = 0;
// 		gameContext.uptime = 0;

// 		this.game.load();
// 	}

// 	private makeGameInSandbox(): Game {
// 		return setfenv((): Game => {
// 			return new Game();
// 		}, this.sandbox)();
// 	}

// 	/** @luaTuple */
// 	update(_parentGameContext: GameContext, args: UpdateEventArgs): [boolean, void | ErrorTraceback] {
// 		if (this.activityState == ActivityState.Running) {
// 			const gameContext = this.gameContext;
// 			gameContext.frame++;
// 			gameContext.uptime += args.dt;

// 			return xpcall(this.game.update, getErrorTraceback, this.game, this.gameContext, args);
// 		}

// 		return [true, undefined];
// 	}

// 	/** @luaTuple */
// 	draw(_parentGameContext: GameContext, args: DrawEventArgs): [boolean, void | ErrorTraceback]  {
// 		if (this.activityState == ActivityState.Running) {
// 			return xpcall(this.game.draw, getErrorTraceback, this.game, this.gameContext, args);
// 		}

// 		return [true, undefined];
// 	}

// 	/** @luaTuple */
// 	quit(_parentGameContext: GameContext, args: QuitEventArgs): [boolean, void | ErrorTraceback]  {
// 		return xpcall(this.game.quit, getErrorTraceback, this.game, this.gameContext, args);
// 	}
// }