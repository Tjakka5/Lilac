import List from "Lilac/Collections/List";
import Event, { EventHandle } from "Lilac/Events/Event";
import { DrawEventArgs, UpdateEventArgs } from "Lilac/Events/EventArgs";
import { Functional } from "Lilac/Functional/Functional";
import { GameContext } from "Lilac/GameContext";
import AbsoluteWidthConstraint from "Lilac/GUI/Constraints/AbsoluteWidthConstraint";
import Container from "Lilac/GUI/Container";
import { BaseSceneNode, IDrawNode, IUpdateNode } from "Lilac/GUI/SceneNode";
import Vector2 from "Lilac/Numerics/Vector2";
import Runtime from "Lilac/Runtime";

const source = new List<number>();
source.add(1);
source.add(2);
source.add(3);

const list = Functional.fromRange(0);
const a = Functional.take(Functional.filter(list(), (value: number) => { print("Checked: " + value); return value == 5 } )(), 1);
Functional.printList(a());

class Window extends Container implements IUpdateNode, IDrawNode {
	private updateHandle?: EventHandle; 
	private drawHandle?: EventHandle; 
	private clickHandle?: EventHandle;

	public readonly updating: Event<UpdateEventArgs, GameContext> = new Event();
	public readonly drawing: Event<DrawEventArgs, GameContext> = new Event();

	public enable(parent: BaseSceneNode & IUpdateNode & IDrawNode): void {
		this.updateHandle = parent.updating.addListener((): void => {}, undefined); 
		this.drawHandle = parent.drawing.addListener(this.onDraw, this);
		//this.clickHandle = parent.mousePressing.addListener(this.onMousePressed, this);
	}

	protected disable(parent: BaseSceneNode & IUpdateNode & IDrawNode): void {
		if (this.drawHandle)
			parent.drawing.removeListener(this.drawHandle);

		//if (this.clickHandle)
		//parent.mousePress.removeListener(this.clickHandle);
	}

	protected onDraw(): void {
		love.graphics.rectangle("fill", this.worldPosition.x, this.worldPosition.y, this.getWidth(), this.getHeight())
	}

	protected onMousePressed(): void {

	}
}

export default class Game extends Runtime {
	protected onLoad(): void {
		const myWindow = new Window(new Vector2(0, 0), new AbsoluteWidthConstraint(100));
		myWindow.setParent(this);
	}
}