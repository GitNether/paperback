SMODS.Joker {
    key = 'ghost_cola',
    loc_txt = {
        name = "Ghost Cola",
        text = {
            "On {C:attention}Sell{}, create a {C:dark_edition}Negative{} Tag",
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
        end
    end,
}


