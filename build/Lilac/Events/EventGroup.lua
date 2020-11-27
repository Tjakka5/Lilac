require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 4,["11"] = 5,["12"] = 6,["13"] = 8,["14"] = 4,["15"] = 4,["16"] = 4});
local ____exports = {}
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local EventGroup = ____exports.default
    EventGroup.name = "EventGroup"
    function EventGroup.prototype.____constructor(self)
        self.update = __TS__New(Event)
        self.draw = __TS__New(Event)
        self.quit = __TS__New(Event)
    end
    return EventGroup
end)()
return ____exports
