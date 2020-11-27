require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 8,["7"] = 8,["8"] = 8,["9"] = 8,["11"] = 9,["12"] = 8,["13"] = 12,["14"] = 13,["15"] = 18,["16"] = 20,["17"] = 12,["18"] = 23,["19"] = 24,["20"] = 23,["21"] = 27,["22"] = 28,["23"] = 29,["25"] = 27,["26"] = 8,["27"] = 8});
local ____exports = {}
local ____SparseSet = require("Lilac.Collections.SparseSet")
local SparseSet = ____SparseSet.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Event = ____exports.default
    Event.name = "Event"
    function Event.prototype.____constructor(self)
        self.listeners = __TS__New(SparseSet)
    end
    function Event.prototype.addListener(self, func, target)
        local handle = {func = func, target = target}
        self.listeners:add(handle)
        return handle
    end
    function Event.prototype.removeListener(self, eventHandle)
        return self.listeners:remove(eventHandle)
    end
    function Event.prototype.invoke(self, a, b, c, d, e, f)
        for ____, listener in self.listeners:values() do
            listener.func(listener.target, a, b, c, d, e, f)
        end
    end
    return Event
end)()
return ____exports
