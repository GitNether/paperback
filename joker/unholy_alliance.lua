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
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xMult_gain,
        card.ability.extra.xMult,
      }
    }
  end,

  calculate = function(self, card, context)
    -- Gains mult when playing cards are destroyed. Each card destroyed provides the specified mult_mod
    if not context.blueprint and context.remove_playing_cards and context.removed and #context.removed > 0 then
      card.ability.extra.xMult = card.ability.extra.xMult + (#context.removed * card.ability.extra.xMult_gain)

      card_eval_status_text(card, 'extra', nil, nil, nil,
        { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xMult } } })
    end

    -- Gives the mult when scoring
    if context.joker_main then
      if card.ability.extra.xMult > 1 then
        return {
          Xmult_mod = card.ability.extra.xMult,
          card = card,
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xMult } }
        }
      end
    end
  end
}
