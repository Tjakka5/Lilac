import { luaTablePairs } from "Lilac/Utility/Utils";
import IReadOnlyHashSet from "./ReadOnly/IReadOnlyHashSet";
import IReadOnlyTable from "./ReadOnly/IReadOnlyTable";

export default class HashSet<T> implements IReadOnlyHashSet<T> {
	protected readonly _elements: Table<T, T>;
	readonly elements: IReadOnlyTable<T, T>;

	protected _count: number;
	get count(): number { return this._count; }

	constructor() {
		this._elements = new Table();
		this.elements = this._elements as IReadOnlyTable<T, T>;
		
		this._count = 0;
	}

	values(): LuaTupleIterable<[T, T]>
	/** @tupleReturn */
	values(): any {
		return luaTablePairs(this._elements);
	}

	add(element: T): boolean {
		if (this.has(element))
			return false;

		this._elements.set(element, element);
		this._count++;

		return true;
	}

	remove(element: T): boolean {
		if (!this.has(element))
			return false;

		this._elements.set(element, undefined);
		this._count--;

		return true;
	}

	has(element: T): boolean {
		return this._elements.get(element) != undefined;
	}

	clear(): void {
		for (const [key,] of this.values()) {
			this._elements.set(key, undefined);
		}
		this._count--;
	}
}