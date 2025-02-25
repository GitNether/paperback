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
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = false,

  check_for_unlock = function(self, args)
    if args.type == 'upgrade_hand' then
      local hands_leveled = 0

      for k, v in pairs(G.GAME.hands) do
        if v.visible and v.level > 1 then hands_leveled = hands_leveled + 1 end
      end

      return hands_leveled >= 9
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = { 9 }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    PB_UTIL.update_solar_system(card)
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
    if context.paperback and context.paperback.level_up_hand then
      PB_UTIL.update_solar_system(card)
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

function PB_UTIL.update_solar_system(card)
  local hands = G.GAME.hands

  -- set the minimum level to the first planet in the subset
  local min_level = hands[PB_UTIL.base_poker_hands[1]].level

  -- go through each hand, comparing them to the first hand in subset
  for _, hand in ipairs(PB_UTIL.base_poker_hands) do
    local current_hand = hands[hand]

    -- if the hand level is lower, set the minimum level to that value
    if to_big(current_hand.level) < to_big(min_level) then
      min_level = current_hand.level
    end
  end

  -- set the card's x_mult to a value depending on the minimum level
  card.ability.extra.x_mult = card.ability.extra.x_mult_mod * math.max(1, to_number(min_level))
end
