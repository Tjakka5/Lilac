require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 4,["5"] = 4,["6"] = 4,["7"] = 4,["8"] = 8,["9"] = 9,["10"] = 10,["11"] = 8,["12"] = 13,["13"] = 14,["14"] = 13,["15"] = 4,["16"] = 4});
local ____exports = {}
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Tile = ____exports.default
    Tile.name = "Tile"
    function Tile.prototype.____constructor(self, tilePosition, quad)
        self.tilePosition = tilePosition
        self.quad = quad
    end
    function Tile.prototype.draw(self, image)
        love.graphics.draw(image, self.quad, self.tilePosition.x * 16, self.tilePosition.y * 16)
    end
    return Tile
end)()
return ____exports
