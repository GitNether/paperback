SMODS.Enhancement {
  key = "bandaged",
  atlas = 'enhancements_atlas',
  pos = { x = 3, y = 0 },
  config = {
    extra = {
      a_money_low = 1,
      a_money_high = 5,
      odds = 3,
    }
  },

  loc_vars = function(self, info_queue, card)

  end,

  calculate = function(self, card, context)
    local ctx = context.paperback or {}

    if ctx.repetition_from_playing_card then
      local index

      for k, v in ipairs(ctx.cardarea.cards) do
        if v == card then
          index = k
          break
        end
      end

      if index then
        local left = ctx.cardarea.cards[index - 1]
        local right = ctx.cardarea.cards[index + 1]

        if (left == ctx.other_card or right == ctx.other_card) then
          return {
            repetitions = 1
          }
        end
      end
    end
  end
}
