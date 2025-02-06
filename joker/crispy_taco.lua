SMODS.Joker {
  key = "crispy_taco",
  config = {
    extra = {
      x_chips = 3,
      odds = 6
    }
  },
  rarity = 2,
  pos = { x = 1, y = 2 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,

  no_pool_flag = "soft_taco_can_spawn",
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_chips,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    -- Scores the xChips
    if context.joker_main then
      return {
        paperback_x_chips = card.ability.extra.x_chips
      }
    end

    -- Checks if Joker should be destroyed at the end of the round
    if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
      if pseudorandom("Crispy Taco") < G.GAME.probabilities.normal / card.ability.extra.odds then
        PB_UTIL.destroy_joker(card, function()
          -- Allows Soft Taco to spawn, prevents Crispy Taco from spawning
          G.GAME.pool_flags.soft_taco_can_spawn = true
        end)

        return {
          message = localize('k_eaten_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      else
        return {
          message = localize('k_safe_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      end
    end
  end
}
