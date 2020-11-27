require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 8,["11"] = 9,["12"] = 11,["13"] = 8,["14"] = 14,["15"] = 15,["16"] = 16,["17"] = 18,["18"] = 20,["20"] = 14,["21"] = 24,["22"] = 25,["23"] = 24,["24"] = 3,["25"] = 3});
local ____exports = {}
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Property = ____exports.default
    Property.name = "Property"
    function Property.prototype.____constructor(self, value)
        self.value = value
        self.onChange = __TS__New(Event)
    end
    function Property.prototype.set(self, value)
        if self.value ~= value then
            local oldValue = self.value
            self.value = value
            self.onChange:invoke(value, oldValue)
        end
    end
    function Property.prototype.get(self)
        return self.value
    end
    return Property
end)()
return ____exports
