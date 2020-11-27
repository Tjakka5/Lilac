import TemporaryAllocator, { ITemporaryAllocatable } from "Lilac/Allocators/TemporaryAllocator";
import ITostring from "Lilac/Interfaces/ITostring";
import { IVector2 } from "./Vector2";

export interface IVector3 extends IVector2 {
	z: number;

	/*
	xyz: number;
	xzy: number;
	yxz: number;
	yzx: number;
	zxy: number;
	zyx: number;
	*/
}

export default class Vector3 implements IVector3, ITemporaryAllocatable, ITostring {
	private static allocator: TemporaryAllocator<typeof Vector3, Vector3> = new TemporaryAllocator(Vector3, 200);

	private _persistent = false;
	public get persistent(): boolean { return this._persistent; }

	public x: number;
	public y: number;
	public z: number;
	
	public constructor(x = 0, y = 0, z = 0) {
		this.x = x;
		this.y = y;
		this.z = z;

		this._persistent = false;
	}

	public static new(x = 0, y = 0, z = 0): Vector3 {
		const vector3 = Vector3.allocator.get(x, y, z);

		vector3.x = x;
		vector3.y = y;
		vector3.z = z;
		
		return vector3;
	}

	public persist(): boolean {
		if (this._persistent)
			return false;

		this._persistent = true;
		Vector3.allocator.persist(this);
		
		return true;
	}

	public free(): boolean {
		if (!this.persistent)
			return false;

		this._persistent = false;
		Vector3.allocator.free(this);
		
		return true;
	}

	public clone(out = Vector3.new(0, 0, 0)): Vector3 {
		out.x = this.x;
		out.y = this.y;
		out.z = this.z;

		return out;
	}

	tostring(): string {
		return `Vector3: [${this.x}, ${this.y}, ${this.z}]`;
	}
}