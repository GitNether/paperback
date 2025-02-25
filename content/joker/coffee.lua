SMODS.Joker {
  key = "coffee",
  config = {
    extra = {
      hand_size = 0,
      increase = 1,
      odds = 5
    }
  },
  rarity = 2,
  pos = { x = 3, y = 6 },
  atlas = 'jokers_atlas',
  cost = 6,
  blueprint_compat = false,
  eternal_compat = false,
  pools = {
    Food = true
  },
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.hand_size,
        card.ability.extra.increase,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end

    if context.skip_blind then
      -- Increment the hand size when skipping a blind
      card.ability.extra.hand_size = card.ability.extra.hand_size + card.ability.extra.increase
      G.hand:change_size(card.ability.extra.increase)

      return {
        message = localize('k_upgrade_ex')
      }
    end

    if context.setting_blind and not context.blind.boss then
      if pseudorandom("coffee") < G.GAME.probabilities.normal / card.ability.extra.odds then
        PB_UTIL.destroy_joker(card)

        -- Revert all the hand size increase when eaten
        G.hand:change_size(-card.ability.extra.hand_size)

        return {
          message = localize('paperback_consumed_ex'),
          colour = G.C.MULT
        }
      end
    end
  end
}
