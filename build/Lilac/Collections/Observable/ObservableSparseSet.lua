require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 5,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["14"] = 5,["15"] = 14,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 11,["20"] = 20,["21"] = 5,["22"] = 23,["23"] = 24,["25"] = 26,["26"] = 20,["27"] = 29,["28"] = 5,["29"] = 32,["30"] = 33,["32"] = 35,["33"] = 29,["34"] = 38,["35"] = 39,["36"] = 5,["37"] = 43,["38"] = 38,["39"] = 5,["40"] = 5});
local ____exports = {}
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
local ____SparseSet = require("Lilac.Collections.SparseSet")
local SparseSet = ____SparseSet.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local ObservableSparseSet = ____exports.default
    ObservableSparseSet.name = "ObservableSparseSet"
    __TS__ClassExtends(ObservableSparseSet, SparseSet)
    function ObservableSparseSet.prototype.____constructor(self)
        SparseSet.prototype.____constructor(self)
        self.added = __TS__New(Event)
        self.removed = __TS__New(Event)
        self.clearing = __TS__New(Event)
        self.cleared = __TS__New(Event)
    end
    function ObservableSparseSet.prototype.add(self, element)
        local success = SparseSet.prototype.add(self, element)
        if success then
            self.added:invoke(element)
        end
        return success
    end
    function ObservableSparseSet.prototype.remove(self, element)
        local success = SparseSet.prototype.remove(self, element)
        if success then
            self.removed:invoke(element)
        end
        return success
    end
    function ObservableSparseSet.prototype.clear(self)
        self.clearing:invoke()
        SparseSet.prototype.clear(self)
        self.cleared:invoke()
    end
    return ObservableSparseSet
end)()
return ____exports
