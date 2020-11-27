require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 19,["7"] = 20,["8"] = 20,["9"] = 20,["10"] = 20,["11"] = 25,["12"] = 28,["13"] = 29,["14"] = 30,["17"] = 33,["18"] = 34,["19"] = 35,["20"] = 36,["21"] = 37,["23"] = 40,["24"] = 43,["25"] = 47,["26"] = 48,["27"] = 50,["28"] = 51,["29"] = 51,["30"] = 51,["31"] = 51,["32"] = 50,["33"] = 56,["34"] = 56,["35"] = 56,["36"] = 56,["37"] = 50,["38"] = 50,["39"] = 62,["42"] = 66,["44"] = 69});
local ____exports = {}
local ____List = require("Lilac.Collections.List")
local List = ____List.default
function ____exports.default(self)
    local errorTraceback = {
        error = "oopsie woopsie you did a fucky wucky",
        trace = __TS__New(List)
    }
    local level = 2
    while true do
        local info = debug.getinfo(level, "Sln")
        if not info then
            break
        end
        if info.what == "Lua" then
            local line = info.currentline
            local file = info.source
            if string.sub(info.source, 1, 1) == "@" then
                file = string.sub(info.source, 2)
            end
            local rawFileName = string.match(file, "(.+)%..+")
            local fileSourceMap = _G.__TS__sourcemap[tostring(file)]
            if fileSourceMap then
                local mappedLine = fileSourceMap[tostring(line)]
                local fullTraceback = {
                    tracebackLua = {
                        filename = tostring(rawFileName) .. ".lua",
                        filenameShort = tostring(rawFileName) .. ".lua",
                        lineNumber = line
                    },
                    tracebackTS = {
                        filename = tostring(rawFileName) .. ".ts",
                        filenameShort = tostring(rawFileName) .. ".ts",
                        lineNumber = mappedLine
                    }
                }
                errorTraceback.trace:add(fullTraceback)
            end
        end
        level = level + 1
    end
    return errorTraceback
end
return ____exports
