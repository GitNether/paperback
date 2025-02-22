PB_UTIL.MinorArcana {
  key = 'knight_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 4, y = 3 },


  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_investment
  end,

  can_use = function(self, card)
    -- Currently the UI doesn't update in real time if this is used in the
    -- Blind Select screen, so I just disable its usage here
    return G.STATE ~= G.STATES.BLIND_SELECT
  end,

  use = function(self, card)
    G.E_MANAGER:add_event(Event {
      trigger = 'after',
      delay = 0.6,
      func = function()
        PB_UTIL.add_tag('tag_investment')
        card:juice_up()
        return true
      end
    })

    G.E_MANAGER:add_event(Event {
      trigger = 'after',
      delay = 0.4,
      func = function()
        PB_UTIL.modify_extra_boss_scaling(2)
        card:juice_up()
        return true
      end
    })
  end
}
