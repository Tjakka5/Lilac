import IList from "Lilac/Collections/IList";
import List from "Lilac/Collections/List";
import { UpdateEventArgs } from "Lilac/Events/EventArgs";
import Coroutine from "./Coroutine";
import { YieldType } from "./YieldType";

export default class Scheduler {
	public static readonly instance: Scheduler = new Scheduler();

	private static dispatcher: LuaThread;

	private static activeDispatchers: IList<LuaThread>;

	// eslint-disable-next-line @typescript-eslint/no-empty-function
	private constructor() {
		Scheduler.dispatcher = coroutine.create((func: (coroutineContext: Coroutine) => any, target: any) => {
			const coroutineContext = new Coroutine();

			func.call(target, coroutineContext);
		});

		Scheduler.activeDispatchers = new List<LuaThread>();
	}	

	public static schedule<H>(coroutineFunction: (coroutineContext: Coroutine) => any, target: ThisParameterType<H>): void {
		const [_, yieldType] = coroutine.resume(Scheduler.dispatcher, coroutineFunction, target);

		switch (yieldType as YieldType) {
		case YieldType.Update:
			this.activeDispatchers.add(Scheduler.dispatcher);
			break;
		default:
			break; 
		}
	}

	public static update(args: UpdateEventArgs): void {
		for (const [,dispatcher] of Scheduler.activeDispatchers.values()) {
			//dispatcher.
		}
	}
}