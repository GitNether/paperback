SMODS.Joker {
  key = "ice_cube",
  config = {
    extra = {
      x_mult_mod = 1,
      rounds_left = 4,
    }
  },
  rarity = 1,
  pos = { x = 3, y = 8 },
  atlas = 'jokers_atlas',
  cost = 4,
  blueprint_compat = true,
  eternal_compat = false,
  pools = {
    Food = true
  },
  unlocked = false,

  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and #PB_UTIL.get_owned_food() >= 5 then
      return true
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = { 5 }
    }
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult_mod,
        card.ability.extra.rounds_left,
        #PB_UTIL.get_owned_food() * card.ability.extra.x_mult_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local x_mult = #PB_UTIL.get_owned_food() * card.ability.extra.x_mult_mod

      if x_mult > 1 then
        return {
          x_mult = x_mult
        }
      end
    end

    -- At end of round decrease the amount of rounds left, destroying
    -- itself if it ever goes below 1
    if not context.blueprint and context.end_of_round and context.main_eval then
      card.ability.extra.rounds_left = card.ability.extra.rounds_left - 1

      if card.ability.extra.rounds_left < 1 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_melted_ex')
        }
      end

      return {
        message = localize {
          type = 'variable',
          key = 'paperback_a_round_minus',
          vars = { 1 }
        }
      }
    end
  end
}
