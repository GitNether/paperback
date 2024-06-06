PB_UTIL = {}

function PB_UTIL.is_in_your_collection(card)
    if not G.your_collection then return false end
    for i = 1, 3 do
        if (G.your_collection[i] and card.area == G.your_collection[i]) then return true end
    end
    return false
end

return PB_UTIL