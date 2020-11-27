import Event from "Lilac/Events/Event";
import IObservableCollection from "../Observable/IObservableCollection";
import IReadOnlySparseSet from "../ReadOnly/IReadOnlySparseSet";

export default interface IObservableReadOnlySparseSet<T> extends IObservableCollection<T>, IReadOnlySparseSet<T> {
	readonly added: Event<T>;
	readonly removed: Event<T>;
}