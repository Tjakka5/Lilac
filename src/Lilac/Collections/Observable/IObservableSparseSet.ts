import ISparseSet from "../ISparseSet";
import IObservableReadOnlySparseSet from "../ObservableReadOnly/IObservableReadOnlySparseSet";

export default interface IObservableSparseSet<T> extends IObservableReadOnlySparseSet<T>, ISparseSet<T> {}