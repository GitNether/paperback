PB_UTIL.MinorArcana {
  key = 'seven_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 6, y = 2 },
  paperback = {
    requires_tags = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_bunc_breaking or G.P_TAGS.tag_paperback_breaking
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card)
    PB_UTIL.use_consumable_animation(card, nil, function()
      local key = SMODS.Tags.tag_bunc_breaking and 'tag_bunc_breaking' or 'tag_paperback_breaking'
      PB_UTIL.add_tag(key)
    end)
  end
}
