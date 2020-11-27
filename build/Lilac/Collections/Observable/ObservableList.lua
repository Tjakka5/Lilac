require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 5,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["14"] = 5,["15"] = 14,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 11,["20"] = 20,["21"] = 5,["22"] = 23,["23"] = 20,["24"] = 26,["25"] = 5,["26"] = 29,["27"] = 30,["29"] = 32,["30"] = 26,["31"] = 36,["32"] = 5,["33"] = 39,["34"] = 40,["36"] = 42,["37"] = 36,["38"] = 45,["39"] = 46,["40"] = 5,["41"] = 50,["42"] = 45,["43"] = 5,["44"] = 5});
local ____exports = {}
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
local ____List = require("Lilac.Collections.List")
local List = ____List.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local ObservableList = ____exports.default
    ObservableList.name = "ObservableList"
    __TS__ClassExtends(ObservableList, List)
    function ObservableList.prototype.____constructor(self)
        List.prototype.____constructor(self)
        self.added = __TS__New(Event)
        self.removed = __TS__New(Event)
        self.clearing = __TS__New(Event)
        self.cleared = __TS__New(Event)
    end
    function ObservableList.prototype.add(self, element)
        List.prototype.add(self, element)
        self.added:invoke(element)
    end
    function ObservableList.prototype.remove(self, element)
        local success = List.prototype.remove(self, element)
        if success then
            self.removed:invoke(element)
        end
        return success
    end
    function ObservableList.prototype.removeAt(self, index)
        local element = List.prototype.removeAt(self, index)
        if element then
            self.removed:invoke(element)
        end
        return element
    end
    function ObservableList.prototype.clear(self)
        self.clearing:invoke()
        List.prototype.clear(self)
        self.cleared:invoke()
    end
    return ObservableList
end)()
return ____exports
