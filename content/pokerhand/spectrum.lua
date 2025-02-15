SMODS.PokerHandPart{ -- Spectrum base (Referenced from SixSuits)
    key = 'spectrum',
    func = function(hand)
        local suits = {}
        for _, v in ipairs(SMODS.Suit.obj_buffer) do
            suits[v] = 0
        end
        if #hand < 5 then return {} end
        for i = 1, #hand do
            if hand[i].ability.name ~= 'Wild Card' then
                for k, v in pairs(suits) do
                    if hand[i]:is_suit(k, nil, true) and v == 0 then
                        suits[k] = v + 1; break
                    end
                end
            end
        end
        for i = 1, #hand do
            if hand[i].ability.name == 'Wild Card' then
                for k, v in pairs(suits) do
                    if hand[i]:is_suit(k, nil, true) and v == 0 then
                        suits[k] = v + 1; break
                    end
                end
            end
        end
        local num_suits = 0
        for _, v in pairs(suits) do
            if v > 0 then num_suits = num_suits + 1 end
        end
        return (num_suits >= 5) and {hand} or {}
    end
}

SMODS.PokerHand{ -- Spectrum (Referenced from SixSuits)
    key = 'Spectrum',
    visible = false,
    chips = 50,
    mult = 6,
    l_chips = 15,
    l_mult = 2,
    example = {
        { 'S_2',    true },
        { 'D_7',    true },
        { 'C_3', true },
        { 'paperback_CROWNS_5', true },
        { 'H_K',    true },
    },
    evaluate = function(parts)
        return parts.paperback_spectrum
    end
}