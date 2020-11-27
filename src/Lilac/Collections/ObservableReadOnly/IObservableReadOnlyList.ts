import Event from "Lilac/Events/Event";
import IObservableCollection from "../Observable/IObservableCollection";
import IReadOnlyList from "../ReadOnly/IReadOnlyList";

export default interface IObservableReadOnlyList<T> extends IObservableCollection<T>, IReadOnlyList<T> {
	readonly added: Event<T>;
	readonly removed: Event<T>;
} 