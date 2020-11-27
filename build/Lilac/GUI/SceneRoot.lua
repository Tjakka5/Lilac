require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 3,["6"] = 4,["7"] = 4,["8"] = 7,["9"] = 7,["10"] = 10,["11"] = 10,["12"] = 10,["13"] = 10,["14"] = 33,["15"] = 33,["16"] = 33,["18"] = 25,["19"] = 26,["20"] = 28,["21"] = 29,["22"] = 31,["23"] = 34,["24"] = 35,["25"] = 33,["31"] = 13,["40"] = 18,["49"] = 22,["53"] = 38,["54"] = 39,["55"] = 40,["57"] = 42,["58"] = 43,["59"] = 44,["60"] = 45,["62"] = 47,["63"] = 38,["64"] = 10,["65"] = 10});
local ____exports = {}
local ____SparseSet = require("Lilac.Collections.SparseSet")
local SparseSet = ____SparseSet.default
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
local ____Vector2 = require("Lilac.Numerics.Vector2")
local Vector2 = ____Vector2.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local SceneRoot = ____exports.default
    SceneRoot.name = "SceneRoot"
    function SceneRoot.prototype.____constructor(self, localPosition)
        if localPosition == nil then
            localPosition = Vector2:new(0, 0)
        end
        self.updating = __TS__New(Event)
        self.drawing = __TS__New(Event)
        self.mousePress = __TS__New(Event)
        self.mouseReleased = __TS__New(Event)
        self.quiting = __TS__New(Event)
        self._children = __TS__New(SparseSet)
        self._localPosition = localPosition
    end
    __TS__SetDescriptor(
        SceneRoot.prototype,
        "children",
        {
            get = function(self)
                return self._children
            end
        }
    )
    __TS__SetDescriptor(
        SceneRoot.prototype,
        "localPosition",
        {
            get = function(self)
                return self._localPosition
            end
        }
    )
    __TS__SetDescriptor(
        SceneRoot.prototype,
        "worldPosition",
        {
            get = function(self)
                return self._localPosition:clone()
            end
        }
    )
    function SceneRoot.prototype.addChild(self, child)
        if self._children:has(child) then
            return false
        end
        local success = self._children:add(child)
        if success then
            child._parent = self
            child.enable(child, self)
        end
        return true
    end
    return SceneRoot
end)()
return ____exports
