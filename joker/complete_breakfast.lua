SMODS.Joker {
  key = 'complete_breakfast',
  config = {
    extra = {
      mult = 20,
      chips = 100,
      odds = 10,
      -- For compatibility with Oops! All 6s
      chance_multiplier = 1
    }
  },
  rarity = 1,
  pos = { x = 6, y = 5 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
        -- For compatibility with Oops! All 6s
        card.ability.extra.chance_multiplier * G.GAME.probabilities.normal,
        card.ability.extra.odds,
        G.GAME.probabilities.normal
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea ~= G.jokers then return end

    -- Give mult and chips when evaluating joker
    if context.joker_main then
      SMODS.eval_this(context.blueprint_card or card, {
        chip_mod = card.ability.extra.chips,
        message = localize {
          type = 'variable',
          key = 'a_chips',
          vars = { card.ability.extra.chips },
        }
      })

      return {
        mult_mod = card.ability.extra.mult,
        message = localize {
          type = 'variable',
          key = 'a_mult',
          vars = { card.ability.extra.mult },
        },
        card = card
      }
    end

    -- Check if Joker needs to be eaten, and if not, increase the chance it will be eaten next time
    if context.after and not context.blueprint then
      local chance = card.ability.extra.chance_multiplier * G.GAME.probabilities.normal

      if pseudorandom("Complete Breakfast") < chance / card.ability.extra.odds then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('k_eaten_ex'),
          colour = G.C.MULT,
          card = card
        }
      else
        card.ability.extra.chance_multiplier = card.ability.extra.chance_multiplier + 1

        SMODS.eval_this(card, {
          message = localize('k_safe_ex'),
          colour = G.C.CHIPS,
        })

        return {
          message = localize('k_val_up'),
          colour = G.C.MULT,
          card = card
        }
      end
    end
  end
}
