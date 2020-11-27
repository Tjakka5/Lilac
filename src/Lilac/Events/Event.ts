import SparseSet from "../Collections/SparseSet";

// eslint-disable-next-line @typescript-eslint/ban-types
export type EventHandle = {}

type Handler<T, Y, U, I, O, P> = (this: any, a: T, b: Y, c: U, d: I, e: O, f: P) => void

export default class Event<T = void, Y = void, U = void, I = void, O = void, P = void> {
	private listeners: SparseSet<{func: (a: T, b: Y, c: U, d: I, e: O, f: P) => void, target: any}> = new SparseSet();

	// eslint-disable-next-line @typescript-eslint/explicit-module-boundary-types
	addListener<H extends Handler<T, Y, U, I, O, P>>(func: H, target: ThisParameterType<H>): EventHandle {
		const handle = {
			func: func,
			target: target,
		}
		
		this.listeners.add(handle);

		return handle;
	}

	removeListener(eventHandle: EventHandle): boolean {
		return this.listeners.remove(eventHandle as {func: (eventData: T) => void, target: any});
	}

	invoke(a: T, b: Y, c: U, d: I, e: O, f: P): void {
		for (const [,listener] of this.listeners.values()) {
			listener.func.call(listener.target, a, b, c, d, e, f);
		}
	}
}