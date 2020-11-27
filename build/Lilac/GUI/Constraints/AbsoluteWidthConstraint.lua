require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 3,["6"] = 3,["7"] = 3,["8"] = 6,["9"] = 7,["10"] = 6,["11"] = 10,["12"] = 11,["13"] = 10,["14"] = 3,["15"] = 3});
local ____exports = {}
____exports.default = (function()
    ____exports.default = __TS__Class()
    local AbsoluteWidthConstraint = ____exports.default
    AbsoluteWidthConstraint.name = "AbsoluteWidthConstraint"
    function AbsoluteWidthConstraint.prototype.____constructor(self, width)
        self.width = width
    end
    function AbsoluteWidthConstraint.prototype.getWidth(self)
        return self.width
    end
    return AbsoluteWidthConstraint
end)()
return ____exports
