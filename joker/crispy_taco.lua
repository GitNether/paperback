SMODS.Joker {
    key = "crispy_taco",
    loc_txt = {
        name = "Crispy Taco",
        text = {
            "{X:chips,C:white}X#1#{} Chips. {C:green}#2# in #3#{} chance this card",
            "is {C:attention}destroyed{} at end of round."
        }
    },
    config = {
        extra = {
            x_chips = 3,
            odds = 6
        }
    },
    rarity = 2,
    pos = { x = 1, y = 2 },
    atlas = "jokers_atlas",
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    soul_pos = nil,

    no_pool_flag = "soft_taco_can_spawn",
    
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.x_chips,
                G.GAME.probabilities.normal,
                center.ability.extra.odds
            }
        }
    end,

    calculate = function (self, card, context)
        -- Scores the xChips
        if context.cardarea == G.jokers and context.joker_main then
            PB_UTIL.xChips(card.ability.extra.x_chips, card)
        end

        -- Checks if Joker should be destroyed at the end of the round
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
            if pseudorandom("Crispy Taco") < G.GAME.probabilities.normal/card.ability.extra.odds then
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

                                                        -- Allows Soft Taco to spawn, prevents Crispy Taco from spawning
                                                        G.GAME.pool_flags.soft_taco_can_spawn = true

                                                        return true; end }))
                        return true
                    end
                }))

                return {
                    message = "Destroyed",
                    colour = G.C.CHIPS,
                    card = card
                }
            else
                return {
                    message = localize('k_safe_ex'),
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end
    end
}

-- -- Creates the flag
-- local BackApply_to_run_ref = Back.apply_to_run
-- function Back.apply_to_run(arg_56_0)
--     BackApply_to_run_ref(arg_56_0)
--     G.GAME.pool_flags.soft_taco_can_spawn = false
-- end


-- JokerDisplay mod integration
if SMODS.Mods["JokerDisplay"] and _G["JokerDisplay"] then
    jd_def = JokerDisplay.Definitions

    jd_def["j_pape_crispy_taco"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = 'card.ability.extra', ref_value = 'x_chips' },
                },
                border_colour = G.C.CHIPS
            }
        }
    }
end