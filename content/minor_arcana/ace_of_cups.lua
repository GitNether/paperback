SMODS.Consumable {
  key = 'ace_of_cups',
  set = 'paperback_minor_arcana',
  config = {
    max_highlighted = 3
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 3, y = 0 },
  unlocked = true,
  discovered = true,
  paperback = {
    requires_paperclips = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.paperclip_tooltip('blue')

    return {
      vars = {
        card.ability.max_highlighted
      }
    }
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for _, v in ipairs(G.hand.highlighted) do
        PB_UTIL.set_paperclip(v, 'blue')
      end
    end)
  end
}
