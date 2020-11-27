require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 5,["7"] = 5,["8"] = 5,["9"] = 5,["11"] = 13,["12"] = 14,["13"] = 16,["14"] = 12,["20"] = 10,["24"] = 21,["25"] = 22,["26"] = 21,["27"] = 25,["28"] = 26,["29"] = 28,["30"] = 25,["31"] = 31,["32"] = 32,["33"] = 31,["34"] = 35,["36"] = 36,["37"] = 36,["38"] = 37,["39"] = 39,["40"] = 40,["41"] = 42,["43"] = 36,["46"] = 46,["47"] = 35,["48"] = 49,["49"] = 51,["50"] = 53,["51"] = 54,["53"] = 56,["54"] = 49,["55"] = 59,["56"] = 61,["57"] = 63,["58"] = 59,["59"] = 66,["61"] = 67,["62"] = 67,["63"] = 68,["64"] = 69,["66"] = 67,["69"] = 73,["70"] = 66,["71"] = 76,["72"] = 77,["73"] = 76,["74"] = 80,["75"] = 81,["76"] = 82,["78"] = 85,["79"] = 80,["80"] = 88,["81"] = 88,["82"] = 88,["84"] = 89,["86"] = 91,["87"] = 91,["88"] = 92,["89"] = 92,["90"] = 92,["91"] = 91,["94"] = 94,["95"] = 88,["96"] = 5,["97"] = 5});
local ____exports = {}
local ____Utils = require("Lilac.Utility.Utils")
local luaTableIpairs = ____Utils.luaTableIpairs
____exports.default = (function()
    ____exports.default = __TS__Class()
    local List = ____exports.default
    List.name = "List"
    function List.prototype.____constructor(self)
        self._elements = {}
        self.elements = self._elements
        self._count = 0
    end
    __TS__SetDescriptor(
        List.prototype,
        "count",
        {
            get = function(self)
                return self._count
            end
        }
    )
    function List.prototype.values(self)
        return luaTableIpairs(self._elements)
    end
    function List.prototype.add(self, element)
        self._elements[self._count + 1] = element
        self._count = self._count + 1
    end
    function List.prototype.get(self, index)
        return self._elements[index + 1]
    end
    function List.prototype.remove(self, element)
        do
            local index = 0
            while index < self._count do
                if self._elements[index + 1] == element then
                    table.remove(self._elements, index)
                    self._count = self._count - 1
                    return true
                end
                index = index + 1
            end
        end
        return false
    end
    function List.prototype.removeAt(self, index)
        local element = table.remove(self._elements, index + 1)
        if element then
            self._count = self._count - 1
        end
        return element
    end
    function List.prototype.insert(self, index, element)
        table.insert(self._elements, index + 1, element)
        self._count = self._count + 1
    end
    function List.prototype.indexOf(self, element)
        do
            local index = 0
            while index < #self._elements do
                if self._elements[index + 1] == element then
                    return index
                end
                index = index + 1
            end
        end
        return -1
    end
    function List.prototype.has(self, element)
        return self:indexOf(element) ~= -1
    end
    function List.prototype.clear(self)
        for index in self:values() do
            self._elements[index] = nil
        end
        self._count = 0
    end
    function List.prototype.slice(self, from, out)
        if out == nil then
            out = __TS__New(____exports.default)
        end
        out:clear()
        do
            local i = from
            while i < self.count do
                out:add(
                    self:get(i)
                )
                i = i + 1
            end
        end
        return out
    end
    return List
end)()
return ____exports
