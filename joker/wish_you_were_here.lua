SMODS.Joker {
    key = "wish_you_were_here",
    loc_txt = {
        name = "Wish You Were Here",
        text = {
            "Gives {C:mult}Mult{} equal to",
            "{C:mult}#1#X{} this Joker's {C:attention}Sell Value{}.",
            "Gains {C:money}+#2# {C:attention}Sell Value{} at end of round",
            "{C:inactive}(Currently {C:mult}+#3# {C:inactive}Mult){}"
        }
    },
    config = {
        extra = {
            sv_gain = 1,
            mult_mod = 3
        }
    },
    rarity = 2,
    pos = { x = 4, y = 0 },
    atlas = "jokers_atlas",
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_mod,
                card.ability.extra.sv_gain,
                card.ability.extra.mult_mod * card.sell_cost
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra_value = (-1 * card.sell_cost) + 1
        card:set_cost()
    end,

    calculate = function(self, card, context)
        local mult = card.ability.extra.mult_mod * card.sell_cost

        if not (context.individual or context.repetition) then
            -- Give the mult during play
            if context.joker_main then
                return {
                    mult_mod = mult,
                    message = localize { type = 'variable', key = 'a_mult', vars = { mult } },
                }
            end

            -- Increase the sell value at end of round
            if context.end_of_round and not context.blueprint then
                if card.set_cost then
                    if card.custom_sell_cost then
                        card.custom_sell_cost_increase = 1
                    else
                        card.ability.extra_value = (card.ability.extra_value or 0) + 1
                    end
                    card:set_cost()
                end

                return {
                    message = localize('k_val_up'),
                    colour = G.C.MONEY
                }
            end
        end
    end
}
