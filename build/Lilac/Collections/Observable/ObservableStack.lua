require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 5,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["14"] = 5,["15"] = 14,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 11,["20"] = 21,["21"] = 5,["22"] = 24,["23"] = 21,["24"] = 27,["25"] = 5,["26"] = 30,["27"] = 31,["29"] = 33,["30"] = 27,["31"] = 36,["32"] = 37,["33"] = 5,["34"] = 41,["35"] = 36,["36"] = 5,["37"] = 5});
local ____exports = {}
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
local ____Stack = require("Lilac.Collections.Stack")
local Stack = ____Stack.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local ObservableStack = ____exports.default
    ObservableStack.name = "ObservableStack"
    __TS__ClassExtends(ObservableStack, Stack)
    function ObservableStack.prototype.____constructor(self)
        Stack.prototype.____constructor(self)
        self.pushed = __TS__New(Event)
        self.popped = __TS__New(Event)
        self.clearing = __TS__New(Event)
        self.cleared = __TS__New(Event)
    end
    function ObservableStack.prototype.push(self, element)
        Stack.prototype.push(self, element)
        self.pushed:invoke(element)
    end
    function ObservableStack.prototype.pop(self)
        local element = Stack.prototype.pop(self)
        if element then
            self.popped:invoke(element)
        end
        return element
    end
    function ObservableStack.prototype.clear(self)
        self.clearing:invoke()
        Stack.prototype.clear(self)
        self.cleared:invoke()
    end
    return ObservableStack
end)()
return ____exports
