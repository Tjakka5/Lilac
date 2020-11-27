require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 17,["7"] = 17,["8"] = 17,["9"] = 17,["10"] = 36,["11"] = 36,["12"] = 36,["14"] = 36,["15"] = 36,["17"] = 20,["18"] = 37,["19"] = 38,["20"] = 40,["21"] = 36,["27"] = 21,["36"] = 26,["45"] = 29,["47"] = 28,["48"] = 28,["49"] = 28,["58"] = 31,["60"] = 32,["61"] = 32,["62"] = 32,["71"] = 34,["75"] = 43,["76"] = 43,["77"] = 43,["79"] = 43,["80"] = 43,["82"] = 44,["83"] = 46,["84"] = 47,["85"] = 49,["86"] = 43,["87"] = 52,["88"] = 53,["89"] = 54,["91"] = 56,["92"] = 57,["93"] = 59,["94"] = 52,["95"] = 62,["96"] = 63,["97"] = 64,["99"] = 66,["100"] = 67,["101"] = 69,["102"] = 62,["103"] = 72,["104"] = 72,["105"] = 72,["107"] = 73,["108"] = 74,["109"] = 76,["110"] = 72,["111"] = 79,["112"] = 79,["113"] = 79,["115"] = 80,["116"] = 81,["117"] = 83,["118"] = 79,["119"] = 86,["120"] = 87,["121"] = 86,["122"] = 18,["123"] = 17,["124"] = 17});
local ____exports = {}
local ____TemporaryAllocator = require("Lilac.Allocators.TemporaryAllocator")
local TemporaryAllocator = ____TemporaryAllocator.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Vector2 = ____exports.default
    Vector2.name = "Vector2"
    function Vector2.prototype.____constructor(self, x, y)
        if x == nil then
            x = 0
        end
        if y == nil then
            y = 0
        end
        self._persistent = false
        self.x = x
        self.y = y
        self._persistent = false
    end
    __TS__SetDescriptor(
        Vector2.prototype,
        "persistent",
        {
            get = function(self)
                return self._persistent
            end
        }
    )
    __TS__SetDescriptor(
        Vector2.prototype,
        "xx",
        {
            get = function(self)
                return ____exports.default:new(self.x, self.x)
            end
        }
    )
    __TS__SetDescriptor(
        Vector2.prototype,
        "xy",
        {
            get = function(self)
                return ____exports.default:new(self.x, self.y)
            end,
            set = function(self, value)
                self.x = value.x
                self.y = value.y
            end
        }
    )
    __TS__SetDescriptor(
        Vector2.prototype,
        "yx",
        {
            get = function(self)
                return ____exports.default:new(self.y, self.x)
            end,
            set = function(self, value)
                self.y = value.x
                self.x = value.y
            end
        }
    )
    __TS__SetDescriptor(
        Vector2.prototype,
        "yy",
        {
            get = function(self)
                return ____exports.default:new(self.y, self.y)
            end
        }
    )
    function Vector2.new(self, x, y)
        if x == nil then
            x = 0
        end
        if y == nil then
            y = 0
        end
        local vector2 = ____exports.default.allocator:get(x, y)
        vector2.x = x
        vector2.y = y
        return vector2
    end
    function Vector2.prototype.persist(self)
        if self._persistent then
            return false
        end
        self._persistent = true
        ____exports.default.allocator:persist(self)
        return true
    end
    function Vector2.prototype.free(self)
        if not self.persistent then
            return false
        end
        self._persistent = false
        ____exports.default.allocator:free(self)
        return true
    end
    function Vector2.prototype.clone(self, out)
        if out == nil then
            out = ____exports.default:new(0, 0)
        end
        out.x = self.x
        out.y = self.y
        return out
    end
    function Vector2.prototype.add(self, other, out)
        if out == nil then
            out = ____exports.default:new(0, 0)
        end
        out.x = self.x + other.x
        out.y = self.y + other.y
        return out
    end
    function Vector2.prototype.tostring(self)
        return ((("Vector2: [" .. tostring(self.x)) .. ", ") .. tostring(self.y)) .. "]"
    end
    Vector2.allocator = __TS__New(TemporaryAllocator, ____exports.default, 200)
    return Vector2
end)()
return ____exports
