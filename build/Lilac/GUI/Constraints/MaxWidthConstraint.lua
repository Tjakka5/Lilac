require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 8,["10"] = 9,["11"] = 10,["12"] = 8,["13"] = 13,["14"] = 14,["15"] = 14,["16"] = 14,["17"] = 14,["18"] = 13});
local ____exports = {}
local ____Math = require("Lilac.Math")
local Math = ____Math.Math
____exports.MaxWidthConstraint = __TS__Class()
local MaxWidthConstraint = ____exports.MaxWidthConstraint
MaxWidthConstraint.name = "MaxWidthConstraint"
function MaxWidthConstraint.prototype.____constructor(self, a, b)
    self.a = a
    self.b = b
end
function MaxWidthConstraint.prototype.getWidth(self)
    return Math.max(
        self.a:getWidth(),
        self.b:getWidth()
    )
end
return ____exports
