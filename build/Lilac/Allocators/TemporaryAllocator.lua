require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 5,["11"] = 14,["12"] = 16,["13"] = 16,["15"] = 18,["16"] = 17,["17"] = 24,["18"] = 24,["19"] = 24,["20"] = 24,["21"] = 24,["22"] = 30,["23"] = 30,["24"] = 30,["26"] = 30,["27"] = 24,["28"] = 27,["29"] = 28,["30"] = 33,["32"] = 35,["33"] = 35,["34"] = 37,["35"] = 38,["36"] = 35,["39"] = 30,["40"] = 42,["41"] = 43,["42"] = 45,["43"] = 46,["44"] = 47,["46"] = 49,["48"] = 42,["49"] = 53,["50"] = 54,["51"] = 53,["52"] = 57,["53"] = 58,["54"] = 57,["55"] = 61,["56"] = 62,["57"] = 63,["59"] = 65,["60"] = 61,["61"] = 24,["62"] = 24});
local ____exports = {}
local ____List = require("Lilac.Collections.List")
local List = ____List.default
local ____SparseSet = require("Lilac.Collections.SparseSet")
local SparseSet = ____SparseSet.default
local ____Stack = require("Lilac.Collections.Stack")
local Stack = ____Stack.default
local DEFAULT_ITEM_COUNT = 100
____exports.temporaryAllocators = __TS__New(List)
local BaseTemporaryAllocator = __TS__Class()
BaseTemporaryAllocator.name = "BaseTemporaryAllocator"
function BaseTemporaryAllocator.prototype.____constructor(self)
    ____exports.temporaryAllocators:add(self)
end
____exports.default = (function()
    ____exports.default = __TS__Class()
    local TemporaryAllocator = ____exports.default
    TemporaryAllocator.name = "TemporaryAllocator"
    __TS__ClassExtends(TemporaryAllocator, BaseTemporaryAllocator)
    function TemporaryAllocator.prototype.____constructor(self, ctor, count, ...)
        if count == nil then
            count = DEFAULT_ITEM_COUNT
        end
        local args = {...}
        BaseTemporaryAllocator.prototype.____constructor(self)
        self.freeItems = __TS__New(Stack)
        self.allocatedItems = __TS__New(SparseSet)
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
    function TemporaryAllocator.prototype.get(self, ...)
        local item = self.freeItems:pop()
        if item then
            self.allocatedItems:add(item)
            return item
        else
            return __TS__New(self.ctor, ...)
        end
    end
    function TemporaryAllocator.prototype.persist(self, item)
        self.allocatedItems:remove(item)
    end
    function TemporaryAllocator.prototype.free(self, item)
        self.freeItems:push(item)
    end
    function TemporaryAllocator.prototype.clean(self)
        for ____, item in self.allocatedItems:values() do
            self.freeItems:push(item)
        end
        self.allocatedItems:clear()
    end
    return TemporaryAllocator
end)()
return ____exports
