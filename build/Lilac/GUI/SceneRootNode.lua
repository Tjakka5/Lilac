require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 3,["6"] = 4,["7"] = 4,["8"] = 7,["9"] = 7,["10"] = 9,["11"] = 9,["12"] = 9,["13"] = 9,["14"] = 37,["15"] = 37,["16"] = 37,["18"] = 32,["19"] = 33,["20"] = 35,["21"] = 38,["22"] = 39,["23"] = 37,["29"] = 12,["38"] = 17,["47"] = 22,["56"] = 26,["57"] = 27,["59"] = 29,["63"] = 42,["64"] = 43,["65"] = 44,["67"] = 46,["68"] = 47,["69"] = 48,["70"] = 49,["72"] = 51,["73"] = 42,["74"] = 54,["75"] = 54,["76"] = 55,["77"] = 55,["78"] = 9,["79"] = 9});
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
        "parent",
        {
            get = function(self)
                return self._parent
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
                if self.parent then
                    return self.parent.worldPosition:add(self._localPosition)
                end
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
            child:enable(self)
        end
        return true
    end
    function SceneRoot.prototype.enable(self)
    end
    function SceneRoot.prototype.disable(self)
    end
    return SceneRoot
end)()
return ____exports
