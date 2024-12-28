SMODS.Joker {
  key = "blue_bonnets",
  loc_txt = {
    name = "Blue Bonnets",
    text = {
      "{C:clubs}Clubs{} give {X:mult,C:white}X#1#{} Mult when scored.",
      "Increases by {X:mult,C:white}X#2#{} Mult for each ",
      "consecutively scored {C:clubs}Clubs{}",
      "{C:inactive}(Resets after each hand played)"
    }
  },
  config = {
    extra = {
      xMult = 1.05,
      xMult_gain = 0.05,
      xMult_base = 1.05
    }
  },
  rarity = 1,
  pos = { x = 1, y = 4 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xMult_base,
        card.ability.extra.xMult_gain
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      -- Reset the xMult if the current card is not a club
      if not context.other_card:is_suit("Clubs") then
        card.ability.extra.xMult = 1.05
        return
      end

      -- Give the xMult if the current card is a club
      if context.other_card:is_suit("Clubs") then
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
      card.ability.extra.xMult = 1.05
    end
  end
}
