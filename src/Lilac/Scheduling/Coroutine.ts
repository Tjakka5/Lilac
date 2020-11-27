import { YieldType } from "./YieldType";

export default class Coroutine {
	public YieldForSeconds(time: number): void {
		coroutine.yield(YieldType.Update);
	}
}