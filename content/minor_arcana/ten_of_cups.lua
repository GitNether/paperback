SMODS.Consumable {
  key = 'ten_of_cups',
  set = 'paperback_minor_arcana',
  atlas = 'minor_arcana_atlas',
  pos = { x = 2, y = 1 },
  unlocked = true,
  discovered = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
  end,

  can_use = function(self, card)
    return #G.hand.highlighted == 1 and not G.hand.highlighted[1].edition
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, nil, function()
      G.hand.highlighted[1]:set_edition('e_polychrome', true)
    end)
  end
}
