SMODS.Enhancement {
  key = "porcelain",
  atlas = 'enhancements_atlas',
  pos = { x = 1, y = 0 },
  config = {
    extra = {
      a_money_low = 1,
      a_money_high = 5,
      odds = 4,
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_money_low,
        card.ability.extra.a_money_high,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      local dollars = pseudorandom("Porcelain Money Amount", card.ability.extra.a_money_low, card.ability.extra.a_money_high)

      return {
        dollars = dollars
      }
    end

    if context.after and context.cardarea == G.play then
      if pseudorandom("Porcelain Destroy Chance") < G.GAME.probabilities.normal / card.ability.extra.odds then
        local destroyed_cards = { card }
        PB_UTIL.destroy_playing_cards(destroyed_cards, card, {
          message = localize('paperback_destroyed_ex'),
          colour = G.C.MULT,
          card = card
        })
      end
    end
  end
}