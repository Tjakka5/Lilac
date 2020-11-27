export default abstract class YieldCommand {
	public static YieldForSeconds(time: number): YieldForSeconds {
		return new YieldForSeconds(time);
	}

	public abstract evaluate(): boolean;
}

class YieldForSeconds extends YieldCommand {
	private time: number;

	public constructor(time: number) {
		super();
	
		this.time = time;
	}

	public evaluate(): boolean {
		return false;
	}
}