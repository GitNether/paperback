SMODS.Joker {
  key = 'shopping_center',
  rarity = 1,
  pos = { x = 7, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  unlocked = false,

  -- On Joker spawn, add additional slot in shop
  add_to_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        change_shop_size(1)
        return true
      end
    }))
  end,

  -- On Joker despawn, remove the additional slot in shop
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.shop.joker_max = G.GAME.shop.joker_max - 1
  end
}
