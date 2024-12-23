loc_colour('dark_suit')
loc_colour('light_suit')

G.ARGS.LOC_COLOURS['Dark_suit'] = HEX('3c4a4e')
G.ARGS.LOC_COLOURS['Light_suit'] = HEX('f06841')


SMODS.Joker {
  key = 'paranoia',
  loc_txt = {
    name = "Paranoia",
    text = {
      "After scoring a hand, destroy all {C:Dark_suit}dark suits{} played",
      "and all {C:Light_suit}light suits{} held in hand"
    }
  },
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

                
        local dissolve_time_fac = 1
        -- The event to handle deleting the cards in destroyed_cards
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.7*dissolve_time_fac*1.051,
          func = function()
            if #destroyed_cards ~= 0 then
              card_eval_status_text(card, 'extra', nil, nil, nil, { message = "TOO LATE!", colour = G.C.MULT, instant = true})

              play_sound('tarot1')
              card:juice_up(0.3, 0.5)
            end

            for i = #destroyed_cards, 1, -1 do
              local current_card = destroyed_cards[i]
              if not current_card.removed then
                if current_card.ability.name == 'Glass Card' then
                  current_card:shatter()
                else
                  current_card:start_dissolve(nil, nil, dissolve_time_fac)
                end 
              end
            end
            return true
          end
        }))

        for _, current_card in ipairs(destroyed_cards) do
          current_card.destroyed = true
        end

        for i = 1, #G.jokers.cards do
          G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = destroyed_cards })
        end
      end
    end
  end
}
