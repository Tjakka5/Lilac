require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 4,["5"] = 4,["6"] = 6,["7"] = 6,["8"] = 6,["9"] = 6,["10"] = 6,["11"] = 9,["12"] = 6,["13"] = 12,["14"] = 9,["15"] = 15,["16"] = 16,["17"] = 15,["18"] = 19,["19"] = 20,["20"] = 19,["21"] = 6,["22"] = 6});
local ____exports = {}
local ____SceneNode = require("Lilac.GUI.SceneNode")
local SceneNode = ____SceneNode.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Container = ____exports.default
    Container.name = "Container"
    __TS__ClassExtends(Container, SceneNode)
    function Container.prototype.____constructor(self, localPosition, widthConstraint)
        SceneNode.prototype.____constructor(self, localPosition)
        self.widthConstraint = widthConstraint
    end
    function Container.prototype.getWidth(self)
        return self.widthConstraint:getWidth()
    end
    function Container.prototype.getHeight(self)
        return 100
    end
    return Container
end)()
return ____exports
