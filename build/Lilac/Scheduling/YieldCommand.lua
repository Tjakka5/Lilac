require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 9,["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 2,["14"] = 1,["15"] = 1,["16"] = 9,["17"] = 9,["18"] = 9,["19"] = 12,["20"] = 9,["21"] = 15,["22"] = 12,["23"] = 18,["24"] = 19,["25"] = 18});
local ____exports = {}
local YieldForSeconds
____exports.default = (function()
    ____exports.default = __TS__Class()
    local YieldCommand = ____exports.default
    YieldCommand.name = "YieldCommand"
    function YieldCommand.prototype.____constructor(self)
    end
    function YieldCommand.YieldForSeconds(self, time)
        return __TS__New(YieldForSeconds, time)
    end
    return YieldCommand
end)()
YieldForSeconds = __TS__Class()
YieldForSeconds.name = "YieldForSeconds"
__TS__ClassExtends(YieldForSeconds, ____exports.default)
function YieldForSeconds.prototype.____constructor(self, time)
    YieldForSeconds.____super.prototype.____constructor(self)
    self.time = time
end
function YieldForSeconds.prototype.evaluate(self)
    return false
end
return ____exports
