SMODS.Consumable {
  key = 'queen_of_cups',
  set = 'paperback_minor_arcana',
  config = {
    max_highlighted = 1,
    mod_conv = 'm_paperback_ceramic'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 5, y = 1 },
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
      for _, highlighted_card in ipairs(G.hand.highlighted) do
        highlighted_card:set_ability(G.P_CENTERS[card.ability.mod_conv])
      end
    end)
  end
}
