import { QuitEventArgs } from "Lilac/Events/EventArgs";
import { GameContext } from "Lilac/GameContext";

export default interface IQuit {
	quit(gameContext: GameContext, args: QuitEventArgs): void;
}