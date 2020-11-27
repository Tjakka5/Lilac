import { luaTableIpairs } from "Lilac/Utility/Utils";
import IStack from "./IStack";
import IReadOnlyTable from "./ReadOnly/IReadOnlyTable";

export default class Stack<T> implements IStack<T> {
	protected readonly _elements: Table<number, T>;
	readonly elements: IReadOnlyTable<number, T>;

	protected _count: number;
	get count(): number {
		return this._count;
	}

	constructor() {
		this._elements = new Table();
		this.elements = this._elements as IReadOnlyTable<number, T>;

		this._count = 0;
	}

	values(): LuaTupleIterable<[number, T]>
	/** @tupleReturn */
	values(): any {
		return luaTableIpairs(this._elements);
	}

	push(element: T): void {
		this._elements.set(this._count, element);

		this._count++;
	}

	pop(): T | undefined {
		if (this._count > 0) {
			this._count--;

			const element = this._elements.get(this._count)!;
			this._elements.set(this._count, undefined);

			return element;
		}

		return undefined;
	}

	peek(): T | undefined {
		return this._elements.get(this._count)!;
	}

	clear(): void {
		for (const [index,] of this.values()) {
			this._elements.set(index, undefined);
		}
	}
}