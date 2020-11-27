import Event from "Lilac/Events/Event";
import IObservableCollection from "../Observable/IObservableCollection";
import IReadOnlyHashSet from "../ReadOnly/IReadOnlyHashSet";

export default interface IObservableReadOnlyHashSet<T> extends IObservableCollection<T>, IReadOnlyHashSet<T> {
	readonly added: Event<T>;
	readonly removed: Event<T>;
}