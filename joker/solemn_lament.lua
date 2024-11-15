SMODS.Joker {
    key = "solemn_lament",
    loc_txt = {
        name = "Solemn Lament",
        text = {
            "Retrigger {C:attention}first{} played card used in",
            "scoring {C:attention}once{} for every remaining",
            "{C:chips}hand{} or {C:mult}discard{}",
            "{C:inactive}(The lowest of the two)",
            "{C:attention}Aces{}, {C:attention}6s{}, and {C:attention}8s{} give",
            "{C:mult}+#1#{} Mult when scored"
        }
    },
    config = {
        extra = {
            a_mult = 3,
        }
    },
    rarity = 2,
    pos = { x = 3, y = 1 },
    atlas = "jokers_atlas",
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.a_mult
            }
        }
    end,

    calculate = function (self, card, context)
        if not card.debuff then
            if context.individual and context.cardarea == G.play then
                if sl_is_valid_card(context.other_card) then
                    return {
                        mult = card.ability.extra.a_mult,
                        card = card
                    }
                end
            end

            if context.repetition and context.cardarea == G.play then
                if context.other_card == context.scoring_hand[1] then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = sl_get_repetitions(),
                        card = card
                    }
                end
            end
        end
    end
}


-- Returns if the card is a valid card for the joker to trigger on
function sl_is_valid_card(card)
    if card:get_id() == 14 or card:get_id() == 8 or card:get_id() == 6 then
        return true
    end
end


-- Returns the number of repetitions for the joker
function sl_get_repetitions()
    return (G.GAME.current_round.hands_left < G.GAME.current_round.discards_left)
                and G.GAME.current_round.hands_left
            or G.GAME.current_round.discards_left
end