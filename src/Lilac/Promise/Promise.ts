import BasicAllocator, { IBasicAllocatable } from "Lilac/Allocators/BasicAllocator";
import Event from "Lilac/Events/Event";
import Exception from "Lilac/Exceptions/Exception";
import BasePromise from "./BasePromise";

export default class Promise<T> extends BasePromise implements IBasicAllocatable {
	private static allocator: BasicAllocator<typeof Promise, Promise<unknown>> = new BasicAllocator(Promise, 100);

	private _value?: T;
	public get value(): T | undefined {
		return this._value;
	}

	private _reason?: Exception;
	public get reason(): Exception | undefined {
		return this._reason;
	}

	private fulfilled: Event<T, Promise<T>>;
	private rejected: Event<Exception, Promise<T>>;

	private _allocated: boolean;
	public get allocated(): boolean {
		return this._allocated;
	}

	public constructor() {
		super()

		this.fulfilled = new Event();
		this.rejected = new Event();

		this._allocated = false;
	}

	static new<Y>(): Promise<Y> {
		const promise = Promise.allocator.get();

		return promise as Promise<Y>;
	}

	public fulfill(value: T): boolean {
		if (this.isSettled())
			return false;

		this._value = value;
		this.fulfilled.invoke(value, this);

		return true;
	}

	public reject(reason: Exception): boolean {
		if (this.isSettled())
			return false;

		this._reason = reason;
		this.rejected.invoke(reason, this);

		return true;
	}

	public then<H extends (this: H, value: T, promise: Promise<T>) => void>(callback: H, target: ThisParameterType<H>): this {
		this.fulfilled.addListener(callback, target);

		return this;
	}

	public catch<H extends (this: H, reason: Exception, promise: Promise<T>) => void>(callback: H, target: ThisParameterType<H>): this {
		this.rejected.addListener(callback, target);

		return this;
	}

	public free(): boolean {
		if (!this.allocated)
			return false;

		Promise.allocator.free(this as Promise<unknown>);

		return true;
	}
}