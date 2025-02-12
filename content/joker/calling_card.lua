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
  perishable_compat = false,
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
    if context.end_of_round and context.main_eval and not context.blueprint then
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

        SMODS.calculate_effect({
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT
        }, card)
      end

      -- Give the xMult during scoring
      if card.ability.extra.x_mult > 1 then
        return {
          x_mult = card.ability.extra.x_mult,
          card = card
        }
      end
    end
  end,
}
