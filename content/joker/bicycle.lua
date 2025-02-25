SMODS.Joker {
  key = "bicycle",
  config = {
    extra = {
      x_mult = 1.5
    }
  },
  rarity = 2,
  pos = { x = 2, y = 2 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  enhancement_gate = "m_wild",
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild

    return {
      vars = {
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual then
      if context.cardarea == G.play then
        if context.other_card.ability.name == 'Wild Card' then
          return {
            mult = context.other_card:get_chip_bonus(),
            x_mult = card.ability.extra.x_mult,
            card = card
          }
        end
      end
    end
  end
}
