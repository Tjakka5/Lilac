/** @noSelf  */

declare module json {
	function encode(value: any): string;
	function decode(str: string): any;
}