SMODS.Joker {
  key = "wheat_field",
  config = {
    extra = {
      xMult = 1.075,
      xMult_gain = 0.075,
      xMult_base = 1.075
    }
  },
  rarity = 1,
  pos = { x = 3, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_crowns = true,
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        tostring(card.ability.extra.xMult_base),
        tostring(card.ability.extra.xMult_gain)
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      -- Reset the xMult if the current card is not a Crown
      if not context.other_card:is_suit("paperback_Crowns") then
        card.ability.extra.xMult = card.ability.extra.xMult_base
        return
      end

      -- Give the xMult if the current card is a Crown
      if context.other_card:is_suit("paperback_Crowns") then
        -- Upgrade the xMult
        local xMult = card.ability.extra.xMult
        card.ability.extra.xMult = card.ability.extra.xMult + card.ability.extra.xMult_gain

        return {
          x_mult = xMult,
          card = card
        }
      end
    end

    -- Quietly reset the xMult for the card at the end of played hand
    if context.after and not context.blueprint then
      card.ability.extra.xMult = card.ability.extra.xMult_base
    end
  end
}
