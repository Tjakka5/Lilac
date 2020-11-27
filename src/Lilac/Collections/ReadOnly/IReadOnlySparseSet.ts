import ICollection from "../ICollection";

export default interface IReadOnlySparseSet<T> extends ICollection<number, T> {
	readonly count: number;

	values(): LuaTupleIterable<[number, T]>;
	values(): any;

	get(index: number): T | undefined;
	has(element: T): boolean;
}