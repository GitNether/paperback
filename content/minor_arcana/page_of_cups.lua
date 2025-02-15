SMODS.Consumable {
  key = 'page_of_cups',
  set = 'paperback_minor_arcana',
  config = {
    max_highlighted = 2
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 3, y = 1 },
  unlocked = true,
  discovered = true,
  paperback = {
    requires_paperclips = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.paperclip_tooltip('white')

    return {
      vars = {
        card.ability.max_highlighted
      }
    }
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for _, v in ipairs(G.hand.highlighted) do
        PB_UTIL.set_paperclip(v, 'white')
      end
    end)
  end
}
