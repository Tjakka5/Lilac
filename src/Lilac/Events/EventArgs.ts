import Vector2 from "Lilac/Numerics/Vector2";

export interface UpdateEventArgs {
	frame: number;
	dt: number;
}

export interface DrawEventArgs {
	frame: number;
}

export interface MousePressedEventArgs {
	position: Vector2;
	button: 1 | 2 | 3;
	isTouch: boolean;
	pressed: number;
}

export interface MouseReleasedEventArgs {
	position: Vector2;
	button: 1 | 2 | 3;
	isTouch: boolean;
	pressed: number;
}

export interface QuitEventArgs {
	cancelled: boolean;
}