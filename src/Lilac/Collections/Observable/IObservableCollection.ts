import Event from "Lilac/Events/Event";

export default interface IObservableCollection<T> {
	readonly clearing: Event;
	readonly cleared: Event;
}