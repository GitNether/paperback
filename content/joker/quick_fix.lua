SMODS.Joker {
  key = 'quick_fix',
  config = {
    extra = {
      h_size = 2,
      odds = 4
    }
  },
  rarity = 1,
  pos = { x = 6, y = 0 },
  atlas = 'jokers_atlas',
  cost = 6,
  blueprint_compat = true,
  eternal_compat = false,
  yes_pool_flag = "quick_fix_can_spawn",
  unlocked = false,

  check_for_unlock = function(self, args)
    if args.type == 'min_hand_size' and G.hand.config.card_limit >= 10 then
      return true
    end
  end,

  set_ability = function(self, card, initial, delay_sprites)
    card.ability.h_size = card.ability.extra.h_size or 0
    card.ability.extra.odds = card.ability.extra.odds or 1
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.h_size,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and not context.blueprint and context.main_eval then
      if pseudorandom("Quick Fix") < G.GAME.probabilities.normal / card.ability.extra.odds then
        -- Destroy Quick Fix
        PB_UTIL.destroy_joker(card, function()
          -- Remove Quick Fix from the Joker pool
          G.GAME.pool_flags.quick_fix_can_spawn = false

          -- Create Half Joker if possible
          SMODS.add_card {
            key = 'j_half',
            edition = card.edition
          }
        end)

        return {
          message = localize('paperback_broken_ex'),
          colour = G.C.MULT,
          card = card
        }
      else
        return {
          message = localize('k_safe_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      end
    end
  end
}
