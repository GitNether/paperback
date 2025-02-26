SMODS.Joker {
  key = 'full_moon',
  config = {
    extra = {
      odds = 3
    }
  },
  rarity = 1,
  pos = { x = 5, y = 9 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.c_moon

    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == 'Planet' then
      if pseudorandom("full_moon") < G.GAME.probabilities.normal / card.ability.extra.odds then
        return nil, PB_UTIL.try_spawn_card {
          key = 'c_moon',
          func = function()
            SMODS.calculate_effect({
              message = localize('k_plus_tarot'),
              colour = G.C.SECONDARY_SET.Planet
            }, context.blueprint_card or card)
          end
        }
      end
    end
  end
}
