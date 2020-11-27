require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 5,["5"] = 6,["6"] = 5,["7"] = 9,["8"] = 10,["9"] = 9,["10"] = 13,["11"] = 14,["12"] = 13,["13"] = 17,["14"] = 18,["15"] = 17,["16"] = 21,["17"] = 22,["18"] = 21,["19"] = 25,["20"] = 26,["21"] = 25,["22"] = 29,["23"] = 30,["24"] = 29,["25"] = 33,["26"] = 34,["27"] = 33,["28"] = 37,["29"] = 38,["30"] = 37,["31"] = 41,["32"] = 42,["33"] = 41});
local ____exports = {}
function ____exports.UInt8(value)
    return ffi.cast("uint8_t", value)
end
function ____exports.Int8(value)
    return ffi.cast("int8_t", value)
end
function ____exports.UInt16(value)
    return ffi.cast("int16_t", value)
end
function ____exports.Int16(value)
    return ffi.cast("uint16_t", value)
end
function ____exports.UInt32(value)
    return ffi.cast("uint32_t", value)
end
function ____exports.Int32(value)
    return ffi.cast("int32_t", value)
end
function ____exports.UInt64(value)
    return ffi.cast("uint64_t", value)
end
function ____exports.Int64(value)
    return ffi.cast("int64_t", value)
end
function ____exports.float(value)
    return ffi.cast("float", value)
end
function ____exports.double(value)
    return ffi.cast("double", value)
end
return ____exports
