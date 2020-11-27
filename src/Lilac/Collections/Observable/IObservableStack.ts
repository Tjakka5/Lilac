import IStack from "../IStack";
import IObservableReadOnlyStack from "../ObservableReadOnly/IObservableReadOnlyStack";

export default interface IObservableStack<T> extends IObservableReadOnlyStack<T>, IStack<T> {}