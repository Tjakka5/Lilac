
import IContainer from "../IContainer";
import IWidthConstraint from "./IWidthConstraint";

export default class AbsoluteWidthContraint implements IWidthConstraint {
	private container: IContainer;
	private fraction: number;

	constructor(container: IContainer, fraction: number) {
		this.container = container;
		this.fraction = fraction;
	}

	public getWidth(): number {
		return this.container.getWidth() * this.fraction;
	}
}