import IReadOnlyTable from "./ReadOnly/IReadOnlyTable";

export default interface ICollection<K, V> {
	readonly elements: IReadOnlyTable<K, V>;
	readonly count: number;

	values(): LuaTupleIterable<[K, V]>;
	/** @tupleReturn */
	values(): any;
}