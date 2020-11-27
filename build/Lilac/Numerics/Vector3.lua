require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 18,["7"] = 18,["8"] = 18,["9"] = 18,["10"] = 28,["11"] = 28,["12"] = 28,["14"] = 28,["15"] = 28,["17"] = 28,["18"] = 28,["20"] = 21,["21"] = 29,["22"] = 30,["23"] = 31,["24"] = 33,["25"] = 28,["31"] = 22,["35"] = 36,["36"] = 36,["37"] = 36,["39"] = 36,["40"] = 36,["42"] = 36,["43"] = 36,["45"] = 37,["46"] = 39,["47"] = 40,["48"] = 41,["49"] = 43,["50"] = 36,["51"] = 46,["52"] = 47,["53"] = 48,["55"] = 50,["56"] = 51,["57"] = 53,["58"] = 46,["59"] = 56,["60"] = 57,["61"] = 58,["63"] = 60,["64"] = 61,["65"] = 63,["66"] = 56,["67"] = 66,["68"] = 66,["69"] = 66,["71"] = 67,["72"] = 68,["73"] = 69,["74"] = 71,["75"] = 66,["76"] = 74,["77"] = 75,["78"] = 74,["79"] = 19,["80"] = 18,["81"] = 18});
local ____exports = {}
local ____TemporaryAllocator = require("Lilac.Allocators.TemporaryAllocator")
local TemporaryAllocator = ____TemporaryAllocator.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Vector3 = ____exports.default
    Vector3.name = "Vector3"
    function Vector3.prototype.____constructor(self, x, y, z)
        if x == nil then
            x = 0
        end
        if y == nil then
            y = 0
        end
        if z == nil then
            z = 0
        end
        self._persistent = false
        self.x = x
        self.y = y
        self.z = z
        self._persistent = false
    end
    __TS__SetDescriptor(
        Vector3.prototype,
        "persistent",
        {
            get = function(self)
                return self._persistent
            end
        }
    )
    function Vector3.new(self, x, y, z)
        if x == nil then
            x = 0
        end
        if y == nil then
            y = 0
        end
        if z == nil then
            z = 0
        end
        local vector3 = ____exports.default.allocator:get(x, y, z)
        vector3.x = x
        vector3.y = y
        vector3.z = z
        return vector3
    end
    function Vector3.prototype.persist(self)
        if self._persistent then
            return false
        end
        self._persistent = true
        ____exports.default.allocator:persist(self)
        return true
    end
    function Vector3.prototype.free(self)
        if not self.persistent then
            return false
        end
        self._persistent = false
        ____exports.default.allocator:free(self)
        return true
    end
    function Vector3.prototype.clone(self, out)
        if out == nil then
            out = ____exports.default:new(0, 0, 0)
        end
        out.x = self.x
        out.y = self.y
        out.z = self.z
        return out
    end
    function Vector3.prototype.tostring(self)
        return ((((("Vector3: [" .. tostring(self.x)) .. ", ") .. tostring(self.y)) .. ", ") .. tostring(self.z)) .. "]"
    end
    Vector3.allocator = __TS__New(TemporaryAllocator, ____exports.default, 200)
    return Vector3
end)()
return ____exports
