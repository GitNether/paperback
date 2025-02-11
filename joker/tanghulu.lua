SMODS.Joker {
  key = 'tanghulu',
  config = {
    extra = {
      mult = 10,
      odds = 4
    }
  },
  rarity = 1,
  pos = { x = 9, y = 8 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  yes_pool_flag = "tanghulu_can_spawn",
  pools = {
    Food = true
  },

  in_pool = function(self, card)
    return PB_UTIL.config.suits_enabled
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    -- Give the mult during play if card is a Crown
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("paperback_Crowns") then
        return {
          mult = card.ability.extra.mult,
          card = card
        }
      end
    end

    -- Check if the Joker needs to be eaten
    if context.end_of_round and not context.blueprint and context.main_eval then
      if pseudorandom("tanghulu") < G.GAME.probabilities.normal / card.ability.extra.odds then
        PB_UTIL.destroy_joker(card, function()
          -- Remove Tanghulu from the pool
          G.GAME.pool_flags.tanghulu_can_spawn = false

          -- Create Sweet Stick
          SMODS.add_card {
            key = 'j_paperback_sweet_stick',
            edition = card.edition
          }
        end)

        return {
          message = localize('k_eaten_ex'),
          colour = G.C.MULT
        }
      else
        return {
          message = localize('k_safe_ex'),
          colour = G.C.CHIPS
        }
      end
    end
  end
}
