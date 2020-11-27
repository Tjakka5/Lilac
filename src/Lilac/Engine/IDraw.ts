import { DrawEventArgs } from "Lilac/Events/EventArgs";
import { GameContext } from "Lilac/GameContext";

export default interface IDraw {
	draw(gameContext: GameContext, args: DrawEventArgs): void;
}