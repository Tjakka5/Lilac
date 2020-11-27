import { luaTableIpairs } from "Lilac/Utility/Utils";
import IList from "./IList";
import IReadOnlyTable from "./ReadOnly/IReadOnlyTable";

export default class List<T> implements IList<T> {
	protected readonly _elements: Table<number, T>;
	readonly elements: IReadOnlyTable<number, T>;

	protected _count: number;
	get count(): number { return this._count; }

	constructor() {
		this._elements = new Table();
		this.elements = this._elements as IReadOnlyTable<number, T>

		this._count = 0;
	}

	values(): LuaTupleIterable<[number, T]>
	/** @tupleReturn */
	values(): any {
		return luaTableIpairs(this._elements);
	}

	add(element: T): void {
		this._elements.set(this._count + 1, element);

		this._count++;
	}

	get(index: number): T | undefined {
		return this._elements.get(index + 1);
	}

	remove(element: T): boolean {
		for (let index = 0; index < this._count; index++) {
			if (this._elements.get(index + 1) == element) {
				/** @ts-ignore */
				table.remove(this._elements, index);
				this._count--;

				return true;
			}
		}

		return false;
	}

	removeAt(index: number): T | undefined {
		/** @ts-ignore */
		const element = table.remove(this._elements, index + 1) as T | undefined;

		if (element)
			this._count--;

		return element;
	}

	insert(index: number, element: T): void {
		/** @ts-ignore */
		table.insert(this._elements, index + 1, element);

		this._count++;
	}

	indexOf(element: T): number {
		for (let index = 0; index < this._elements.length; index++) {
			if (this._elements.get(index + 1) == element) {
				return index;
			}
		}

		return -1;
	}

	has(element: T): boolean {
		return this.indexOf(element) != -1;
	}

	clear(): void {
		for (const [index,] of this.values()) {
			this._elements.set(index, undefined);
		}

		this._count = 0;
	}

	public slice(from: number, out = new List<T>()): List<T> {
		out.clear();

		for (let i = from; i < this.count; i++)
			out.add(this.get(i)!);

		return out;
	} 
}