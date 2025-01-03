SMODS.Joker {
  key = 'calling_card',
  config = {
    extra = {
      Xmult_mod = 0.25,
      x_mult = 1
    }
  },
  rarity = 2,
  pos = { x = 0, y = 0 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.Xmult_mod,
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    -- Upgrade joker if boss blind defeated
    if context.end_of_round and not (context.individual or context.repetition) and not context.blueprint then
      if G.GAME.blind.boss then
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.Xmult_mod

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end

    if context.joker_main then
      -- Upgrade joker if boss blind triggered
      if G.GAME.blind.triggered and not context.blueprint then
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.Xmult_mod

        card_eval_status_text(card, 'extra', nil, nil, nil,
          { message = localize('k_upgrade_ex'), colour = G.C.MULT })
      end

      -- Give the xMult during scoring
      if card.ability.extra.x_mult > 1 then
        return {
          Xmult_mod = card.ability.extra.x_mult,
          card = card,
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } }
        }
      end
    end
  end,
}
