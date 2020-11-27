require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 3,["11"] = 10,["12"] = 9,["18"] = 6,["22"] = 13,["23"] = 14,["24"] = 13,["25"] = 3,["26"] = 3});
local ____exports = {}
local ____PromiseState = require("Lilac.Promise.PromiseState")
local PromiseState = ____PromiseState.PromiseState
____exports.default = (function()
    ____exports.default = __TS__Class()
    local BasePromise = ____exports.default
    BasePromise.name = "BasePromise"
    function BasePromise.prototype.____constructor(self)
        self._promiseState = PromiseState.Pending
    end
    __TS__SetDescriptor(
        BasePromise.prototype,
        "promiseState",
        {
            get = function(self)
                return self._promiseState
            end
        }
    )
    function BasePromise.prototype.isSettled(self)
        return self._promiseState ~= PromiseState.Pending
    end
    return BasePromise
end)()
return ____exports
