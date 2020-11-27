require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 5,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["14"] = 5,["15"] = 14,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 11,["20"] = 20,["21"] = 5,["22"] = 23,["23"] = 24,["25"] = 26,["26"] = 20,["27"] = 29,["28"] = 5,["29"] = 32,["30"] = 33,["32"] = 35,["33"] = 29,["34"] = 38,["35"] = 39,["36"] = 5,["37"] = 43,["38"] = 38,["39"] = 5,["40"] = 5});
local ____exports = {}
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
local ____Map = require("Lilac.Collections.Map")
local Map = ____Map.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local ObservableMap = ____exports.default
    ObservableMap.name = "ObservableMap"
    __TS__ClassExtends(ObservableMap, Map)
    function ObservableMap.prototype.____constructor(self)
        Map.prototype.____constructor(self)
        self.added = __TS__New(Event)
        self.removed = __TS__New(Event)
        self.clearing = __TS__New(Event)
        self.cleared = __TS__New(Event)
    end
    function ObservableMap.prototype.add(self, key, value)
        local success = Map.prototype.add(self, key, value)
        if success then
            self.added:invoke(key, value)
        end
        return success
    end
    function ObservableMap.prototype.remove(self, key)
        local element = Map.prototype.remove(self, key)
        if element then
            self.removed:invoke(key, element)
        end
        return element
    end
    function ObservableMap.prototype.clear(self)
        self.clearing:invoke()
        Map.prototype.clear(self)
        self.cleared:invoke()
    end
    return ObservableMap
end)()
return ____exports
