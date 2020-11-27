require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 7,["11"] = 7,["12"] = 10,["14"] = 12,["15"] = 13,["16"] = 14,["18"] = 16,["19"] = 18,["22"] = 27,["23"] = 29,["24"] = 31,["25"] = 31,["26"] = 31,["27"] = 34,["28"] = 34,["29"] = 34,["30"] = 34,["31"] = 31,["32"] = 31,["33"] = 38,["34"] = 39,["35"] = 41,["36"] = 42,["37"] = 43,["38"] = 44,["39"] = 45,["40"] = 49,["41"] = 51,["42"] = 54,["43"] = 56,["44"] = 66,["45"] = 68,["46"] = 70,["48"] = 72,["49"] = 73,["50"] = 73,["51"] = 73,["52"] = 73,["53"] = 73,["54"] = 73,["55"] = 80,["56"] = 81,["57"] = 82,["58"] = 82,["59"] = 82,["60"] = 82,["61"] = 82,["62"] = 82,["63"] = 89,["66"] = 93,["67"] = 94,["69"] = 96,["70"] = 97,["71"] = 98,["72"] = 100,["73"] = 105,["74"] = 106,["75"] = 107,["77"] = 107,["78"] = 107,["79"] = 107,["80"] = 109,["81"] = 113,["83"] = 116,["84"] = 117,["86"] = 119,["87"] = 41,["88"] = 10});
local ____exports = {}
local ____Game = require("Game")
local Game = ____Game.default
local ____love = require("love")
local filesystem = ____love.filesystem
local ____TemporaryAllocator = require("Lilac.Allocators.TemporaryAllocator")
local temporaryAllocators = ____TemporaryAllocator.temporaryAllocators
local ____Vector2 = require("Lilac.Numerics.Vector2")
local Vector2 = ____Vector2.default
love.run = function()
    do
        local contents = love.filesystem.read("windowData.json")
        if contents == nil then
            love.window.setMode(700, 1000, {})
        else
            local windowData = json.decode(contents)
            love.window.setMode(windowData.w, windowData.h, {x = windowData.x, y = windowData.y, display = windowData.display, resizable = true})
        end
    end
    love.timer.step()
    local dt = 0
    local gameContext = {
        frame = 0,
        uptime = 0,
        screenDimensions = __TS__New(
            Vector2,
            love.graphics.getWidth(),
            love.graphics.getHeight()
        )
    }
    local runtime = __TS__New(Game)
    runtime.onLoad(runtime, gameContext)
    return function(self)
        love.event.pump()
        for name, a, b, c, d, e, f in love.event.poll() do
            if name == "quit" then
                local quitEventArgs = {cancelled = false}
                runtime.onQuiting(runtime, quitEventArgs, gameContext)
                if not quitEventArgs.cancelled then
                    local w, h, flags = love.window.getMode()
                    local windowData = {x = flags.x, y = flags.y, w = w, h = h, display = flags.display}
                    local serData = json.encode(windowData)
                    filesystem.write("windowData.json", serData)
                    return (((a == nil) and (function() return true end)) or (function() return a end))()
                end
            elseif name == "mousepressed" then
                local mousePressedEvent = {
                    position = Vector2:new(a, b),
                    button = c,
                    isTouch = d,
                    pressed = e
                }
                runtime.onMousePressed(runtime, mousePressedEvent, gameContext)
            elseif name == "mousereleased" then
                local mouseReleasedEvent = {
                    position = Vector2:new(a, b),
                    button = c,
                    isTouch = d,
                    pressed = e
                }
                runtime.onMouseReleased(runtime, mouseReleasedEvent, gameContext)
            end
        end
        for ____, temporaryAllocator in temporaryAllocators:values() do
            temporaryAllocator:clean()
        end
        dt = love.timer.step()
        gameContext.frame = gameContext.frame + 1
        gameContext.uptime = gameContext.uptime + dt
        runtime.onUpdate(runtime, {dt = dt, frame = gameContext.frame}, gameContext)
        if love.graphics.isActive() then
            love.graphics.origin()
            love.graphics.clear(
                {
                    love.graphics.getBackgroundColor()
                }
            )
            runtime.onDraw(runtime, {frame = gameContext.frame}, gameContext)
            love.graphics.present()
        end
        for ____, temporaryAllocator in temporaryAllocators:values() do
            temporaryAllocator:clean()
        end
        love.timer.sleep(0.001)
    end
end
return ____exports
