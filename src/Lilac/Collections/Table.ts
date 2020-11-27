/* eslint-disable @typescript-eslint/ban-types */
/** @luaTable */
declare class Table<K extends {} = {}, V = unknown> {
  readonly length: number;
  set(key: K, value: V | undefined): void;
  get(key: K): V | undefined;
}