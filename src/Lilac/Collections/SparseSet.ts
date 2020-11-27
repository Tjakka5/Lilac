import { luaTableIpairs } from "Lilac/Utility/Utils";
import ISparseSet from "./ISparseSet";
import IReadOnlyTable from "./ReadOnly/IReadOnlyTable";

export default class SparseSet<T> implements ISparseSet<T> {
	protected readonly sparse: Table<T, number>;
	protected readonly dense: Table<number, T>;

	readonly elements: IReadOnlyTable<number, T>;

	readonly count: number; // TODO: Implement count

	constructor() {
		this.sparse = new Table();
		this.dense = new Table();
		
		this.elements = this.dense as IReadOnlyTable<number, T>;

		this.count = 0;
	}
	values(): LuaTupleIterable<[number, T]>
	/** @tupleReturn */
	values(): any {
		return luaTableIpairs(this.dense);
	}

	add(element: T): boolean {
		if (this.sparse.get(element))
			return false;

		const index = this.dense.length + 1;

		this.sparse.set(element, index);
		this.dense.set(index, element);

		return true;
	}

	get(index: number): T | undefined {
		return this.dense.get(index);
	}

	remove(element: T): boolean {
		const index = this.sparse.get(element);

		if (index == undefined)
			return false;

		const size = this.dense.length;

		if (index == size) {
			this.dense.set(index, undefined);
		} else {
			const other = this.dense.get(size)!;

			this.dense.set(index, other);
			this.sparse.set(other, index);

			this.dense.set(size, undefined);
		}

		this.sparse.set(element, undefined);

		return true;
	}

	has(element: T): boolean {
		return this.sparse.get(element) != undefined;
	}

	clear(): void {
		for (const [index, element] of this.values()) {
			this.dense.set(index, undefined);
			this.sparse.set(element, undefined);
		}
	}
}