import IWidthConstraint from "./IWidthConstraint";

export default class AbsoluteWidthConstraint implements IWidthConstraint {
	private width: number;

	constructor(width: number) {
		this.width = width;
	}

	public getWidth(): number {
		return this.width;
	}
}