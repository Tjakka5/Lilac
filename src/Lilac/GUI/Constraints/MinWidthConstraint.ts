import { Math } from "Lilac/Math";
import IWidthConstraint from "./IWidthConstraint";

export class MinWidthConstraint implements IWidthConstraint {
	private a: IWidthConstraint;
	private b: IWidthConstraint;

	constructor(a: IWidthConstraint, b: IWidthConstraint) {
		this.a = a;
		this.b = b;
	}

	public getWidth(): number {
		return Math.min(this.a.getWidth(), this.b.getWidth());
	}
}