import Stack from "Lilac/Collections/Stack";

const DEFAULT_ITEM_COUNT = 100;

export interface IBasicAllocatable {
	readonly allocated: boolean;

	free(): boolean;
} 

export default class BasicAllocator<TClass extends ClassType<TInstance>, TInstance = InstanceType<TClass>> {
	private ctor: TClass;

	private freeItems: Stack<TInstance> = new Stack();

	constructor(ctor: TClass, count: number = DEFAULT_ITEM_COUNT, ...args: unknown[]) {
		this.ctor = ctor;

		for (let i = 0; i < count; i++)
		{
			const item = new this.ctor(args);
			this.freeItems.push(item);
		}
	}

	get(...args: any[]): TInstance {
		const item = this.freeItems.pop();

		if (item) {
			return item!;
		} else {
			return new this.ctor(args);
		}
	}

	free(item: TInstance): void {
		this.freeItems.push(item);
	}
}