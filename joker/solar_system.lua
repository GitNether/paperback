SMODS.Joker {
  key = "solar_system",
  config = {
    extra = {
      x_mult_mod = 2,
      x_mult = 1
    }
  },
  rarity = 3,
  pos = { x = 7, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  set_ability = function(self, card, initial, delay_sprites)
    calculate_highest_shared_level(card)
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
    -- If a hand is being leveled up, recalculate the xMult bonus
    if context.level_up_hand then
      calculate_highest_shared_level(card)
    end

    -- Gives the xMult during play
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
        card = card
      }
    end
  end
}


-- Creates the context for leveling up a hand, used by Solar System to update Joker description
local level_up_hand_ref = level_up_hand
function level_up_hand(card, hand, instant, amount)
  level_up_hand_ref(card, hand, instant, amount)

  -- Do stuff
  for i = 1, #G.jokers.cards do
    G.jokers.cards[i]:calculate_joker({ level_up_hand = true })
  end
end

-- Helper function to find the minimum level in G.GAME.hands (The shared level) in base 9 planets
function calculate_highest_shared_level(card)
  local hands = G.GAME.hands

  -- Only search for levels in the base planets
  local subset_keys = {
    "Straight Flush",
    "Four of a Kind",
    "Full House",
    "Flush",
    "Straight",
    "Three of a Kind",
    "Two Pair",
    "Pair",
    "High Card"
  }

  -- set the minimum level to the first planet in the subset
  local min_level = hands[subset_keys[1]].level

  -- go through each hand, comparing them to the first hand in subset
  for _, hand in ipairs(subset_keys) do
    local current_hand = hands[hand]

    -- if the hand level is lower, set the minimum level to that value
    if current_hand.level < min_level then
      min_level = current_hand.level
    end
  end

  -- set the card's x_mult to a value depending on the minimum level
  if card.ability.extra.x_mult_mod * min_level == 0 then
    card.ability.extra.x_mult = card.ability.extra.x_mult_mod * 1
  else
    card.ability.extra.x_mult = card.ability.extra.x_mult_mod * min_level
  end
end
