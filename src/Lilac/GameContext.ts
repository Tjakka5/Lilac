import Vector2 from "./Numerics/Vector2";

export type GameContext = {
	frame: number;
	uptime: number;

	screenDimensions: Vector2;
}