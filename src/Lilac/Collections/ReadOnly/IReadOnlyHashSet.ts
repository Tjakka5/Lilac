import ICollection from "../ICollection";

export default interface IReadOnlyHashSet<T> extends ICollection<T, T> {
	readonly count: number;

	values(): LuaTupleIterable<[T, T]>;
	values(): any;

	has(element: T): boolean;
}