import IList from "../IList";
import IObservableReadOnlyList from "../ObservableReadOnly/IObservableReadOnlyList";

export default interface IObservableList<T> extends IObservableReadOnlyList<T>, IList<T> {}