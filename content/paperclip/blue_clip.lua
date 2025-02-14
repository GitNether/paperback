PB_UTIL.Paperclip {
  key = 'blue_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 2, y = 1 },
  badge_colour = G.C.CHIPS,
  config = {
    x_chips_base = 1,
    x_chips_mod = 0.1
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].x_chips_base,
        card.ability[self.key].x_chips_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      local clips = 0

      for k, v in ipairs(G.hand.cards) do
        if not v.debuff and PB_UTIL.has_paperclip(v) then
          clips = clips + 1
        end
      end

      if clips > 0 then
        return {
          x_chips = card.ability[self.key].x_chips_base + clips * card.ability[self.key].x_chips_mod
        }
      end
    end
  end
}
