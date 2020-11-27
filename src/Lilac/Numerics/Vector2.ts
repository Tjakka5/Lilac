import TemporaryAllocator, { ITemporaryAllocatable } from "Lilac/Allocators/TemporaryAllocator";
import ITostring from "Lilac/Interfaces/ITostring";

export interface IVector2 {
	x: number;
	y: number;

	/*
	xy: Vector2;
	yx: Vector2;

	readonly xx: Vector2;
	readonly yy: Vector2;
	*/
}

export default class Vector2 implements IVector2, ITemporaryAllocatable, ITostring {
	private static allocator: TemporaryAllocator<typeof Vector2, Vector2> = new TemporaryAllocator(Vector2, 200);

	private _persistent = false;
	get persistent(): boolean { return this._persistent; }

	public x: number;
	public y: number;

	get xx(): Vector2 { return Vector2.new(this.x, this.x); }

	set xy(value: Vector2) { this.x = value.x; this.y = value.y; }
	get xy(): Vector2 { return Vector2.new(this.x, this.y); }

	get yx(): Vector2 { return Vector2.new(this.y, this.x); }
	set yx(value: Vector2) { this.y = value.x; this.x = value.y; }

	get yy(): Vector2 { return Vector2.new(this.y, this.y); }
	
	constructor(x = 0, y = 0) {
		this.x = x;
		this.y = y;

		this._persistent = false;
	}

	static new(x = 0, y = 0): Vector2 {
		const vector2 = Vector2.allocator.get(x, y);

		vector2.x = x;
		vector2.y = y;
		
		return vector2;
	}
	
	persist(): boolean {
		if (this._persistent)
			return false;

		this._persistent = true;
		Vector2.allocator.persist(this);
		
		return true;
	}

	free(): boolean {
		if (!this.persistent)
			return false;

		this._persistent = false;
		Vector2.allocator.free(this);
		
		return true;
	}

	clone(out = Vector2.new(0, 0)): Vector2 {
		out.x = this.x;
		out.y = this.y;

		return out;
	}

	add(other: Vector2, out = Vector2.new(0, 0)): Vector2 {
		out.x = this.x + other.x;
		out.y = this.y + other.y;
		
		return out;
	}

	tostring(): string {
		return `Vector2: [${this.x}, ${this.y}]`;
	}
}