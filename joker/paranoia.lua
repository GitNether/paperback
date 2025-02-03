loc_colour('dark_suit')
loc_colour('light_suit')

G.ARGS.LOC_COLOURS['Dark_suit'] = HEX('3c4a4e')
G.ARGS.LOC_COLOURS['Light_suit'] = HEX('f06841')

SMODS.Joker {
  key = 'paranoia',
  rarity = 3,
  pos = { x = 6, y = 3 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  calculate = function(self, card, context)
    if not context.blueprint then
      if context.after and not (context.repetition or context.individual) then
        local destroyed_cards = {}

        -- Add the light cards in hand to be destroyed to the list
        for i = #G.hand.cards, 1, -1 do
          local current_card = G.hand.cards[i]
          if current_card:is_suit("Hearts") or current_card:is_suit("Diamonds") then
            destroyed_cards[#destroyed_cards + 1] = current_card
          end
        end

        -- Add the dark cards in scoring_hand to be destroyed to the list
        for i = #G.play.cards, 1, -1 do
          local current_card = G.play.cards[i]
          if current_card:is_suit("Spades") or current_card:is_suit("Clubs") then
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
