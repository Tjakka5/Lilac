import Event from "./Event";

export default class Property<T> {
	private value: T;

	public changed: Event<T, T>;

	constructor (value: T) {
		this.value = value;

		this.changed = new Event();
	}
	
	set(value: T): void {
		if (this.value != value) {
			const oldValue = this.value;

			this.value = value;

			this.changed.invoke(value, oldValue);
		}
	}

	get(): T {
		return this.value;
	}
}