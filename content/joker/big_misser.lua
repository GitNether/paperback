SMODS.Joker {
  key = "big_misser",
  config = {
    extra = {
      Xmult_mod = 1,
      Xmult = 0
    }
  },
  rarity = 2,
  pos = { x = 9, y = 5 },
  atlas = 'jokers_atlas',
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.Xmult_mod,
        card.ability.extra.Xmult
      }
    }
  end,

  update = function(self, card, dt)
    if G.consumeables then
      local empty_consumables = G.consumeables.config.card_limit - #G.consumeables.cards
      card.ability.extra.Xmult = math.max(0, empty_consumables * card.ability.extra.Xmult_mod)
    end
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      -- Show a message if mult is 0
      if card.ability.extra.Xmult == 0 then
        return {
          x_mult_mod = 0,
          message = localize {
            type = 'variable',
            key = 'a_xmult',
            vars = { 0 }
          },
          sound = 'multhit1',
          colour = G.C.MULT
        }
      end

      return {
        x_mult = card.ability.extra.Xmult,
      }
    end
  end
}
