require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 5,["7"] = 5,["8"] = 5,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 5,["13"] = 6,["14"] = 5,["15"] = 5});
local ____exports = {}
local ____Tile = require("Entities.Tile")
local Tile = ____Tile.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Floor = ____exports.default
    Floor.name = "Floor"
    __TS__ClassExtends(Floor, Tile)
    function Floor.prototype.____constructor(self, tilePosition, quad)
        Tile.prototype.____constructor(self, tilePosition, quad)
    end
    return Floor
end)()
return ____exports
