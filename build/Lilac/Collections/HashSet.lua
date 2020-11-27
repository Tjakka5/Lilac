require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 5,["7"] = 5,["8"] = 5,["9"] = 5,["11"] = 13,["12"] = 14,["13"] = 16,["14"] = 12,["20"] = 10,["24"] = 21,["25"] = 22,["26"] = 21,["27"] = 25,["28"] = 26,["29"] = 27,["31"] = 29,["32"] = 30,["33"] = 32,["34"] = 25,["35"] = 35,["36"] = 36,["37"] = 37,["39"] = 39,["40"] = 40,["41"] = 42,["42"] = 35,["43"] = 45,["44"] = 46,["45"] = 45,["46"] = 49,["47"] = 50,["48"] = 51,["50"] = 53,["51"] = 49,["52"] = 5,["53"] = 5});
local ____exports = {}
local ____Utils = require("Lilac.Utility.Utils")
local luaTablePairs = ____Utils.luaTablePairs
____exports.default = (function()
    ____exports.default = __TS__Class()
    local HashSet = ____exports.default
    HashSet.name = "HashSet"
    function HashSet.prototype.____constructor(self)
        self._elements = {}
        self.elements = self._elements
        self._count = 0
    end
    __TS__SetDescriptor(
        HashSet.prototype,
        "count",
        {
            get = function(self)
                return self._count
            end
        }
    )
    function HashSet.prototype.values(self)
        return luaTablePairs(self._elements)
    end
    function HashSet.prototype.add(self, element)
        if self:has(element) then
            return false
        end
        self._elements[element] = element
        self._count = self._count + 1
        return true
    end
    function HashSet.prototype.remove(self, element)
        if not self:has(element) then
            return false
        end
        self._elements[element] = nil
        self._count = self._count - 1
        return true
    end
    function HashSet.prototype.has(self, element)
        return self._elements[element] ~= nil
    end
    function HashSet.prototype.clear(self)
        for key in self:values() do
            self._elements[key] = nil
        end
        self._count = self._count - 1
    end
    return HashSet
end)()
return ____exports
