require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 4,["9"] = 4,["10"] = 6,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 6,["16"] = 6,["17"] = 30,["18"] = 31,["19"] = 33,["20"] = 27,["26"] = 11,["35"] = 16,["44"] = 24,["48"] = 36,["49"] = 37,["50"] = 39,["51"] = 36,["52"] = 42,["53"] = 43,["54"] = 44,["56"] = 46,["57"] = 47,["58"] = 49,["59"] = 42,["60"] = 52,["61"] = 53,["62"] = 54,["64"] = 56,["65"] = 57,["66"] = 59,["67"] = 52,["68"] = 62,["69"] = 63,["70"] = 65,["71"] = 62,["72"] = 68,["73"] = 69,["74"] = 71,["75"] = 68,["76"] = 74,["77"] = 75,["78"] = 76,["80"] = 78,["81"] = 80,["82"] = 74,["83"] = 7,["84"] = 6,["85"] = 6});
local ____exports = {}
local ____BasicAllocator = require("Lilac.Allocators.BasicAllocator")
local BasicAllocator = ____BasicAllocator.default
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
local ____BasePromise = require("Lilac.Promise.BasePromise")
local BasePromise = ____BasePromise.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Promise = ____exports.default
    Promise.name = "Promise"
    __TS__ClassExtends(Promise, BasePromise)
    function Promise.prototype.____constructor(self)
        BasePromise.prototype.____constructor(self)
        self.fulfilled = __TS__New(Event)
        self.rejected = __TS__New(Event)
        self._allocated = false
    end
    __TS__SetDescriptor(
        Promise.prototype,
        "value",
        {
            get = function(self)
                return self._value
            end
        }
    )
    __TS__SetDescriptor(
        Promise.prototype,
        "reason",
        {
            get = function(self)
                return self._reason
            end
        }
    )
    __TS__SetDescriptor(
        Promise.prototype,
        "allocated",
        {
            get = function(self)
                return self._allocated
            end
        }
    )
    function Promise.new(self)
        local promise = ____exports.default.allocator:get()
        return promise
    end
    function Promise.prototype.fulfill(self, value)
        if self:isSettled() then
            return false
        end
        self._value = value
        self.fulfilled:invoke(value, self)
        return true
    end
    function Promise.prototype.reject(self, reason)
        if self:isSettled() then
            return false
        end
        self._reason = reason
        self.rejected:invoke(reason, self)
        return true
    end
    Promise.prototype["then"] = function(self, callback, target)
        self.fulfilled:addListener(callback, target)
        return self
    end
    function Promise.prototype.catch(self, callback, target)
        self.rejected:addListener(callback, target)
        return self
    end
    function Promise.prototype.free(self)
        if not self.allocated then
            return false
        end
        ____exports.default.allocator:free(self)
        return true
    end
    Promise.allocator = __TS__New(BasicAllocator, ____exports.default, 100)
    return Promise
end)()
return ____exports
