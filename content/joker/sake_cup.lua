SMODS.Joker {
  key = 'sake_cup',
  config = {
    extra = {
      odds = 5,
      rank = 9,
    }
  },
  rarity = 3,
  pos = { x = 6, y = 9 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(PB_UTIL.get_rank_from_id(card.ability.extra.rank).key, 'ranks'),
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  -- Calculate function for the Joker
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and context.other_card:get_id() == card.ability.extra.rank then
      if not context.other_card.debuff and pseudorandom("sake_cup") < G.GAME.probabilities.normal / card.ability.extra.odds then
        local planet = PB_UTIL.get_planet_for_hand(context.scoring_name)

        if planet then
          local spawned = PB_UTIL.try_spawn_card { key = planet, func = function()
            local eff_card = context.blueprint_card or card

            SMODS.calculate_effect({
              message = localize('k_plus_planet'),
              colour = G.C.SECONDARY_SET.Planet,
              juice_card = context.other_card,
              message_card = eff_card
            }, eff_card)
          end }

          return nil, spawned
        end
      end
    end
  end
}
