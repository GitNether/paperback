SMODS.Joker {
  key = 'popsicle_stick',
  config = {
    extra = {
      xMult = 1
    }
  },
  rarity = 1,
  pos = { x = 9, y = 2 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,
  yes_pool_flag = "sticks_can_spawn",

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
