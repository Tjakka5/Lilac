import Vector2 from "Lilac/Numerics/Vector2";
import IWidthConstraint from "./Constraints/IWidthConstraint";
import IContainer from "./IContainer";
import SceneNode, { BaseSceneNode } from "./SceneNode";

export default class Container extends SceneNode<BaseSceneNode> implements IContainer {
	private widthConstraint: IWidthConstraint;
	
	constructor(localPosition: Vector2, widthConstraint: IWidthConstraint) {
		super(localPosition);
		
		this.widthConstraint = widthConstraint;
	}
	
	getWidth(): number {
		return this.widthConstraint.getWidth();
	}

	getHeight(): number {
		return 100;
	}
}