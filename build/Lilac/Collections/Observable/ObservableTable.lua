require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 4,["11"] = 17,["12"] = 19,["13"] = 20,["14"] = 21,["15"] = 22,["16"] = 16,["22"] = 13,["26"] = 25,["27"] = 26,["28"] = 25,["29"] = 29,["30"] = 30,["31"] = 32,["32"] = 33,["34"] = 35,["35"] = 37,["36"] = 38,["38"] = 29,["39"] = 4,["40"] = 4});
local ____exports = {}
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local ObservableTable = ____exports.default
    ObservableTable.name = "ObservableTable"
    function ObservableTable.prototype.____constructor(self)
        self.table = {}
        self.added = __TS__New(Event)
        self.removed = __TS__New(Event)
        self.clearing = __TS__New(Event)
        self.cleared = __TS__New(Event)
    end
    __TS__SetDescriptor(
        ObservableTable.prototype,
        "length",
        {
            get = function(self)
                return #self.table
            end
        }
    )
    function ObservableTable.prototype.get(self, key)
        return self.table[key]
    end
    function ObservableTable.prototype.set(self, key, value)
        local oldValue = self:get(key)
        if oldValue then
            self.removed:invoke(oldValue)
        end
        self:set(key, value)
        if value then
            self.added:invoke(value)
        end
    end
    return ObservableTable
end)()
return ____exports
