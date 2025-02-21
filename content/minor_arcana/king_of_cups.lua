PB_UTIL.MinorArcana {
  key = 'king_of_cups',
  config = {
    extra = {
      money = 5,
    }
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 6, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money,
        PB_UTIL.get_complete_suits(true) * card.ability.extra.money
      }
    }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area)
    local amount = PB_UTIL.get_complete_suits(true)

    G.E_MANAGER:add_event(Event {
      trigger = 'after',
      delay = 0.4,
      func = function()
        if amount > 0 then
          ease_dollars(amount * card.ability.extra.money)
        end
        return true
      end
    })
  end
}
