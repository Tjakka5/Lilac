import ICollection from "../ICollection";

export default interface IReadOnlyStack<T> extends ICollection<number, T> {
	readonly count: number;

	values(): LuaTupleIterable<[number, T]>;
	values(): any;

	peek() : T | undefined;
}