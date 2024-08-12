SMODS.Joker {
    key = 'pride_flag',
    loc_txt = {
        name = "Pride Flag",
        text = {
            "Gains {C:mult}+#1#{} Mult if scored hand",
            "contains {C:attention}four{} unique suits",
            "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult)"
        }
    },
    config = {
        extra = {
            a_mult = 3,
            mult = 0
        }
    },
    rarity = 2,
    pos = { x = 3, y = 0 },
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
                center.ability.extra.a_mult,
                center.ability.extra.mult
            }
        }
    end,

    -- Calculate function for the Joker
    calculate = function(self, card, context)
        if not card.debuff then
            if context.before and not context.blueprint then
                local suits = {
                    ['Hearts'] = 0,
                    ['Diamonds'] = 0,
                    ['Spades'] = 0,
                    ['Clubs'] = 0
                }
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i].ability.name ~= 'Wild Card' then
                        if context.scoring_hand[i]:is_suit('Hearts', true) and suits["Hearts"] == 0 then suits["Hearts"] = suits["Hearts"] + 1
                        elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
                        elseif context.scoring_hand[i]:is_suit('Spades', true) and suits["Spades"] == 0  then suits["Spades"] = suits["Spades"] + 1
                        elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits["Clubs"] == 0  then suits["Clubs"] = suits["Clubs"] + 1 end
                    end
                end
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i].ability.name == 'Wild Card' then
                        if context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then suits["Hearts"] = suits["Hearts"] + 1
                        elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
                        elseif context.scoring_hand[i]:is_suit('Spades') and suits["Spades"] == 0  then suits["Spades"] = suits["Spades"] + 1
                        elseif context.scoring_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0  then suits["Clubs"] = suits["Clubs"] + 1 end
                    end
                end
                if suits["Hearts"] > 0 and suits["Diamonds"] > 0 and suits["Spades"] > 0 and suits["Clubs"] > 0 then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult

                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT,
                        card = card
                    }
                end
            end

            if context.joker_main then
                return {
                    message = localize{ type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                    mult_mod = card.ability.extra.mult
                }
            end
        end
    end
}
