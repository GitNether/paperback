SMODS.Joker {
  key = 'surfer',
  config = {
    extra = {
      chips = 0,
      a_chips = 5,
      rank = 10,
    }
  },
  rarity = 2,
  pos = { x = 5, y = 10 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_chips,
        card.ability.extra.rank,
        card.ability.extra.chips,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.individual and context.cardarea == G.hand and not context.blueprint then
      if context.other_card:get_id() == card.ability.extra.rank then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.a_chips

        return {
          message = localize {
            type = 'variable',
            key = 'a_chips',
            vars = { card.ability.extra.a_chips }
          },
          colour = G.C.CHIPS,
          juice_card = context.other_card,
          message_card = card,
        }
      end
    end

    -- Give chips during scoring
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end
}
