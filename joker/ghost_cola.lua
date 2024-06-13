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
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,
    
    calculate = function(self, card, context)
        
    end,
}