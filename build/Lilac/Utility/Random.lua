require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["7"] = 1,["8"] = 3,["9"] = 2,["10"] = 1,["11"] = 7,["12"] = 6,["13"] = 1,["14"] = 11,["15"] = 10,["16"] = 1,["17"] = 15,["18"] = 14});
local ____exports = {}
____exports.Random = {}
local Random = ____exports.Random
do
    function Random.number(self, min, max)
        return love.math.random(min, max)
    end
    function Random.float(self, min, max)
        return (love.math.random() * (max - min)) + min
    end
    function Random.floatUnsignedNormalized(self)
        return love.math.random()
    end
    function Random.floatSignedNormalized(self)
        return (love.math.random() * 2) - 1
    end
end
return ____exports
