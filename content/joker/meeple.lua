SMODS.Joker {
  key = 'meeple',
  config = {
    extra = {
      odds = 10,
      discards_given = 1,
    }
  },
  rarity = 1,
  pos = { x = 8, y = 5 },
  atlas = 'jokers_atlas',
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
        card.ability.extra.discards_given,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_face() then
        if pseudorandom("Meeple") < G.GAME.probabilities.normal / card.ability.extra.odds then
          ease_discard(card.ability.extra.discards_given)

          return {
            message = localize {
              type = 'variable',
              key = 'paperback_a_discards',
              vars = { card.ability.extra.discards_given }
            },
            colour = G.C.MULT,
            card = card
          }
        end
      end
    end
  end,
}
