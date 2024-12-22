SMODS.Joker {
  key = 'paranoia',
  loc_txt = {
    name = "Paranoia",
    text = {
      "After scoring a hand, destroy all {C:dark_suit}dark{} suits played",
      "and all {C:light_suit}light suits held in hand"
    }
  },
  rarity = 3,
  pos = { x = 6, y = 3 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
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


        -- Plays the tarot sound and juices up the joker card
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true
          end
        }))

        -- The event to handle deleting the cards in destroyed_cards
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.2,
          func = function()
            for i = #destroyed_cards, 1, -1 do
              local current_card = destroyed_cards[i]
              if current_card.ability.name == 'Glass Card' then
                current_card:shatter()
              else
                current_card:start_dissolve(nil, i == #destroyed_cards)
              end
            end
            return true
          end
        }))

        delay(0.3)

        for i = 1, #G.jokers.cards do
          G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = destroyed_cards })
        end
      end
    end
  end
}

G.C.DARK_SUIT = HEX('324975')
G.C.LIGHT_SUIT = HEX('f05250')
