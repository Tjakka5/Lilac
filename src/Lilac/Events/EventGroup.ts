import Event from "./Event";
import { DrawEventArgs, QuitEventArgs, UpdateEventArgs } from "./EventArgs";

export default class EventGroup {
	readonly update: Event<UpdateEventArgs> = new Event();
	readonly draw: Event<DrawEventArgs> = new Event();

	readonly quit: Event<QuitEventArgs> = new Event();
}