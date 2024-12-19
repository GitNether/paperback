SMODS.Joker {
    key = 'derecho',
    loc_txt = {
        name = "Derecho",
        text = {
            "Gains {X:mult,C:white}X#1#{} Mult if",
            "{C:attention}scored hand{} contains only {C:spades}dark suits",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
    },
    config = {
        extra = {
            x_mult_mod = 0.1,
            x_mult = 1
        }
    },
    rarity = 2,
    pos = { x = 0, y = 1 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,
    
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.x_mult_mod,
                center.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if not card.debuff then
            -- Upgrade the Joker when hand is played
            if context.before and not (context.individual or context.repetition) and not context.blueprint then
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i].ability.name ~= "Wild Card" then
                        if context.scoring_hand[i]:is_suit("Hearts") or context.scoring_hand[i]:is_suit("Diamonds") then
                            return
                        end
                    end
                end

                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
                    
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
    
            -- Give the xMult during play
            if context.joker_main and not card.debuff then
                return {
                    Xmult_mod = card.ability.extra.x_mult,
                    message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                    card = card,
                }
            end
        end
    end

}
