import ICollection from "../ICollection";

export default interface IReadOnlyList<T> extends ICollection<number, T> {
	readonly count: number;

	values(): LuaTupleIterable<[number, T]>;
	values(): any;

	get(index: number): T | undefined;
	indexOf(element: T): number;
	has(element: T): boolean;
}