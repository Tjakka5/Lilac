import IMap from "../IMap";
import IObservableReadOnlyMap from "../ObservableReadOnly/IObservableReadOnlyMap";

export default interface IObservableMap<K, V> extends IObservableReadOnlyMap<K, V>, IMap<K, V> {}