SMODS.Joker {
  key = 'paranoia',
  rarity = 3,
  pos = { x = 6, y = 3 },
  atlas = 'jokers_atlas',
  cost = 8,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')
  end,

  calculate = function(self, card, context)
    if not context.blueprint then
      if context.after and not (context.repetition or context.individual) then
        local destroyed_cards = {}

        -- Add the light cards in hand to be destroyed to the list
        for i = #G.hand.cards, 1, -1 do
          local current_card = G.hand.cards[i]
          if PB_UTIL.is_suit(current_card, 'light') then
            destroyed_cards[#destroyed_cards + 1] = current_card
          end
        end

        -- Add the dark cards in scoring_hand to be destroyed to the list
        for i = #G.play.cards, 1, -1 do
          local current_card = G.play.cards[i]
          if PB_UTIL.is_suit(current_card, 'dark') then
            destroyed_cards[#destroyed_cards + 1] = current_card
          end
        end

        PB_UTIL.destroy_playing_cards(destroyed_cards, card, {
          message = localize('paperback_too_late_ex'),
          colour = G.C.MULT
        })
      end
    end
  end
}
