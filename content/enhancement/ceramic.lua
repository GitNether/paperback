SMODS.Enhancement {
  key = "ceramic",
  atlas = 'enhancements_atlas',
  pos = { x = 1, y = 0 },
  shatters = true,
  config = {
    extra = {
      a_money_low = 1,
      a_money_high = 5,
      odds = 3,
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_money_low,
        card.ability.extra.a_money_high + (G.GAME.round_resets.paperback_ceramic_inc or 0),
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      local dollars = pseudorandom("Ceramic Money Amount", card.ability.extra.a_money_low,
        card.ability.extra.a_money_high + (G.GAME.round_resets.paperback_ceramic_inc or 0))

      return {
        dollars = dollars
      }
    end

    if context.destroy_card and context.cardarea == G.play then
      if pseudorandom("Ceramic Destroy Chance") < G.GAME.probabilities.normal / card.ability.extra.odds then
        return {
          remove = true
        }
      end
    end
  end
}
