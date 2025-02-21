PB_UTIL.MinorArcana {
  key = 'two_of_cups',
  atlas = 'minor_arcana_atlas',
  pos = { x = 1, y = 0 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_polychrome
    info_queue[#info_queue + 1] = G.P_TAGS.tag_holo
    info_queue[#info_queue + 1] = G.P_TAGS.tag_foil
    info_queue[#info_queue + 1] = G.P_TAGS.tag_rare
    info_queue[#info_queue + 1] = G.P_TAGS.tag_uncommon
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area)
    local tag = PB_UTIL.poll_tag("two_of_cups", {
      'tag_uncommon',
      'tag_rare',
      'tag_foil',
      'tag_holo',
      'tag_polychrome'
    })

    PB_UTIL.use_consumable_animation(card, nil, function()
      PB_UTIL.add_tag(tag)
    end)
  end
}
