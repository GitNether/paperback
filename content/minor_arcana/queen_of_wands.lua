PB_UTIL.MinorArcana {
  key = 'queen_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 5, y = 3 },
  config = {
    odds = 3
  },
  paperback = {
    requires_editions = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_paperback_dichrome

    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.odds
      }
    }
  end,

  can_use = function(self, card)
    if not G.jokers then return end

    for k, v in ipairs(G.jokers.cards) do
      if not v.edition then
        return true
      end
    end
  end,

  use = function(self, card)
    local jokers = {}

    for k, v in ipairs(G.jokers.cards) do
      if not v.edition then jokers[#jokers + 1] = v end
    end

    if pseudorandom('queen_of_wands') < G.GAME.probabilities.normal / card.ability.odds then
      local joker = pseudorandom_element(jokers, pseudoseed('queen_of_wands_joker'))

      PB_UTIL.use_consumable_animation(card, nil, function()
        joker:set_edition('e_paperback_dichrome', true)
      end)
    else
      PB_UTIL.show_nope_text(card, G.C.PAPERBACK_MINOR_ARCANA)
    end
  end
}
