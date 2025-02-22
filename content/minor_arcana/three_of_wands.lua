PB_UTIL.MinorArcana {
  key = 'three_of_wands',
  config = {
    max_highlighted = 1
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 2, y = 2 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted
      }
    }
  end,

  use = function(self, card, area)
    G.E_MANAGER:add_event(Event {
      func = function()
        -- Literally what Cryptid (the card) does but only once
        G.playing_card = (G.playing_card or 0) + 1
        local new_card = copy_card(G.hand.highlighted[1], nil, nil, G.playing_card)
        new_card:add_to_deck()
        G.deck.config.card_limit = G.deck.config.card_limit + 1
        table.insert(G.playing_cards, new_card)
        G.hand:emplace(new_card)
        new_card:start_materialize(nil, _first_dissolve)

        playing_card_joker_effects { new_card }
        return true
      end
    })
  end
}
