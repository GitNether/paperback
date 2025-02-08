SMODS.Joker {
  key = 'champagne',
  config = {
    extra = {
      money = 1,
      rounds_left = 3
    }
  },
  rarity = 1,
  pos = { x = 2, y = 8 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money,
        card.ability.extra.rounds_left
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and G.GAME.blind.boss then
      return {
        dollars = card.ability.extra.money * (context.other_card.seal and 2 or 1),
        card = card
      }
    end

    if not context.blueprint and context.end_of_round and not (context.individual or context.repetition) then
      card.ability.extra.rounds_left = card.ability.extra.rounds_left - 1

      if card.ability.extra.rounds_left <= 0 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_destroyed_ex')
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
