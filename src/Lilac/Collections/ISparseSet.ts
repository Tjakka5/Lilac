import IReadOnlySparseSet from "./ReadOnly/IReadOnlySparseSet";

export default interface ISparseSet<T> extends IReadOnlySparseSet<T> {
	add(element: T): boolean;
	remove(element: T): boolean;
	clear(): void;
}