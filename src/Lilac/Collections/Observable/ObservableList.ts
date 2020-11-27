import Event from "Lilac/Events/Event";
import List from "../List";
import IObservableList from "./IObservableList";

export default class ObservableList<T> extends List<T> implements IObservableList<T> {
	added: Event<T>;
	removed: Event<T>;
	clearing: Event;
	cleared: Event;

	constructor() {
		super();

		this.added = new Event();
		this.removed = new Event();
		this.clearing = new Event();
		this.cleared = new Event();
	}

	add(element: T): void {
		super.add(element);

		this.added.invoke(element);
	}

	remove(element: T): boolean {
		const success = super.remove(element);

		if (success)
			this.removed.invoke(element);

		return success;
	}

	/** @tupleReturn */
	removeAt(index: number): T | undefined {
		const element = super.removeAt(index);

		if (element)
			this.removed.invoke(element!);
	
		return element;
	}

	clear(): void {
		this.clearing.invoke();

		super.clear();

		this.cleared.invoke();
	}
}