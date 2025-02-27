PB_UTIL.MinorArcana {
  key = 'five_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 4, y = 2 },

  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0
  end,

  use = function(self, card, area)
    local cards = {}

    for _, v in ipairs(G.hand.cards) do
      cards[#cards + 1] = v
    end

    PB_UTIL.use_consumable_animation(card, nil, function()
      PB_UTIL.destroy_playing_cards(cards)

      if G.GAME.dollars ~= 0 then
        ease_dollars(-G.GAME.dollars, true)
      end
    end)
  end
}
