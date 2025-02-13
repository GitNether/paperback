SMODS.Consumable {
  key = 'queen_of_cups',
  set = 'paperback_minor_arcana',
  config = {
    max_highlighted = 1,
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 5, y = 1 },
  unlocked = true,
  discovered = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted
      }
    }
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for k, v in ipairs(G.hand.highlighted) do
        v:set_ability(G.P_CENTERS["m_paperback_porcelain"])
      end
    end)
  end
}