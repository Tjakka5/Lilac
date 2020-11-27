require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 5,["7"] = 5,["8"] = 5,["9"] = 5,["11"] = 13,["12"] = 14,["13"] = 16,["14"] = 12,["20"] = 10,["24"] = 21,["25"] = 22,["26"] = 21,["27"] = 25,["28"] = 26,["29"] = 27,["30"] = 28,["31"] = 30,["33"] = 33,["34"] = 25,["35"] = 36,["36"] = 37,["37"] = 36,["38"] = 40,["39"] = 41,["40"] = 43,["41"] = 44,["42"] = 45,["44"] = 48,["45"] = 40,["46"] = 53,["47"] = 54,["48"] = 55,["49"] = 56,["52"] = 59,["53"] = 53,["54"] = 62,["55"] = 63,["56"] = 62,["57"] = 66,["58"] = 67,["59"] = 68,["61"] = 71,["62"] = 66,["63"] = 5,["64"] = 5});
local ____exports = {}
local ____Utils = require("Lilac.Utility.Utils")
local luaTablePairs = ____Utils.luaTablePairs
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Map = ____exports.default
    Map.name = "Map"
    function Map.prototype.____constructor(self)
        self._elements = {}
        self.elements = self._elements
        self._count = 0
    end
    __TS__SetDescriptor(
        Map.prototype,
        "count",
        {
            get = function(self)
                return self._count
            end
        }
    )
    function Map.prototype.values(self)
        return luaTablePairs(self._elements)
    end
    function Map.prototype.add(self, key, value)
        if self._elements[key] == nil then
            self._elements[key] = value
            self._count = self._count + 1
            return true
        end
        return false
    end
    function Map.prototype.get(self, key)
        return self._elements[key]
    end
    function Map.prototype.remove(self, key)
        local element = self._elements[key]
        if element then
            self._elements[key] = nil
            self._count = self._count - 1
        end
        return element
    end
    function Map.prototype.has(self, value)
        for ____, element in self:values() do
            if element == value then
                return true
            end
        end
        return false
    end
    function Map.prototype.hasKey(self, key)
        return self._elements[key] ~= nil
    end
    function Map.prototype.clear(self)
        for key in self:values() do
            self._elements[key] = nil
        end
        self._count = self._count - 1
    end
    return Map
end)()
return ____exports
