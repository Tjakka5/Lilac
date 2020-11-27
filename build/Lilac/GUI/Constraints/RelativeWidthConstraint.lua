require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 5,["5"] = 5,["6"] = 5,["7"] = 5,["8"] = 9,["9"] = 10,["10"] = 11,["11"] = 9,["12"] = 14,["13"] = 15,["14"] = 14,["15"] = 5,["16"] = 5});
local ____exports = {}
____exports.default = (function()
    ____exports.default = __TS__Class()
    local AbsoluteWidthContraint = ____exports.default
    AbsoluteWidthContraint.name = "AbsoluteWidthContraint"
    function AbsoluteWidthContraint.prototype.____constructor(self, container, fraction)
        self.container = container
        self.fraction = fraction
    end
    function AbsoluteWidthContraint.prototype.getWidth(self)
        return self.container:getWidth() * self.fraction
    end
    return AbsoluteWidthContraint
end)()
return ____exports
