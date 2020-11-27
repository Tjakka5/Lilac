import ICollection from "../ICollection";

export default interface IReadOnlyMap<K, V> extends ICollection<K, V> {
	readonly count: number;

	values(): LuaTupleIterable<[K, V]>;
	values(): any;

	get(key: K): V | undefined;
	has(value: V): boolean;
	hasKey(key: K): boolean;
}