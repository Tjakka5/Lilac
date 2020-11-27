require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 4,["9"] = 4,["10"] = 6,["11"] = 6,["12"] = 7,["13"] = 7,["14"] = 9,["15"] = 9,["16"] = 10,["17"] = 10,["18"] = 12,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 17,["23"] = 17,["24"] = 18,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 18,["35"] = 18,["36"] = 18,["37"] = 19,["38"] = 19,["39"] = 19,["40"] = 21,["41"] = 21,["42"] = 21,["44"] = 21,["45"] = 26,["46"] = 27,["47"] = 21,["48"] = 29,["49"] = 30,["50"] = 30,["51"] = 30,["52"] = 30,["53"] = 30,["54"] = 31,["55"] = 29,["56"] = 35,["57"] = 36,["58"] = 37,["60"] = 35,["61"] = 43,["62"] = 44,["63"] = 44,["64"] = 44,["65"] = 44,["66"] = 44,["67"] = 44,["68"] = 44,["69"] = 43,["70"] = 47,["71"] = 47,["72"] = 52,["73"] = 52,["74"] = 52,["75"] = 52,["76"] = 52,["77"] = 53,["78"] = 54,["79"] = 54,["80"] = 54,["81"] = 54,["82"] = 54,["83"] = 55,["84"] = 53,["85"] = 52,["86"] = 52});
local ____exports = {}
local ____List = require("Lilac.Collections.List")
local List = ____List.default
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
local ____Functional = require("Lilac.Functional.Functional")
local Functional = ____Functional.Functional
local ____AbsoluteWidthConstraint = require("Lilac.GUI.Constraints.AbsoluteWidthConstraint")
local AbsoluteWidthConstraint = ____AbsoluteWidthConstraint.default
local ____Container = require("Lilac.GUI.Container")
local Container = ____Container.default
local ____Vector2 = require("Lilac.Numerics.Vector2")
local Vector2 = ____Vector2.default
local ____Runtime = require("Lilac.Runtime")
local Runtime = ____Runtime.default
local source = __TS__New(List)
source:add(1)
source:add(2)
source:add(3)
local list
list = Functional:fromRange(0)
local a
a = Functional:take(
    Functional:filter(
        list(nil),
        function(____, value)
            print(
                "Checked: " .. tostring(value)
            )
            return value == 5
        end
    )(nil),
    1
)
Functional:printList(
    a(nil)
)
local Window = __TS__Class()
Window.name = "Window"
__TS__ClassExtends(Window, Container)
function Window.prototype.____constructor(self, ...)
    Container.prototype.____constructor(self, ...)
    self.updating = __TS__New(Event)
    self.drawing = __TS__New(Event)
end
function Window.prototype.enable(self, parent)
    self.updateHandle = parent.updating:addListener(
        function()
        end,
        nil
    )
    self.drawHandle = parent.drawing:addListener(self.onDraw, self)
end
function Window.prototype.disable(self, parent)
    if self.drawHandle then
        parent.drawing:removeListener(self.drawHandle)
    end
end
function Window.prototype.onDraw(self)
    love.graphics.rectangle(
        "fill",
        self.worldPosition.x,
        self.worldPosition.y,
        self:getWidth(),
        self:getHeight()
    )
end
function Window.prototype.onMousePressed(self)
end
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Game = ____exports.default
    Game.name = "Game"
    __TS__ClassExtends(Game, Runtime)
    function Game.prototype.onLoad(self)
        local myWindow = __TS__New(
            Window,
            __TS__New(Vector2, 0, 0),
            __TS__New(AbsoluteWidthConstraint, 100)
        )
        myWindow:setParent(self)
    end
    return Game
end)()
return ____exports
