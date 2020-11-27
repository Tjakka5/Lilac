import SparseSet from "Lilac/Collections/SparseSet";
import { EventHandle } from "Lilac/Events/Event";
import { DrawEventArgs } from "Lilac/Events/EventArgs";
import EventGroup from "Lilac/Events/EventGroup";

export default abstract class Entity {
	private children: SparseSet<Entity>;	

	private drawHandle?: EventHandle;

	protected rootEventGroup?: EventGroup;

	constructor() {
		this.children = new SparseSet();
	}

	preload(eventGroup: EventGroup): void {
		this.rootEventGroup = eventGroup;
	}

	abstract load(): void;
	abstract unload(): void;

	addChild(child: Entity): void {
		//child.load();
	}

	registerDraw(func: (this: any, eventData: DrawEventArgs) => void): void {
		this.drawHandle = this.rootEventGroup!.draw.addListener(func, this); 
	}

	unregisterDraw(): void {
		this.rootEventGroup!.draw.removeListener(this.drawHandle!);
		this.drawHandle = undefined;
	}
}