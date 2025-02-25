SMODS.Joker {
  key = 'unholy_alliance',
  config = {
    extra = {
      xMult = 1,
      xMult_gain = 0.2
    }
  },
  rarity = 2,
  pos = { x = 6, y = 4 },
  atlas = 'jokers_atlas',
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xMult_gain,
        card.ability.extra.xMult,
      }
    }
  end,

  calculate = function(self, card, context)
    -- Gains mult when jokers are destroyed
    if not context.blueprint and context.paperback and context.paperback.destroying_joker then
      -- Make sure that this joker isn't being removed
      if card ~= context.paperback.destroyed_joker then
        card.ability.extra.xMult = card.ability.extra.xMult + card.ability.extra.xMult_gain

        return {
          message = localize {
            type = 'variable',
            key = 'a_xmult',
            vars = { card.ability.extra.xMult_gain }
          },
          colour = G.C.MULT
        }
      end
    end

    -- Gains mult when playing cards are destroyed. Each card destroyed provides the specified mult_mod
    if not context.blueprint and context.remove_playing_cards and context.removed and #context.removed > 0 then
      card.ability.extra.xMult = card.ability.extra.xMult + (#context.removed * card.ability.extra.xMult_gain)

      card_eval_status_text(card, 'extra', nil, nil, nil,
        { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xMult } } })
    end

    -- Gives the mult when scoring
    if context.joker_main and card.ability.extra.xMult > 1 then
      return {
        x_mult = card.ability.extra.xMult
      }
    end
  end
}
