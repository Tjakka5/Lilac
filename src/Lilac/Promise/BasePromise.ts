import { PromiseState } from "./PromiseState";

export default abstract class BasePromise {
	private _promiseState: PromiseState;
	get promiseState(): PromiseState {
		return this._promiseState;
	}

	public constructor() {
		this._promiseState = PromiseState.Pending;
	}

	public isSettled(): boolean {
		return this._promiseState != PromiseState.Pending;
	}
}