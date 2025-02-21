PB_UTIL.MinorArcana {
  key = 'ten_of_cups',
  atlas = 'minor_arcana_atlas',
  pos = { x = 2, y = 1 },
  config = {
    extra = {
      odds = 3
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome

    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  can_use = function(self, card)
    return #G.hand.highlighted == 1 and not G.hand.highlighted[1].edition
  end,

  use = function(self, card, area)
    if pseudorandom("ten_of_cups") < G.GAME.probabilities.normal / card.ability.extra.odds then
      PB_UTIL.use_consumable_animation(card, nil, function()
        G.hand.highlighted[1]:set_edition('e_polychrome', true)
      end)
    else
      PB_UTIL.show_nope_text(card, G.C.PAPERBACK_MINOR_ARCANA)
    end
  end
}
