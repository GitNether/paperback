SMODS.Joker {
    key = "charred_marshmallow",
    loc_txt = {
        name = "Charred Marshmallow",
        text = {
            "Scored {C:spades}Spades{} give {C:mult}+#1#{} Mult",
            "{C:green}#2# in #3#{} chance this card is",
            "eaten at end of round"
        }
    },
    config = {
        extra = {
            mult = 5,
            odds = 6
        }
    },
    rarity = 2,
    pos = { x = 4, y = 3 },
    atlas = 'jokers_atlas',
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    soul_pos = nil,
    yes_pool_flag = "charred_marshmallow_can_spawn",

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.mult,
                G.GAME.probabilities.normal,
                center.ability.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        -- Give the mult during play if card is a Spade
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Spades") then
                return {
                    mult = 5,
                    card = card
                }
            end
        end

        -- Check if the Joker needs to be eaten
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
            if pseudorandom("Charred Marshmallow") < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                -- card = nil

                                -- Remove Charred Marshmallow from the pool
                                G.GAME.pool_flags.charred_marshmallow_can_spawn = false

                                -- Create Popsicle Stick
                                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                    local jokers_to_create = math.min(1,
                                        G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                                    G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                                    
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            local card = create_card('Joker', G.jokers, nil, 0, nil, nil, 'j_pape_sticky_stick', nil)
                                            card:add_to_deck()
                                            G.jokers:emplace(card)
                                            card:start_materialize()
                                            G.GAME.joker_buffer = 0
                                            return true
                                        end
                                    }))
                                end
                                return true;
                            end
                        }))
                        return true
                    end
                }))

                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.MULT,
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