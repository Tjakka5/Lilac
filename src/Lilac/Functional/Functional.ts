import List from "Lilac/Collections/List";

export namespace Functional {
	export function toLazyList<T>(values: List<T>): Lazy<LazyList<T>> {
		if (values.count == 0)
			return () => undefined;
		
		return () => ({
			head: () => values.get(0)!,
			tail: toLazyList(values.slice(1)),
		});
	}

	export function fromRange(value: number) : Lazy<LazyList<number>> {
		return () => ({
			head: () => value,
			tail: fromRange(value+1),
		});
	}

	export function printList<T>(list: LazyList<T> | undefined): void {
		if (list) {
			print(list.head())
			printList(list.tail());
		}
	}

	export function last<T>(list: LazyList<T> | undefined): Lazy<T> {
		if (list) {
			const tail = list.tail();

			if (tail)
				return last(tail);
			else
				return list.head;
		}

		return () => undefined;
	}

	export function take<T>(list: LazyList<T> | undefined, amount: number): Lazy<LazyList<T>> {
		if (amount <= 0)
			return () => undefined;

		if (list) {
			return () => ({
				head: list.head,
				tail: take(list.tail(), amount-1),
			});
		}
		
		return () => undefined;
	}

	export function drop<T>(list: LazyList<T> | undefined, amount: number): Lazy<LazyList<T>> {
		if (amount <= 0)
			return () => list;

		if (list) {
			return () => drop(list.tail(), amount-1)();
		}

		return () => undefined;
	}

	export function filter<T>(list: LazyList<T> | undefined, compare: (value: T) => boolean): Lazy<LazyList<T>> {
		if (list) {
			return () => {
				const headPasses = compare(list.head()!);

				if (headPasses) {
					return {
						head: list.head,
						tail: filter(list.tail(), compare),
					};
				} else 
					return filter(list.tail(), compare)();
			}
		} 

		return () => undefined;
	}
}