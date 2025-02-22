PB_UTIL.MinorArcana {
  key = 'eight_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 0, y = 3 },
  config = {
    cost = 15
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_negative

    return {
      vars = {
        card.ability.cost
      }
    }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, nil, function()
      PB_UTIL.add_tag('tag_negative')
      ease_dollars(-card.ability.cost)
    end)
  end
}
