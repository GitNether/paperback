SMODS.Joker {
    key = 'ghost_cola',
    loc_txt = {
        name = "Ghost Cola",
        text = {
            "Sell this card to create a {C:attention}#1#{}",
            "and a random {C:dark_edition}Negative{} {C:spectral}Spectral{} card.",
        }
    },
    config = {},
    rarity = 2,
    pos = { x = 5, y = 1 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = nil,

    yes_pool_flag = "diet_cola_sold",
    no_pool_flag = "ghost_cola_can_spawn",

    loc_vars = function(self, info_queue, center) 
            return {
                vars = {
                    localize{type = 'name_text', set = 'Tag', key = 'tag_negative', nodes = {}},
                }
            }
    end,
    
    calculate = function(self, card, context)
        if context.selling_self then
            -- Adds the negative tag
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_negative'))
                    return true
                end)
            }))

            -- Creates the negative spectral card
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                        local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                        local edition = {negative = true}
                        card:set_edition(edition, true)
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                    return true
                end
            )}))

            -- Make Ghost Cola extinct
            G.GAME.pool_flags.ghost_cola_can_spawn = false
        end
    end,
}

-- Code to allow Ghost Cola to show up
-- in the shop When Diet Cola is sold
--------------------------------------------------

-- Creates the flag
local BackApply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
    BackApply_to_run_ref(arg_56_0)
    G.GAME.pool_flags.diet_cola_sold = false
    G.GAME.pool_flags.ghost_cola_can_spawn = true
end

-- Modifies the `diet_cola_sold` flag
local calculate_joker_ref = Card.calculate_joker
function Card:calculate_joker(context)
    local ret = calculate_joker_ref(self, context)

    if self.ability.set == "Joker" and not self.debuff then
        if context.selling_self then
            if self.ability.name == 'Diet Cola' then
                G.GAME.pool_flags.diet_cola_sold = true
            end
        end
    end

    return ret
end
--------------------------------------------------
