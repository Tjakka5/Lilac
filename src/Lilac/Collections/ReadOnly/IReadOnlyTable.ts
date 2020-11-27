// eslint-disable-next-line @typescript-eslint/ban-types
export default interface IReadOnlyTable<K extends {} = {}, V = unknown> {
  readonly length: number;
  get(key: K): V | undefined;
}