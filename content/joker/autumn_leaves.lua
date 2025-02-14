SMODS.Joker {
  key = "autumn_leaves",
  config = {
    extra = {
      suit = "Diamonds",
      xMult = 1.05,
      xMult_gain = 0.05,
      xMult_base = 1.05
    }
  },
  rarity = 1,
  pos = { x = 0, y = 4 },
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
        localize(card.ability.extra.suit, "suits_plural"),
        card.ability.extra.xMult_base,
        card.ability.extra.xMult_gain,
        localize(card.ability.extra.suit, "suits_singular")
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      -- Reset the xMult if the current card is not the required suit
      if not context.other_card:is_suit(card.ability.extra.suit) then
        card.ability.extra.xMult = card.ability.extra.xMult_base
        return
      end

      -- Give the xMult if the current card is the required suit
      if context.other_card:is_suit(card.ability.extra.suit) then
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
  end,

  -- joker_display_def = function(JokerDisplay)
  --   return {
  --     text = {
  --       {
  --         border_nodes = {
  --           { text = "X" },
  --           { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
  --         }
  --       }
  --     },

  --     calc_function = function(card)
  --       local playing_hand = next(G.play.cards)
  --       local count = 0
  --       for _, playing_card in ipairs(G.hand.cards) do
  --         if playing_hand or playing_card.highlighted then
  --           if playing_card:is_suit(card.ability.extra.suit) and not playing_card.debuff then
  --             count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, false)
  --           end
  --         end
  --       end
  --       card.joker_display_values.x_mult = card.ability.extra.
  --     end
  --   }
  -- end
}
