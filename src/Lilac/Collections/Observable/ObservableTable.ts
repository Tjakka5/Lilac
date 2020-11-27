import Event from "Lilac/Events/Event";
import IObservableCollection from "./IObservableCollection";

export default class ObservableTable<K, V> implements IObservableCollection<V> {
	private table: Table<K, V>;
	
	added: Event<V>;
	removed: Event<V>;
	clearing: Event;
	cleared: Event;

	get length(): number {
		return this.table.length;
	}

	constructor() {
		this.table = new Table();

		this.added = new Event();
		this.removed = new Event();
		this.clearing = new Event();
		this.cleared = new Event();
	}

	get(key: K): V | undefined {
		return this.table.get(key);
	}

	set(key: K, value: V | undefined): void {
		const oldValue = this.get(key)

		if (oldValue)
			this.removed.invoke(oldValue);

		this.set(key, value);

		if (value)
			this.added.invoke(value);
	}
}