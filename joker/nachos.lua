SMODS.Joker {
  key = 'nachos',
  config = {
    extra = {
      X_chips = 2,
      reduction_amount = 0.05,
    }
  },
  rarity = 1,
  pos = { x = 9, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  set_ability = function(self, card, initial, delay_sprites)
    card.ability.extra.X_chips = card.ability.extra.X_chips or 1
    card.ability.extra.reduction_amount = 0.05
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.X_chips,
        card.ability.extra.reduction_amount
      }
    }
  end,

  calculate = function(self, card, context)
    -- Gives the xChips during play
    if context.joker_main then
      return {
        x_chips = card.ability.extra.X_chips
      }
    end

    -- Penalize discarding cards only when the current mult is higher than 1
    if context.discard and not context.blueprint and card.ability.extra.X_chips > 1 then
      -- Reduce the xChips value
      card.ability.extra.X_chips = card.ability.extra.X_chips - card.ability.extra.reduction_amount

      -- Destroy Nachos if the current value is <= 1
      if card.ability.extra.X_chips <= 1 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER,
          card = card
        }
      else
        return {
          delay = 0.2,
          message = localize {
            type = 'variable',
            key = 'a_xchips_minus',
            vars = { card.ability.extra.reduction_amount }
          },
          colour = G.C.CHIPS,
          card = card
        }
      end
    end
  end
}
