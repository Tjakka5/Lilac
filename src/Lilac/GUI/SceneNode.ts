import ISparseSet from "Lilac/Collections/ISparseSet";
import IReadOnlySparseSet from "Lilac/Collections/ReadOnly/IReadOnlySparseSet";
import SparseSet from "Lilac/Collections/SparseSet";
import Event from "Lilac/Events/Event";
import { DrawEventArgs, MousePressedEventArgs, MouseReleasedEventArgs, QuitEventArgs as QuittingEventArgs, UpdateEventArgs } from "Lilac/Events/EventArgs";
import { GameContext } from "Lilac/GameContext";
import Vector2 from "Lilac/Numerics/Vector2";

export interface IUpdateNode {
	readonly updating: Event<UpdateEventArgs, GameContext>;
}

export interface IDrawNode {
	readonly drawing: Event<DrawEventArgs, GameContext>;
}

export interface IMousePressNode {
	readonly mousePressed: Event<MousePressedEventArgs, GameContext>;
}

export interface IMouseReleaseNode {
	readonly mouseReleased: Event<MouseReleasedEventArgs, GameContext>;
}

export interface IQuitNode {
	readonly quitting: Event<QuittingEventArgs, GameContext>;
}

export interface IAllEventsNode extends 
	IUpdateNode, 
	IDrawNode, 
	IMousePressNode, 
	IMouseReleaseNode, 
	IQuitNode { }

export class BaseSceneNode {
	protected _children: ISparseSet<BaseSceneNode>;
	public get children(): IReadOnlySparseSet<BaseSceneNode> {
		return this._children;
	}

	protected _localPosition: Vector2;
	public get localPosition(): Vector2 {
		return this._localPosition;
	}

	protected get worldPosition(): Vector2 {
		return this._localPosition.clone();
	}

	constructor(localPosition: Vector2 = Vector2.new(0, 0)) {
		this._children = new SparseSet();
		this._localPosition = localPosition;
	}
}

export default class SceneNode<T extends BaseSceneNode> extends BaseSceneNode {
	protected _parent: T | undefined;
	public get parent(): T | undefined {
		return this._parent;
	}
	
	public setParent(parent: T): boolean {
		const success = parent["_children"].add(this);

		if (success) {
			this._parent = parent;
			this.enable(parent);
		}

		return success;
	}

	protected enable(parent: T): void {}
	protected disable(parent: T): void {}
}