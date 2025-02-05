SMODS.Joker {
  key = 'union_card',
  rarity = 3,
  pos = { x = 8, y = 1 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')
  end,

  add_to_deck = function(self, card, from_debuff)
    card.sell_cost = 0

    for k, v in ipairs(G.jokers.cards) do
      if v.set_cost then
        v.zero_sell_cost = true
        v:set_cost()
      end
    end

    for k, v in ipairs(G.consumeables.cards) do
      if v.set_cost then
        v.zero_sell_cost = true
        v:set_cost()
      end
    end
  end,

  remove_from_deck = function(self, card, from_debuff)
    for k, v in ipairs(G.jokers.cards) do
      if v.set_cost then
        v.custom_sell_cost = false
        v:set_cost()
      end
    end

    for k, v in ipairs(G.consumeables.cards) do
      if v.set_cost then
        v.custom_sell_cost = false
        v:set_cost()
      end
    end
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
      local suitable_cards = 0

      for k, v in ipairs(context.scoring_hand) do
        if PB_UTIL.is_suit(v, 'light') then
          suitable_cards = suitable_cards + 1
        end
      end

      if suitable_cards > 1 then
        return {
          x_mult = suitable_cards,
          card = card
        }
      end
    end
  end
}

-- If user has Union Card, set the newly acquired card to $0
local add_to_deck_ref = Card.add_to_deck
Card.add_to_deck = function(self, from_debuff)
  add_to_deck_ref(self, from_debuff)

  if next(SMODS.find_card("j_paperback_union_card")) then
    self.sell_cost = 0
  end
end
