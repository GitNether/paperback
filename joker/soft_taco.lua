SMODS.Joker {
    key = "soft_taco",
    loc_txt = {
        name = "Soft Taco",
        text = {
            "{X:mult,C:white}X#1#{} Mult. {C:green}#2# in #3#{} chance this card",
            "is {C:attention}destroyed{} at end of round."
        }
    },
    config = {
        extra = {
            x_mult = 3,
            odds = 10
        }
    },
    rarity = 2,
    pos = { x = 0, y = 2 },
    atlas = "jokers_atlas",
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    soul_pos = nil,

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.x_mult,
                G.GAME.probabilities.normal,
                center.ability.extra.odds
            }
        }
    end,

    calculate = function (self, card, context)
        -- Scores the xMult
        if context.cardarea == G.jokers and context.joker_main then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end

        -- Checks if Joker should be destroyed at the end of the round
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
            if pseudorandom("Soft Taco") < G.GAME.probabilities.normal/card.ability.extra.odds then
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


-- JokerDisplay mod integration
if SMODS.Mods["JokerDisplay"] and _G["JokerDisplay"] then
    jd_def = JokerDisplay.Definitions

    jd_def["j_pape_soft_taco"] = {
        line_1 = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = 'card.ability.extra', ref_value = 'x_mult' },
                },
            }
        }
    }
end