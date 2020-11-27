import { UpdateEventArgs } from "Lilac/Events/EventArgs";
import { GameContext } from "Lilac/GameContext";

export interface IUpdate {
	update(gameContext: GameContext, args: UpdateEventArgs): void;
}