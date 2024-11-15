SMODS.Joker {
    key = "great_wave",
    loc_txt = {
        name = "Great Wave",
        text = {
            "Retrigger {C:attention}rightmost{} played card used in",
            "scoring {C:attention}once{} for every {C:chips}hand{} remaining"
        }
    },
    rarity = 3,
    pos = { x = 4, y = 2 },
    atlas = "jokers_atlas",
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    calculate = function(self, card, context)
        if not card.debuff then
            if context.repetition and context.cardarea == G.play then
                if context.other_card == context.scoring_hand[#context.scoring_hand] then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = G.GAME.current_round.hands_left,
                        card = card
                    }
                end
            end
        end
    end
}