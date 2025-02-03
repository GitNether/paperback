SMODS.Joker {
  key = "solar_system",
  config = {
    extra = {
      x_mult_mod = 2,
      x_mult = 1
    }
  },
  rarity = 3,
  pos = { x = 7, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  set_ability = function(self, card, initial, delay_sprites)
    PB_UTIL.update_solar_system(card)
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult_mod,
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    -- If a hand is being leveled up, recalculate the xMult bonus
    if context.paperback and context.paperback.level_up_hand then
      PB_UTIL.update_solar_system(card)
    end

    -- Gives the xMult during play
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
        card = card
      }
    end
  end
}
