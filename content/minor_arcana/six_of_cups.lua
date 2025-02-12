SMODS.Consumable {
  key = 'six_of_cups',
  set = 'paperback_minor_arcana',
  config = {
    max_highlighted = 1
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 8, y = 0 },
  unlocked = true,
  discovered = true,

  use = function(self, card, area)
    local money = math.floor(G.hand.highlighted[1]:get_chip_bonus() / 2)

    if money > 0 then
      PB_UTIL.use_consumable_animation(card, nil, function()
        ease_dollars(money)
      end)
    end
  end
}
