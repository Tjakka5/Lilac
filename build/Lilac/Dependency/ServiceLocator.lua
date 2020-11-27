require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 4,["11"] = 8,["12"] = 7,["13"] = 11,["14"] = 12,["15"] = 13,["17"] = 15,["18"] = 17,["19"] = 11,["20"] = 20,["21"] = 21,["22"] = 20,["23"] = 4,["24"] = 4});
local ____exports = {}
local ____Map = require("Lilac.Collections.Map")
local Map = ____Map.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local ServiceLocator = ____exports.default
    ServiceLocator.name = "ServiceLocator"
    function ServiceLocator.prototype.____constructor(self)
        self.services = __TS__New(Map)
    end
    function ServiceLocator.prototype.register(self, cls, instance)
        if self.services:hasKey(cls) then
            return false
        end
        self.services:add(cls, instance)
        return true
    end
    function ServiceLocator.prototype.get(self, cls)
        return self.services:get(cls)
    end
    return ServiceLocator
end)()
return ____exports
