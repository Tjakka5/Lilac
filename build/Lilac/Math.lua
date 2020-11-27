require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 3,["5"] = 3,["6"] = 4,["8"] = 7,["10"] = 7,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 7,["15"] = 7,["16"] = 7,["17"] = 7,["18"] = 7,["19"] = 7,["20"] = 7,["21"] = 7,["22"] = 7,["23"] = 7,["24"] = 7,["25"] = 7,["26"] = 7,["27"] = 7,["28"] = 7,["29"] = 7,["30"] = 7,["31"] = 7,["32"] = 7,["33"] = 7,["34"] = 7,["35"] = 7,["36"] = 7,["37"] = 7,["38"] = 7,["39"] = 7,["40"] = 7,["41"] = 7,["42"] = 7,["43"] = 7,["44"] = 7,["45"] = 45,["46"] = 7,["47"] = 7,["48"] = 7,["49"] = 50,["50"] = 50,["51"] = 49,["52"] = 7,["53"] = 7,["54"] = 56,["55"] = 55,["56"] = 7,["57"] = 7,["58"] = 7,["59"] = 60,["60"] = 59,["61"] = 7,["62"] = 7,["63"] = 7});
local ____exports = {}
local ____love = require("love")
local loveMath = ____love.math
local luaMath = math
____exports.Math = {}
local Math = ____exports.Math
do
    Math.E = 2.71827
    Math.LN10 = 2.302585092994046
    Math.LOG10E = 0.4342944819032518
    Math.LN2 = 0.6931471805599453
    Math.LOG2E = 1.4426950408889634
    Math.PI = luaMath.pi
    Math.SQRT1_2 = ____exports.Math.sqrt(1 / 2)
    Math.SQRT_2 = ____exports.Math.sqrt(2)
    Math.NAN = 0 / 0
    Math.INFINITY = 1 / 0
    Math.EPSILON = 0.00001
    Math.RADTODEGV = 360 / (Math.PI * 2)
    Math.DEGTORADV = (Math.PI * 2) / 360
    Math.atan = luaMath.atan
    Math.atan2 = luaMath.atan2
    Math.abs = luaMath.abs
    Math.acos = luaMath.acos
    Math.cos = luaMath.cos
    Math.asin = luaMath.asin
    Math.sin = luaMath.sin
    Math.ceil = luaMath.ceil
    Math.floor = luaMath.floor
    Math.exp = luaMath.exp
    Math.log = luaMath.log
    Math.min = luaMath.min
    Math.max = luaMath.max
    Math.sqrt = luaMath.sqrt
    Math.tan = luaMath.tan
    Math.radToDeg = luaMath.deg
    Math.degToRad = luaMath.rad
    Math.log10 = function(value) return luaMath.log(value, 10) end
    Math.log2 = function(value) return luaMath.log(value, 2) end
    Math.round = function(value) return luaMath.floor(value + 0.5) end
    Math.approximately = function(a, b)
        return Math.abs(a - b) < Math.EPSILON
    end
    Math.clamp = function(value, minValue, maxValue)
        return Math.min(
            Math.max(value, minValue),
            maxValue
        )
    end
    Math.clamp01 = function(value) return Math.clamp(value, 0, 1) end
    Math.lerpUnclamped = function(a, b, t)
        return (a * (1 - t)) + (b * t)
    end
    Math.lerp = function(a, b, t)
        return Math.clamp01(
            Math.lerpUnclamped(a, b, t)
        )
    end
    Math.gammaToLinear = loveMath.gammaToLinear
    Math.linearToGamma = loveMath.linearToGamma
    Math.noise = loveMath.noise
end
return ____exports
