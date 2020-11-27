require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 6,["7"] = 6,["8"] = 6,["9"] = 6,["11"] = 14,["12"] = 13,["13"] = 17,["14"] = 18,["15"] = 17,["16"] = 24,["17"] = 24,["18"] = 28,["19"] = 29,["20"] = 28,["21"] = 32,["22"] = 33,["23"] = 34,["24"] = 32,["25"] = 6,["26"] = 6});
local ____exports = {}
local ____SparseSet = require("Lilac.Collections.SparseSet")
local SparseSet = ____SparseSet.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Entity = ____exports.default
    Entity.name = "Entity"
    function Entity.prototype.____constructor(self)
        self.children = __TS__New(SparseSet)
    end
    function Entity.prototype.preload(self, eventGroup)
        self.rootEventGroup = eventGroup
    end
    function Entity.prototype.addChild(self, child)
    end
    function Entity.prototype.registerDraw(self, func)
        self.drawHandle = self.rootEventGroup.draw:addListener(func, self)
    end
    function Entity.prototype.unregisterDraw(self)
        self.rootEventGroup.draw:removeListener(self.drawHandle)
        self.drawHandle = nil
    end
    return Entity
end)()
return ____exports
