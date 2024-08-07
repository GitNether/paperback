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
            -- Figure out how to get this to calculate the sell_value on spawn
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

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.mult_mod,
                center.ability.extra.sv_gain,
                center.ability.extra.mult_mod * center.sell_cost
            }
        }
    end,

    calculate = function (self, card, context)
        local mult = card.ability.extra.mult_mod * card.sell_cost

        if not (context.individual or context.repetition) then
            -- Give the mult during play
            if context.joker_main then
                return {
                    mult_mod = mult,
                    message = localize{ type = 'variable', key = 'a_mult', vars = { mult } },
                }
            end

            -- Increase the sell value at end of round
            if context.end_of_round and not context.blueprint then
                if card.set_cost then
                    card.ability.extra_value = (card.ability.extra_value or 0) + 1
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


-- JokerDisplay mod integration
if SMODS.Mods["JokerDisplay"] and _G["JokerDisplay"] then
    jd_def = JokerDisplay.Definitions

    jd_def["j_pape_wish_you_were_here"] = {
        text = {
            { text = '+', },
            { ref_table = 'card.joker_display_values', ref_value = 'mult' },
        },
        text_config = {
            colour = G.C.MULT
        },

        calc_function = function(card)
            card.joker_display_values.mult = card.ability.extra.mult_mod * card.sell_cost
        end
    }
end