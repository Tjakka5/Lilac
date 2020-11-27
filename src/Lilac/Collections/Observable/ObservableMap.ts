import Event from "Lilac/Events/Event";
import Map from "../Map";
import IObservableMap from "./IObservableMap";

export default class ObservableMap<K, V> extends Map<K, V> implements IObservableMap<K, V> {
	added: Event<K, V>;
	removed: Event<K, V>;
	clearing: Event;
	cleared: Event;

	constructor() {
		super();

		this.added = new Event();
		this.removed = new Event();
		this.clearing = new Event();
		this.cleared = new Event();
	}

	add(key: K, value: V): boolean {
		const success = super.add(key, value);

		if (success)
			this.added.invoke(key, value);

		return success;
	}

	remove(key: K): V | undefined {
		const element = super.remove(key);

		if (element)
			this.removed.invoke(key, element);

		return element;
	}

	clear(): void {
		this.clearing.invoke();

		super.clear();

		this.cleared.invoke();
	}
}