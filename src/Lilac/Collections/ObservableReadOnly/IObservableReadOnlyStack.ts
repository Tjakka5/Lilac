import Event from "Lilac/Events/Event";
import IObservableCollection from "../Observable/IObservableCollection";
import IReadOnlyStack from "../ReadOnly/IReadOnlyStack";

export default interface IObservableReadOnlyStack<T> extends IObservableCollection<T>, IReadOnlyStack<T> {
	readonly pushed: Event<T>;
	readonly popped: Event<T>;
}