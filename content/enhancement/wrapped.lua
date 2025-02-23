SMODS.Enhancement {
  key = 'wrapped',
  atlas = 'enhancements_atlas',
  pos = { x = 2, y = 0 },
  no_rank = true,
  no_suit = true,
  always_scores = true,
  replace_base_card = true,
  config = {
    extra = {
      money = 3
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      return {
        dollars = card.ability.extra.money
      }
    end
  end
}
