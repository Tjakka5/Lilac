import Event from "Lilac/Events/Event";
import IObservableCollection from "../Observable/IObservableCollection";
import IReadOnlyMap from "../ReadOnly/IReadOnlyMap";

export default interface IObservableReadOnlyMap<K, V> extends IObservableCollection<V>, IReadOnlyMap<K, V> {
	readonly added: Event<K, V>;
	readonly removed: Event<K, V>;
}