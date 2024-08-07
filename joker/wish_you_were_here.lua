SMODS.Joker {
    key = "wish_you_were_here",
    loc_txt = {
        name = "Wish You Were Here",
        text = {
            "Gives {C:mult}Mult{} equal to {C:attention}triple{}",
            "this Joker's {C:money}Sell Value{}.",
            "Gains {C:attention}+#1#{} {C:money}Sell Value{} after",
            "clearing a {C:attention}blind{}.",
            "{C:inactive}(Currently {C:mult}+#2# {C:inactive}Mult){}"
        }
    },
    config = {
        extra = {
            sv_gain = 1,
            -- Figure out how to get this to calculate the sell_value on spawn
            mult = 0
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

    -- set_ability = function(self, card, initial, delay_sprites)
    --     card.ability.extra.mult = 3 * card.sell_cost
    -- end,

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.sv_gain,
                center.ability.extra.mult
            }
        }
    end,

    calculate = function (self, card, context)
        -- card.ability.extra.mult = 3 * card.sell_cost

        if not (context.individual or context.repetition) then
            -- Give the mult during play
            if context.joker_main then
                return {
                    mult_mod = card.ability.extra.mult,
                    message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                }
            end

            -- Increase the sell value at end of round
            if context.end_of_round and not context.blueprint then
                card.sell_cost = card.sell_cost + card.ability.extra.sv_gain

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
            { ref_table = 'card.ability.extra', ref_value = 'mult' },
        },
        text_config = {
            colour = G.C.MULT
        }
    }
end