import IReadOnlyList from "./ReadOnly/IReadOnlyList";

export default interface IList<T> extends IReadOnlyList<T> {
	add(element: T): void;
	remove(element: T): boolean
	removeAt(index: number): T | undefined
	insert(index: number, element: T): void;
	clear(): void;
}