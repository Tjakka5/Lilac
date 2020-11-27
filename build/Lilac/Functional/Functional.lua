require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["7"] = 3,["8"] = 5,["9"] = 6,["11"] = 8,["12"] = 8,["13"] = 3,["14"] = 10,["15"] = 10,["16"] = 8,["17"] = 8,["18"] = 4,["19"] = 3,["20"] = 15,["21"] = 15,["22"] = 3,["23"] = 15,["24"] = 14,["25"] = 3,["26"] = 22,["27"] = 23,["28"] = 23,["29"] = 23,["30"] = 3,["31"] = 24,["32"] = 24,["33"] = 24,["35"] = 21,["36"] = 3,["37"] = 29,["38"] = 30,["39"] = 32,["40"] = 3,["42"] = 35,["45"] = 38,["46"] = 28,["47"] = 3,["48"] = 42,["49"] = 43,["51"] = 45,["52"] = 46,["53"] = 46,["54"] = 3,["55"] = 48,["56"] = 48,["57"] = 48,["58"] = 46,["59"] = 46,["61"] = 52,["62"] = 41,["63"] = 3,["64"] = 56,["65"] = 57,["67"] = 59,["68"] = 3,["69"] = 60,["70"] = 60,["71"] = 60,["72"] = 60,["74"] = 63,["75"] = 55,["76"] = 3,["77"] = 67,["78"] = 68,["79"] = 69,["80"] = 69,["81"] = 69,["82"] = 69,["83"] = 71,["84"] = 72,["85"] = 72,["86"] = 3,["87"] = 74,["88"] = 74,["89"] = 74,["90"] = 72,["91"] = 72,["93"] = 3,["94"] = 77,["95"] = 77,["96"] = 77,["97"] = 77,["99"] = 68,["101"] = 81,["102"] = 66});
local ____exports = {}
____exports.Functional = {}
local Functional = ____exports.Functional
do
    function Functional.toLazyList(self, values)
        if values.count == 0 then
            return function() return nil end
        end
        return function() return {
            head = function() return values:get(0) end,
            tail = Functional.toLazyList(
                nil,
                values:slice(1)
            )
        } end
    end
    function Functional.fromRange(self, value)
        return function() return {
            head = function() return value end,
            tail = Functional.fromRange(nil, value + 1)
        } end
    end
    function Functional.printList(self, list)
        if list then
            print(
                list:head()
            )
            Functional.printList(
                nil,
                list:tail()
            )
        end
    end
    function Functional.last(self, list)
        if list then
            local tail = list:tail()
            if tail then
                return Functional.last(nil, tail)
            else
                return list.head
            end
        end
        return function() return nil end
    end
    function Functional.take(self, list, amount)
        if amount <= 0 then
            return function() return nil end
        end
        if list then
            return function() return {
                head = list.head,
                tail = Functional.take(
                    nil,
                    list:tail(),
                    amount - 1
                )
            } end
        end
        return function() return nil end
    end
    function Functional.drop(self, list, amount)
        if amount <= 0 then
            return function() return list end
        end
        if list then
            return function() return Functional.drop(
                nil,
                list:tail(),
                amount - 1
            )(nil) end
        end
        return function() return nil end
    end
    function Functional.filter(self, list, compare)
        if list then
            return function()
                local headPasses = compare(
                    nil,
                    list:head()
                )
                if headPasses then
                    return {
                        head = list.head,
                        tail = Functional.filter(
                            nil,
                            list:tail(),
                            compare
                        )
                    }
                else
                    return Functional.filter(
                        nil,
                        list:tail(),
                        compare
                    )(nil)
                end
            end
        end
        return function() return nil end
    end
end
return ____exports
