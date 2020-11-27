import IReadOnlyMap from "./ReadOnly/IReadOnlyMap";

export default interface IMap<K, V> extends IReadOnlyMap<K, V> {
	add(key: K, value: V): boolean;
	remove(key: K): V | undefined;
	clear(): void;
}