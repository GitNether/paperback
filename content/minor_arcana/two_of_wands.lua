PB_UTIL.MinorArcana {
  key = 'two_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 1, y = 2 },

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area)
    local hands = PB_UTIL.get_most_played_hands()
    local most = hands[1].planet_key
    local least = hands[#hands].planet_key

    PB_UTIL.use_consumable_animation(card, nil, function()
      PB_UTIL.try_spawn_card { key = most, instant = true }
      PB_UTIL.try_spawn_card { key = least, instant = true }
    end, 'timpani')
  end
}
