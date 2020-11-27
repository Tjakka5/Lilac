require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 3,["7"] = 11,["8"] = 11,["9"] = 11,["10"] = 11,["11"] = 16,["12"] = 16,["13"] = 16,["15"] = 16,["16"] = 14,["17"] = 17,["19"] = 19,["20"] = 19,["21"] = 21,["22"] = 22,["23"] = 19,["26"] = 16,["27"] = 26,["28"] = 26,["29"] = 27,["30"] = 29,["31"] = 30,["33"] = 32,["35"] = 26,["36"] = 36,["37"] = 37,["38"] = 36,["39"] = 11,["40"] = 11});
local ____exports = {}
local ____Stack = require("Lilac.Collections.Stack")
local Stack = ____Stack.default
local DEFAULT_ITEM_COUNT = 100
____exports.default = (function()
    ____exports.default = __TS__Class()
    local BasicAllocator = ____exports.default
    BasicAllocator.name = "BasicAllocator"
    function BasicAllocator.prototype.____constructor(self, ctor, count, ...)
        if count == nil then
            count = DEFAULT_ITEM_COUNT
        end
        local args = {...}
        self.freeItems = __TS__New(Stack)
        self.ctor = ctor
        do
            local i = 0
            while i < count do
                local item = __TS__New(self.ctor, args)
                self.freeItems:push(item)
                i = i + 1
            end
        end
    end
    function BasicAllocator.prototype.get(self, ...)
        local args = {...}
        local item = self.freeItems:pop()
        if item then
            return item
        else
            return __TS__New(self.ctor, args)
        end
    end
    function BasicAllocator.prototype.free(self, item)
        self.freeItems:push(item)
    end
    return BasicAllocator
end)()
return ____exports
