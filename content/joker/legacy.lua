SMODS.Joker {
  key = "legacy",
  config = {
    extra = {
      mult = 0,
      chip_mult = 2
    }
  },
  rarity = 3,
  pos = { x = 5, y = 7 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = { x = 6, y = 7 },
  yes_pool_flag = 'paperback_legacy_can_spawn',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chip_mult,
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.remove_playing_cards and #context.removed > 0 then
      local mult_gained = 0

      for _, v in ipairs(context.removed) do
        if v.ability.set ~= "Enhanced" then
          mult_gained = mult_gained + v:get_chip_bonus() * card.ability.extra.chip_mult
        end
      end

      if mult_gained > 0 then
        card.ability.extra.mult = card.ability.extra.mult + mult_gained

        return {
          message = localize {
            type = 'variable',
            key = 'a_mult',
            vars = { mult_gained }
          },
          colour = G.C.MULT
        }
      end
    end

    if context.joker_main and card.ability.extra.mult > 0 then
      return {
        mult = card.ability.extra.mult
      }
    end
  end
}
