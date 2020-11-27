import { luaTablePairs } from "Lilac/Utility/Utils";
import IMap from "./IMap";
import IReadOnlyTable from "./ReadOnly/IReadOnlyTable";

export default class Map<K, V> implements IMap<K, V> {
	protected readonly _elements: Table<K, V>;
	readonly elements: IReadOnlyTable<K, V>;

	protected _count: number;
	get count(): number { return this._count; }

	constructor() {
		this._elements = new Table();
		this.elements = this._elements as IReadOnlyTable<K, V>
		
		this._count = 0;
	}

	values(): LuaTupleIterable<[K, V]>
	/** @tupleReturn */
	values(): any {
		return luaTablePairs(this._elements);
	}

	add(key: K, value: V): boolean {
		if (this._elements.get(key) == undefined) {
			this._elements.set(key, value);
			this._count++;

			return true;
		}

		return false;
	}

	get(key: K): V | undefined {
		return this._elements.get(key);
	}
	
	remove(key: K): V | undefined {
		const element = this._elements.get(key);

		if (element) {
			this._elements.set(key, undefined);
			this._count--;
		}

		return element;
	}

	// TODO: Add removeByValue

	has(value: V): boolean {
		for (const [, element] of this.values()) {
			if (element == value)
				return true;
		}

		return false;
	}

	hasKey(key: K): boolean {
		return this._elements.get(key) != undefined;
	}

	clear(): void {
		for (const [key,] of this.values()) {
			this._elements.set(key, undefined);
		}

		this._count--;
	}
}