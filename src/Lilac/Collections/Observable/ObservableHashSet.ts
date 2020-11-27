import Event from "Lilac/Events/Event";
import HashSet from "../HashSet";
import IObservableHashSet from "./IObservableHashSet";

export default class ObservableHashSet<T> extends HashSet<T> implements IObservableHashSet<T> {
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

	add(element: T): boolean {
		const success = super.add(element);

		if (success)
			this.added.invoke(element);

		return success;
	}

	remove(element: T): boolean {
		const success = super.remove(element);

		if (success)
			this.added.invoke(element);

		return success;
	}

	clear() : void {
		this.clearing.invoke();

		super.clear();

		this.cleared.invoke();
	}
}