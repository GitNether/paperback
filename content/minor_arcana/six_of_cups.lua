PB_UTIL.MinorArcana {
  key = 'six_of_cups',
  config = {
    max_highlighted = 1,
    money_cap = 30,
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 5, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted,
        card.ability.money_cap
      }
    }
  end,

  use = function(self, card, area)
    local money = math.ceil(G.hand.highlighted[1]:get_chip_bonus() / 2)

    if money > 0 then
      PB_UTIL.use_consumable_animation(card, nil, function()
        ease_dollars(math.min(card.ability.money_cap, money))
      end)
    end
  end
}
