SMODS.Joker {
  key = "reference_card",
  config = {
    extra = {
      x_mult = 1,
      x_mult_mod = 2
    }
  },
  rarity = 1,
  pos = { x = 3, y = 2 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  set_ability = function(self, card, initial, delay_sprites)
    calculate_highest_shared_played(card)
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult_mod,
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    -- Gives the xMult during play
    if context.joker_main then
      calculate_highest_shared_played(card)

      if card.ability.extra.x_mult ~= 1 then
        return {
          x_mult = card.ability.extra.x_mult,
          card = card
        }
      end
    end
  end
}


-- Helper function to find the mininum played hand in G.GAME.hands in all base poker hands
function calculate_highest_shared_played(card)
  local hands = G.GAME.hands

  local min_played = hands[PB_UTIL.base_poker_hands[1]].played

  for _, hand in ipairs(PB_UTIL.base_poker_hands) do
    local current_hand = hands[hand]

    if current_hand.played < min_played then
      min_played = current_hand.played
    end
  end

  -- set the card's x_mult to a value depending on the minimum played
  card.ability.extra.x_mult = card.ability.extra.x_mult_mod * min_played + 1
end
