require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 10,["10"] = 11,["11"] = 12,["12"] = 14,["13"] = 10,["14"] = 17,["15"] = 18,["16"] = 18,["17"] = 18,["18"] = 18,["19"] = 18,["20"] = 17});
local ____exports = {}
local ____Math = require("Lilac.Math")
local Math = ____Math.Math
____exports.MinWidthConstraint = __TS__Class()
local MinWidthConstraint = ____exports.MinWidthConstraint
MinWidthConstraint.name = "MinWidthConstraint"
function MinWidthConstraint.prototype.____constructor(self, a, b, progress)
    self.a = a
    self.b = b
    self.progress = progress
end
function MinWidthConstraint.prototype.getWidth(self)
    return Math.lerpUnclamped(
        self.a:getWidth(),
        self.b:getWidth(),
        self.progress
    )
end
return ____exports
