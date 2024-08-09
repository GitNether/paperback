SMODS.Joker {
    key = 'shopping_center',
    loc_txt = {
        name = "Shopping Center",
        text = {
            "{C:money}Shops{} have an additional",
            "{C:attention}card slot"
        }
    },
    rarity = 1,
    pos = { x = 7, y = 1 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = nil,
    
    -- On Joker spawn, add additional slot in shop
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            change_shop_size(1)
            return true end }))
    end,

    -- On Joker despawn, remove the additional slot in shop
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            change_shop_size(-1)
            return true end }))
    end
}
