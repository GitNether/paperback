PB_UTIL.MinorArcana {
  key = 'ten_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 2, y = 3 },
  config = {
    min_highlighted = 3,
    max_highlighted = 3
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted
      }
    }
  end,

  use = function(self, card)
    local cards = {}

    for i = 1, card.ability.max_highlighted do
      cards[i] = G.hand.highlighted[i]
    end

    table.sort(cards, function(a, b)
      return a.T.x < b.T.x
    end)

    local left = table.remove(cards, 1)
    local increase = 0

    for k, v in ipairs(cards) do
      increase = increase + v:get_chip_bonus()
    end

    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      if left then
        left.ability.perma_bonus = (left.ability.perma_bonus or 0) + increase
      end
      PB_UTIL.destroy_playing_cards(cards)
    end)
  end
}
