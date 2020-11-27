import IHashSet from "../IHashSet";
import IObservableReadOnlyHashSet from "../ObservableReadOnly/IObservableReadOnlyHashSet";

export default interface IObservableHashSet<T> extends IObservableReadOnlyHashSet<T>, IHashSet<T> {}