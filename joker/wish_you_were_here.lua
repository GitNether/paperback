SMODS.Joker {
  key = "wish_you_were_here",
  config = {
    extra = {
      sv_gain = 1,
      mult_mod = 3
    }
  },
  rarity = 2,
  pos = { x = 4, y = 0 },
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
        card.ability.extra.mult_mod,
        card.ability.extra.sv_gain,
        card.ability.extra.mult_mod * card.sell_cost
      }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    card.zero_sell_cost = true
    card:set_cost()
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local mult = card.ability.extra.mult_mod * card.sell_cost

      return {
        mult = mult,
      }
    end

    -- Increase the sell value at end of round
    if context.end_of_round and not context.blueprint and context.main_eval then
      PB_UTIL.modify_sell_value(card, 1)

      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
  end
}
