SMODS.Joker {
  key = 'the_quiet',
  config = {
    extra = {
      a_xMult = 0.1,
    },
  },
  rarity = 3,
  pos = { x = 1, y = 8 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xMult,
        G.GAME.starting_deck_size,
        1 + math.max(0,
          card.ability.extra.a_xMult * (G.playing_cards and (G.GAME.starting_deck_size - #G.playing_cards) or 0))
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        x_mult = 1 + math.max(0,
          card.ability.extra.a_xMult * (G.playing_cards and (G.GAME.starting_deck_size - #G.playing_cards) or 0))
      }
    end
  end
}
