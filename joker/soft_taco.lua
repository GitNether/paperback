SMODS.Joker {
  key = "soft_taco",
  config = {
    extra = {
      x_mult = 3,
      odds = 6
    }
  },
  rarity = 2,
  pos = { x = 0, y = 2 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,

  yes_pool_flag = "soft_taco_can_spawn",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    -- Scores the xMult
    if context.cardarea == G.jokers and context.joker_main then
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
        Xmult_mod = card.ability.extra.x_mult
      }
    end

    -- Checks if Joker should be destroyed at the end of the round
    if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
      if pseudorandom("Soft Taco") < G.GAME.probabilities.normal / card.ability.extra.odds then
        PB_UTIL.destroy_joker(card, function()
          -- Allows Crispy Taco to spawn, prevents Soft Taco from spawning
          G.GAME.pool_flags.soft_taco_can_spawn = false
        end)

        return {
          message = localize('k_eaten_ex'),
          colour = G.C.MULT,
          card = card
        }
      else
        return {
          message = localize('k_safe_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end
  end
}
