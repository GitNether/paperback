PB_UTIL.MinorArcana {
  key = 'six_of_cups',
  config = {
    max_highlighted = 1
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 5, y = 0 },

  use = function(self, card, area)
    local money = math.floor(G.hand.highlighted[1]:get_chip_bonus() / 2)

    if money > 0 then
      PB_UTIL.use_consumable_animation(card, nil, function()
        ease_dollars(money)
      end)
    end
  end
}
