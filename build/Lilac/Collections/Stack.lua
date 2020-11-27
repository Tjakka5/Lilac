require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 5,["7"] = 5,["8"] = 5,["9"] = 5,["11"] = 15,["12"] = 16,["13"] = 18,["14"] = 14,["20"] = 11,["24"] = 23,["25"] = 24,["26"] = 23,["27"] = 27,["28"] = 28,["29"] = 30,["30"] = 27,["31"] = 33,["32"] = 34,["33"] = 35,["34"] = 37,["35"] = 38,["36"] = 40,["38"] = 43,["39"] = 33,["40"] = 46,["41"] = 47,["42"] = 46,["43"] = 50,["44"] = 51,["45"] = 52,["47"] = 50,["48"] = 5,["49"] = 5});
local ____exports = {}
local ____Utils = require("Lilac.Utility.Utils")
local luaTableIpairs = ____Utils.luaTableIpairs
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Stack = ____exports.default
    Stack.name = "Stack"
    function Stack.prototype.____constructor(self)
        self._elements = {}
        self.elements = self._elements
        self._count = 0
    end
    __TS__SetDescriptor(
        Stack.prototype,
        "count",
        {
            get = function(self)
                return self._count
            end
        }
    )
    function Stack.prototype.values(self)
        return luaTableIpairs(self._elements)
    end
    function Stack.prototype.push(self, element)
        self._elements[self._count] = element
        self._count = self._count + 1
    end
    function Stack.prototype.pop(self)
        if self._count > 0 then
            self._count = self._count - 1
            local element = self._elements[self._count]
            self._elements[self._count] = nil
            return element
        end
        return nil
    end
    function Stack.prototype.peek(self)
        return self._elements[self._count]
    end
    function Stack.prototype.clear(self)
        for index in self:values() do
            self._elements[index] = nil
        end
    end
    return Stack
end)()
return ____exports
