require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 5,["7"] = 5,["8"] = 5,["9"] = 5,["11"] = 14,["12"] = 15,["13"] = 17,["14"] = 19,["15"] = 13,["16"] = 23,["17"] = 24,["18"] = 23,["19"] = 27,["20"] = 28,["21"] = 29,["23"] = 31,["24"] = 33,["25"] = 34,["26"] = 36,["27"] = 27,["28"] = 39,["29"] = 40,["30"] = 39,["31"] = 43,["32"] = 44,["33"] = 46,["34"] = 47,["36"] = 49,["37"] = 51,["38"] = 52,["40"] = 54,["41"] = 56,["42"] = 57,["43"] = 59,["45"] = 62,["46"] = 64,["47"] = 43,["48"] = 67,["49"] = 68,["50"] = 67,["51"] = 71,["52"] = 72,["53"] = 73,["54"] = 74,["56"] = 71,["57"] = 5,["58"] = 5});
local ____exports = {}
local ____Utils = require("Lilac.Utility.Utils")
local luaTableIpairs = ____Utils.luaTableIpairs
____exports.default = (function()
    ____exports.default = __TS__Class()
    local SparseSet = ____exports.default
    SparseSet.name = "SparseSet"
    function SparseSet.prototype.____constructor(self)
        self.sparse = {}
        self.dense = {}
        self.elements = self.dense
        self.count = 0
    end
    function SparseSet.prototype.values(self)
        return luaTableIpairs(self.dense)
    end
    function SparseSet.prototype.add(self, element)
        if self.sparse[element] then
            return false
        end
        local index = #self.dense + 1
        self.sparse[element] = index
        self.dense[index] = element
        return true
    end
    function SparseSet.prototype.get(self, index)
        return self.dense[index]
    end
    function SparseSet.prototype.remove(self, element)
        local index = self.sparse[element]
        if index == nil then
            return false
        end
        local size = #self.dense
        if index == size then
            self.dense[index] = nil
        else
            local other = self.dense[size]
            self.dense[index] = other
            self.sparse[other] = index
            self.dense[size] = nil
        end
        self.sparse[element] = nil
        return true
    end
    function SparseSet.prototype.has(self, element)
        return self.sparse[element] ~= nil
    end
    function SparseSet.prototype.clear(self)
        for index, element in self:values() do
            self.dense[index] = nil
            self.sparse[element] = nil
        end
    end
    return SparseSet
end)()
return ____exports
