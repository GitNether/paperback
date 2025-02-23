PB_UTIL.MinorArcana {
  key = 'knight_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 4, y = 3 },
  paperback = {
    requires_tags = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_paperback_high_risk
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card)
    PB_UTIL.use_consumable_animation(card, nil, function()
      PB_UTIL.add_tag('tag_paperback_high_risk')
    end)
  end
}
