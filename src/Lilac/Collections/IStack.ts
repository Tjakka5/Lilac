import IReadOnlyStack from "./ReadOnly/IReadOnlyStack";

export default interface IStack<T> extends IReadOnlyStack<T> {
	push(element: T): void;
	pop(): T | undefined;
	
	clear(): void;
}