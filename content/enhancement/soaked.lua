SMODS.Enhancement {
  key = 'soaked',
  atlas = 'enhancements_atlas',
  pos = { x = 0, y = 0 },
  config = {
    extra = {
      odds = 2
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      for k, held_card in ipairs(G.hand.cards) do
        SMODS.calculate_effect({
          chips = held_card:get_chip_bonus(),
          colour = G.C.CHIPS,
          card = card
        }, held_card)
      end
    end

    if context.discard then
      if context.other_card == card then
        if pseudorandom("Soaked Destroy Chance") < G.GAME.probabilities.normal / card.ability.extra.odds then
          return {
            remove = true,
          }
        end
      end
    end
  end,
}
