require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 3,["6"] = 7,["7"] = 7,["8"] = 36,["9"] = 36,["10"] = 36,["11"] = 51,["12"] = 51,["13"] = 51,["15"] = 52,["16"] = 53,["17"] = 51,["23"] = 39,["32"] = 44,["41"] = 48,["45"] = 57,["46"] = 57,["47"] = 57,["48"] = 57,["49"] = 57,["55"] = 60,["59"] = 63,["60"] = 64,["61"] = 66,["62"] = 67,["63"] = 68,["65"] = 71,["66"] = 63,["67"] = 74,["68"] = 74,["69"] = 75,["70"] = 75,["71"] = 57,["72"] = 57});
local ____exports = {}
local ____SparseSet = require("Lilac.Collections.SparseSet")
local SparseSet = ____SparseSet.default
local ____Vector2 = require("Lilac.Numerics.Vector2")
local Vector2 = ____Vector2.default
____exports.BaseSceneNode = __TS__Class()
local BaseSceneNode = ____exports.BaseSceneNode
BaseSceneNode.name = "BaseSceneNode"
function BaseSceneNode.prototype.____constructor(self, localPosition)
    if localPosition == nil then
        localPosition = Vector2:new(0, 0)
    end
    self._children = __TS__New(SparseSet)
    self._localPosition = localPosition
end
__TS__SetDescriptor(
    BaseSceneNode.prototype,
    "children",
    {
        get = function(self)
            return self._children
        end
    }
)
__TS__SetDescriptor(
    BaseSceneNode.prototype,
    "localPosition",
    {
        get = function(self)
            return self._localPosition
        end
    }
)
__TS__SetDescriptor(
    BaseSceneNode.prototype,
    "worldPosition",
    {
        get = function(self)
            return self._localPosition:clone()
        end
    }
)
____exports.default = (function()
    ____exports.default = __TS__Class()
    local SceneNode = ____exports.default
    SceneNode.name = "SceneNode"
    __TS__ClassExtends(SceneNode, ____exports.BaseSceneNode)
    __TS__SetDescriptor(
        SceneNode.prototype,
        "parent",
        {
            get = function(self)
                return self._parent
            end
        }
    )
    function SceneNode.prototype.setParent(self, parent)
        local success = parent._children:add(self)
        if success then
            self._parent = parent
            self:enable(parent)
        end
        return success
    end
    function SceneNode.prototype.enable(self, parent)
    end
    function SceneNode.prototype.disable(self, parent)
    end
    return SceneNode
end)()
return ____exports
