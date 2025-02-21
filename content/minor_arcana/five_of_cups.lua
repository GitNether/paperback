SMODS.Consumable {
  key = 'five_of_cups',
  set = 'paperback_minor_arcana',
  config = {
    max_highlighted = 2,
    mod_conv = 'm_paperback_soaked'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 4, y = 0 },
  unlocked = true,
  discovered = true,
  paperback = {
    requires_enhancements = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]

    return {
      vars = {
        card.ability.max_highlighted,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.mod_conv
        }
      }
    }
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for _, highlight_card in ipairs(G.hand.highlighted) do
        highlight_card:set_ability(G.P_CENTERS[card.ability.mod_conv])
      end
    end)
  end
}
