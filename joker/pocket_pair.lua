SMODS.Joker {
  key = 'pocket_pair',
  config = {
    extra = {
      hand = "Pair",
      money = 3
    }
  },
  rarity = 1,
  pos = { x = 0, y = 8 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money,
        localize(card.ability.extra.hand, 'poker_hands')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.first_hand_drawn then
      local eff_card = context.blueprint_card or card

      G.E_MANAGER:add_event(Event {
        func = function()
          local _, _, hands = G.FUNCS.get_poker_hand_info(G.hand.cards)
          local amount = #hands[card.ability.extra.hand]

          if amount > 0 then
            SMODS.calculate_effect({
              dollars = card.ability.extra.money * amount
            }, eff_card)
          end

          return true
        end
      })
    end
  end
}
