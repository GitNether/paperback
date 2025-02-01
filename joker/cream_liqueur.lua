SMODS.Joker {
  key = "cream_liqueur",
  config = {
    extra = {
      odds = 5,
      money = 5
    }
  },
  rarity = 1,
  pos = { x = 5, y = 6 },
  atlas = "jokers_atlas",
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.paperback and context.paperback.using_tag then
      return {
        dollars = card.ability.extra.money
      }
    end

    if not context.blueprint and context.end_of_round and not (context.individual or context.repetition) then
      if pseudorandom("cream_liqueur") < G.GAME.probabilities.normal / card.ability.extra.odds then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_consumed_ex'),
          -- Brown color taken from the sprite
          colour = HEX("C4A07D")
        }
      else
        return {
          message = localize('k_safe_ex'),
        }
      end
    end
  end
}
