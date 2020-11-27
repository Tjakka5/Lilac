import Event from "Lilac/Events/Event";
import Stack from "../Stack";
import IObservableStack from "./IObservableStack";

export default class ObservableStack<T> extends Stack<T> implements IObservableStack<T> {
	pushed: Event<T>;
	popped: Event<T>;
	clearing: Event;
	cleared: Event;

	constructor() {
		super();

		this.pushed = new Event();
		this.popped = new Event();
		this.clearing = new Event();
		this.cleared = new Event();
	}
	

	push(element: T): void {
		super.push(element);

		this.pushed.invoke(element);
	}

	pop(): T | undefined {
		const element = super.pop();

		if (element)
			this.popped.invoke(element);

		return element;
	}
	
	clear(): void {
		this.clearing.invoke();

		super.clear();

		this.cleared.invoke();
	}
}