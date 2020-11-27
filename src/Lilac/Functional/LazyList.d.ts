declare type LazyList<T> = {
	head: Lazy<T>,
	tail: Lazy<LazyList<T>>,
}