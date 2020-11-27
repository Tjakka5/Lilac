require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 4,["7"] = 4,["8"] = 6,["9"] = 6,["10"] = 6,["11"] = 6,["12"] = 6,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 10,["18"] = 11,["19"] = 13,["20"] = 6,["21"] = 15,["22"] = 15,["23"] = 17,["24"] = 18,["25"] = 17,["26"] = 21,["27"] = 22,["28"] = 21,["29"] = 25,["30"] = 26,["31"] = 25,["32"] = 29,["33"] = 30,["34"] = 29,["35"] = 33,["36"] = 34,["37"] = 33,["38"] = 6,["39"] = 6});
local ____exports = {}
local ____Event = require("Lilac.Events.Event")
local Event = ____Event.default
local ____SceneNode = require("Lilac.GUI.SceneNode")
local BaseSceneNode = ____SceneNode.BaseSceneNode
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Runtime = ____exports.default
    Runtime.name = "Runtime"
    __TS__ClassExtends(Runtime, BaseSceneNode)
    function Runtime.prototype.____constructor(self, ...)
        BaseSceneNode.prototype.____constructor(self, ...)
        self.updating = __TS__New(Event)
        self.drawing = __TS__New(Event)
        self.mousePressed = __TS__New(Event)
        self.mouseReleased = __TS__New(Event)
        self.quitting = __TS__New(Event)
    end
    function Runtime.prototype.onLoad(self, gameContext)
    end
    function Runtime.prototype.onUpdate(self, args, gameContext)
        self.updating:invoke(args, gameContext)
    end
    function Runtime.prototype.onDraw(self, args, gameContext)
        self.drawing:invoke(args, gameContext)
    end
    function Runtime.prototype.onMousePressed(self, args, gameContext)
        self.mousePressed:invoke(args, gameContext)
    end
    function Runtime.prototype.onMouseReleased(self, args, gameContext)
        self.mousePressed:invoke(args, gameContext)
    end
    function Runtime.prototype.onQuiting(self, args, gameContext)
        self.quitting:invoke(args, gameContext)
    end
    return Runtime
end)()
return ____exports
