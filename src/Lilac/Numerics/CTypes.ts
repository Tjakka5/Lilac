/** @noSelfInFile */

// TODO: None of these seem to have a smaller memory footprint. Perhaps Lua stores them as big numbers anyways?

export function UInt8(value: number): number {
	return ffi.cast("uint8_t", value);
}

export function Int8(value: number): number {
	return ffi.cast("int8_t", value);
}

export function UInt16(value: number): number {
	return ffi.cast("int16_t", value);
}

export function Int16(value: number): number {
	return ffi.cast("uint16_t", value);
}

export function UInt32(value: number): number {
	return ffi.cast("uint32_t", value);
}

export function Int32(value: number): number {
	return ffi.cast("int32_t", value);
}

export function UInt64(value: number): number {
	return ffi.cast("uint64_t", value);
}

export function Int64(value: number): number {
	return ffi.cast("int64_t", value);
}

export function float(value: number): number {
	return ffi.cast("float", value);
}

export function double(value: number): number {
	return ffi.cast("double", value);
}