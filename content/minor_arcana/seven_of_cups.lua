PB_UTIL.MinorArcana {
  key = 'seven_of_cups',
  config = {
    max_highlighted = 3
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 6, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted
      }
    }
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for _, v in ipairs(G.hand.highlighted) do
        local enhancement = SMODS.poll_enhancement {
          type_key = 'seven_of_cups',
          guaranteed = true
        }

        v:set_ability(G.P_CENTERS[enhancement])
      end
    end)
  end
}
