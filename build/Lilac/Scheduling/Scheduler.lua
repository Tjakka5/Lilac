require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 2,["5"] = 2,["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 7,["11"] = 7,["12"] = 7,["13"] = 7,["15"] = 16,["16"] = 16,["17"] = 17,["18"] = 19,["19"] = 16,["20"] = 16,["21"] = 22,["22"] = 15,["23"] = 25,["24"] = 26,["25"] = 28,["26"] = 29,["32"] = 30,["40"] = 25,["41"] = 37,["42"] = 38,["44"] = 37,["45"] = 8,["46"] = 7,["47"] = 7});
local ____exports = {}
local ____List = require("Lilac.Collections.List")
local List = ____List.default
local ____Coroutine = require("Lilac.Scheduling.Coroutine")
local Coroutine = ____Coroutine.default
local ____YieldType = require("Lilac.Scheduling.YieldType")
local YieldType = ____YieldType.YieldType
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Scheduler = ____exports.default
    Scheduler.name = "Scheduler"
    function Scheduler.prototype.____constructor(self)
        ____exports.default.dispatcher = coroutine.create(
            function(func, target)
                local coroutineContext = __TS__New(Coroutine)
                func(target, coroutineContext)
            end
        )
        ____exports.default.activeDispatchers = __TS__New(List)
    end
    function Scheduler.schedule(self, coroutineFunction, target)
        local _, yieldType = coroutine.resume(____exports.default.dispatcher, coroutineFunction, target)
        local ____switch6 = yieldType
        if ____switch6 == YieldType.Update then
            goto ____switch6_case_0
        end
        goto ____switch6_case_default
        ::____switch6_case_0::
        do
            self.activeDispatchers:add(____exports.default.dispatcher)
            goto ____switch6_end
        end
        ::____switch6_case_default::
        do
            goto ____switch6_end
        end
        ::____switch6_end::
    end
    function Scheduler.update(self, args)
        for ____, dispatcher in ____exports.default.activeDispatchers:values() do
        end
    end
    Scheduler.instance = __TS__New(____exports.default)
    return Scheduler
end)()
return ____exports
