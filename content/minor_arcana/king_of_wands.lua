PB_UTIL.MinorArcana {
  key = 'king_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 6, y = 3 },

  can_use = function(self, card)
    return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
  end,

  use = function(self, card)
    local rarity = 1

    while rarity == 1 or rarity == 4 do
      rarity = SMODS.poll_rarity('Joker', 'king_of_wands')
    end

    if type(rarity) == "number" and rarity > 1 and rarity < 4 then
      rarity = PB_UTIL.base_rarities[rarity]
    end

    PB_UTIL.use_consumable_animation(card, nil, function()
      PB_UTIL.try_spawn_card { set = 'Joker', rarity = rarity, instant = true }
    end)
  end
}
