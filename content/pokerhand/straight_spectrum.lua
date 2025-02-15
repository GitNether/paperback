SMODS.PokerHand{ -- Straight Spectrum (Referenced from SixSuits)
    key = 'Straight Spectrum',
    visible = false,
    chips = 120,
    mult = 10,
    l_chips = 30,
    l_mult = 3,
    example = {
        { 'S_Q',    true },
        { 'paperback_CROWNS_J', true },
        { 'C_T',    true },
        { 'D_9', true },
        { 'H_8',    true }
    },
    process_loc_text = function(self)
        SMODS.PokerHand.process_loc_text(self)
        SMODS.process_loc_text(G.localization.misc.poker_hands, self.key..' (Royal)', self.loc_txt, 'extra')
    end,
    evaluate = function(parts)
        if not next(parts.paperback_spectrum) or not next(parts._straight) then return {} end
        return { SMODS.merge_lists (parts.paperback_spectrum, parts._straight) }
    end,
    modify_display_text = function(self, _cards, scoring_hand)
        local royal = true
		for j = 1, #scoring_hand do
			local rank = SMODS.Ranks[scoring_hand[j].base.value]
			royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
		end
		if royal then
			return self.key..' (Royal)'
		end
    end
}