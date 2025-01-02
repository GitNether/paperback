SMODS.Joker {
  key = 'pride_flag',
  loc_txt = {
    name = "Pride Flag",
    text = {
      "Gains {C:mult}+#1#{} Mult if scored hand",
      "contains {C:attention}three{} unique suits",
      "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult)"
    }
  },
  config = {
    extra = {
      a_mult = 3,
      mult = 0
    }
  },
  rarity = 1,
  pos = { x = 3, y = 0 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_mult,
        card.ability.extra.mult
      }
    }
  end,

  -- Calculate function for the Joker
  calculate = function(self, card, context)
    -- Check if the card is not debuffed
    if not card.debuff then
      -- Check if the card is being calculated before the scoring hand is scored and not blueprinted
      if context.before and not context.blueprint then
        -- Get the number of unique suits in the scoring hand
        local unique_suits = PB_UTIL.get_unique_suits(context.scoring_hand)

        -- If there are 3 unique suits, upgrade the joker
        if unique_suits >= 3 then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult

          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
          }
        end
      end

      -- Gives the mult during scoring
      if context.joker_main then
        return {
          message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
          mult_mod = card.ability.extra.mult
        }
      end
    end
  end
}
