SMODS.Joker {
  key = 'prince_of_darkness',
  config = {
    extra = {
      unique_suits = 2,
      x_mult = 2,
      hands = 2,
      hands_remaining = 0
    }
  },
  rarity = 2,
  pos = { x = 6, y = 2 },
  atlas = 'jokers_atlas',
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.unique_suits,
        card.ability.extra.x_mult,
        card.ability.extra.hands,
        card.ability.extra.hands_remaining
      }
    }
  end,

  calculate = function(self, card, context)
    -- Check if the card is not debuffed
    if not card.debuff then
      -- Check if the card is being calculated before the scoring hand is scored and not blueprinted
      if context.before and not context.blueprint then
        local unique_suits = PB_UTIL.get_unique_suits(context.scoring_hand)

        local heart_found = false
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i]:is_suit("Hearts") then
            heart_found = true
            break
          end
        end

        -- Check if the scoring hand contains a Heart and two additional unique suits (three unique suits with Heart included)
        if heart_found and unique_suits >= 3 then
          card.ability.extra.hands_remaining = card.ability.extra.hands

          return {
            message = localize("k_active_ex"),
            colour = G.C.GREEN,
            card = card,
          }
        end
      end

      -- Give the mult and chips during play
      if context.joker_main then
        if card.ability.extra.hands_remaining > 0 then
          return {
            x_mult = card.ability.extra.x_mult
          }
        end
      end

      -- Reduce the hands remaining after the hand is scored
      if context.after and not context.blueprint then
        if card.ability.extra.hands_remaining > 0 then
          card.ability.extra.hands_remaining = card.ability.extra.hands_remaining - 1

          if card.ability.extra.hands_remaining == 0 then
            return {
              message = localize("paperback_inactive"),
              colour = G.C.RED,
              card = card
            }
          else
            return {
              message = localize { type = 'variable', key = 'paperback_a_hands_minus', vars = { 1 } },
              colour = G.C.RED,
              card = card
            }
          end
        end
      end
    end
  end
}
