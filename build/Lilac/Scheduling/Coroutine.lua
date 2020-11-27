require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 3,["11"] = 3,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 3,["16"] = 3});
local ____exports = {}
local ____YieldType = require("Lilac.Scheduling.YieldType")
local YieldType = ____YieldType.YieldType
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Coroutine = ____exports.default
    Coroutine.name = "Coroutine"
    function Coroutine.prototype.____constructor(self)
    end
    function Coroutine.prototype.YieldForSeconds(self, time)
        coroutine.yield(YieldType.Update)
    end
    return Coroutine
end)()
return ____exports
