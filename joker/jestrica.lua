SMODS.Joker {
  key = 'jestrica',
  config = {
    extra = {
      mult = 0,
      increase = 1,
      scored = false
    }
  },
  rarity = 1,
  pos = { x = 7, y = 5 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.increase,
        card.ability.extra.mult,
      }
    }
  end,

  calculate = function(self, card, context)
    -- Give mult when scored and copied
    if context.joker_main and context.cardarea == G.jokers then
      return {
        mult = card.ability.extra.mult,
      }
    end

    -- Upgrade this Joker for every scored 8
    if not context.blueprint and context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == 8 then
        card.ability.extra.scored = true
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.increase

        return {
          extra = {
            focus = card,
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
          },
          card = card
        }
      end
    end

    -- Check if this Joker's mult should reset depending on if an 8 was scored this round
    if not context.blueprint and context.end_of_round and not (context.individual or context.repetition) then
      if not card.ability.extra.scored and card.ability.extra.mult > 0 then
        card.ability.extra.mult = 0

        return {
          message = localize('k_reset'),
          colour = G.C.MULT
        }
      end

      -- Reset the scored flag after round ends
      card.ability.extra.scored = false
    end
  end
}
