SMODS.Joker {
    key = "jimbo_adventure",
    loc_txt = {
        name = "Jimbo Adventure",
        text = {
            "Skipping a {C:attention}blind{} creates",
            "a random {C:attention}Tag{}"
        }
    },
    
    rarity = 1,
    pos = { x = 1, y = 5 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 2, y = 5 },

    calculate = function(self, info_queue, card)
        if context.skip_blind then

        end
    end,
}