import List from "Lilac/Collections/List";
import SparseSet from "Lilac/Collections/SparseSet";
import Stack from "Lilac/Collections/Stack";

const DEFAULT_ITEM_COUNT = 100;

export interface ITemporaryAllocatable {
	readonly persistent: boolean;

	persist(): boolean;
	free(): boolean;
}

export const temporaryAllocators: List<BaseTemporaryAllocator> = new List();

abstract class BaseTemporaryAllocator {
	constructor() {
		temporaryAllocators.add(this);
	}

	abstract clean(): void;
}

export default class TemporaryAllocator<TClass extends ClassType<TInstance>, TInstance = InstanceType<TClass>> extends BaseTemporaryAllocator {
	private ctor: TClass;

	private freeItems: Stack<TInstance> = new Stack();
	private allocatedItems: SparseSet<TInstance> = new SparseSet();

	constructor(ctor: TClass, count: number = DEFAULT_ITEM_COUNT, ...args: unknown[]) {
		super();

		this.ctor = ctor;

		for (let i = 0; i < count; i++)
		{
			const item = new this.ctor(args);
			this.freeItems.push(item);
		}
	}

	get(...args: Vararg<ConstructorParameters<TClass>>): TInstance {
		const item = this.freeItems.pop();

		if (item) {
			this.allocatedItems.add(item);
			return item!;
		} else {
			return new this.ctor(...args);
		}
	}

	persist(item: TInstance): void {
		this.allocatedItems.remove(item);
	}

	free(item: TInstance): void {
		this.freeItems.push(item);
	}

	clean(): void {
		for (const [,item] of this.allocatedItems.values())
			this.freeItems.push(item);

		this.allocatedItems.clear();
	}
}