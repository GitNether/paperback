SMODS.Joker {
  key = "b_soda",
  config = {
    extra = {
      hands = 1
    }
  },
  rarity = 1,
  pos = { x = 2, y = 7 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = false,
  pools = {
    Food = true
  },
  paperback = {
    ignores_the_world = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.hands
      }
    }
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      ease_hands_played(card.ability.extra.hands)

      return {
        message = localize {
          type = 'variable',
          key = 'a_hands',
          vars = { card.ability.extra.hands }
        },
        colour = G.C.CHIPS
      }
    end

    if context.end_of_round and context.main_eval and G.GAME.current_round.hands_left == 0 then
      PB_UTIL.destroy_joker(card)

      return {
        message = localize('paperback_consumed_ex')
      }
    end
  end
}
