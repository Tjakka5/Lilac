import { Math } from "Lilac/Math";
import IWidthConstraint from "./IWidthConstraint";

export class MinWidthConstraint implements IWidthConstraint {
	private a: IWidthConstraint;
	private b: IWidthConstraint;

	private progress: number;

	constructor(a: IWidthConstraint, b: IWidthConstraint, progress: number) {
		this.a = a;
		this.b = b;

		this.progress = progress;
	}

	public getWidth(): number {
		return Math.lerpUnclamped(this.a.getWidth(), this.b.getWidth(), this.progress);
	}
}