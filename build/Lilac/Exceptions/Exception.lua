require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 5,["9"] = 6,["10"] = 7,["11"] = 5,["12"] = 1,["13"] = 1});
local ____exports = {}
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Exception = ____exports.default
    Exception.name = "Exception"
    function Exception.prototype.____constructor(self, errorString, root)
        self.errorString = errorString
        self.root = root
    end
    return Exception
end)()
return ____exports
