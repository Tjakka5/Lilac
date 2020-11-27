export default class Exception {
	public readonly errorString: string;
	public readonly root?: Exception;

	public constructor(errorString: string, root?: Exception) {
		this.errorString = errorString;
		this.root = root;
	}
}