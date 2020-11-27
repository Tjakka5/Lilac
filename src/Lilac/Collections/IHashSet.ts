import IReadOnlyHashSet from "./ReadOnly/IReadOnlyHashSet";

export default interface IHashSet<T> extends IReadOnlyHashSet<T> {
	add(element: T): boolean;
	clear(): void;
}