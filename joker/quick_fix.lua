SMODS.Joker {
    key = 'quick_fix',
    loc_txt = {
        name = "Quick Fix",
        text = {
            "{C:attention}+#1#{} Hand Size.", 
            "{C:green}#2# in #3#{} chance this",
            "card is destroyed",
            "at end of round"
        }
    },
    config = {
        extra = {
            h_size = 2,
            odds = 4
        }
    },
    rarity = 2,
    pos = { x = 6, y = 0 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.h_size = card.ability.extra.h_size or 0
        card.ability.extra.odds = card.ability.extra.odds or 1
    end,

    loc_vars = function(self, info_queue, center) 
            return {
                vars = {
                    center.ability.h_size,
                    G.GAME.probabilities.normal,
                    center.ability.extra.odds
                }
            }
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
            if pseudorandom("Quick Fix") < G.GAME.probabilities.normal/card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3,0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                                    func = function()
                                                        G.jokers:remove_card(card)
                                                        card:remove()
                                                        card = nil
                                                        return true; end }))
                        return true
                    end
                }))

                return {
                    message = "Destroyed",
                    colour = G.C.MULT,
                    card = card
                }
            else
                return {
                    message = localize('k_safe_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end
}


-- JokerDisplay integration
if SMODS.Mods["JokerDisplay"] and _G["JokerDisplay"] then
    JokerDisplay.Definitions["j_pape_quick_fix"] = {
        reminder_text = {
            { text = "(+" },
            { ref_table = 'card.ability.extra', ref_value = 'h_size' },
            { text = ")" },
        },

        reminder_text_config = {
            scale = 0.35
        },

        extra = {
            {
                { text = "(" },
                { ref_table = 'G.GAME.probabilities', ref_value = 'normal' },
                { text = " in " },
                { ref_table = 'card.ability.extra', ref_value = 'odds' },
                { text = ')' },
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 }
    }
end
