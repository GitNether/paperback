SMODS.Joker {
    key = 'nachos',
    loc_txt = {
        name = "Nachos",
        text = {
            "{X:chips,C:white}X#1#{} Chips,",
            "loses {X:chips,C:white}X#2#{} Chips",
            "per {C:attention}card{} discarded"
        }
    },
    config = {
        extra = {
            X_chips = 2,
            reduction_amount = 0.05,
        }
    },
    rarity = 1,
    pos = { x = 9, y = 1 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    soul_pos = nil,

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.X_chips = card.ability.extra.X_chips or 1
        card.ability.extra.reduction_amount = 0.05
    end,

    loc_vars = function(self, info_queue, center) 
            return {
                vars = {
                    center.ability.extra.X_chips,
                    center.ability.extra.reduction_amount
                }
            }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            PB_UTIL.xChips(card.ability.extra.X_chips, card)

        elseif context.discard then
            if not context.blueprint then
                if card.ability.extra.X_chips - card.ability.extra.reduction_amount <= 1 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                    return true; end}))
                            return true
                        end
                    }))
                    return {
                        message = localize('k_eaten_ex'),
                        colour = G.C.FILTER
                    }
                else
                    card.ability.extra.X_chips = card.ability.extra.X_chips - card.ability.extra.reduction_amount
                    return {
                        delay = 0.2,
                        message = localize{type='variable',key='a_xmult_minus',vars={card.ability.extra.reduction_amount}},
                        colour = G.C.CHIPS
                    }
                end
            end
        end
    end
}

-- JokerDisplay mod integration
if SMODS.Mods["JokerDisplay"] then
    jd_def = JokerDisplay.Definitions

    jd_def["j_pape_nachos"] = {
        line_1 = {
            {
                border_nodes = {
                    {
                        text = "X"
                    },
                    {
                        ref_table = "card.ability.extra",
                        ref_value = "X_chips"
                    },
                    colour = G.C.CHIPS
                },
                border_colour = G.C.CHIPS
            }
        }
    }
end


