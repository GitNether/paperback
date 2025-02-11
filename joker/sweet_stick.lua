SMODS.Joker {
  key = 'sweet_stick',
  config = {
    extra = {
      xMult = 1.5
    }
  },
  rarity = 1,
  pos = { x = 0, y = 9 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  yes_pool_flag = "sticks_can_spawn",

  in_pool = function(self, card)
    return PB_UTIL.config.suits_enabled
  end,

  loc_vars = function(self, info_queue, card)
    local xMult = PB_UTIL.calculate_stick_xMult(card)

    return {
      vars = {
        card.ability.extra.xMult,
        xMult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local xMult = PB_UTIL.calculate_stick_xMult(card)

      if xMult ~= 1 then
        return {
          x_mult = xMult,
          card = card
        }
      end
    end
  end
}
