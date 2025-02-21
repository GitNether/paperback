PB_UTIL.Paperclip {
  key = 'red_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 3, y = 0 },
  badge_colour = G.C.MULT,
  config = {
    mult_mod = 5
  },

  loc_vars = function(self, info_queue, card)
    local mult = 0

    for _, v in ipairs(G.hand and G.hand.cards or {}) do
      if not v.debuff and PB_UTIL.has_paperclip(v) and not v.highlighted then
        mult = mult + card.ability[self.key].mult_mod
      end
    end

    return {
      vars = {
        card.ability[self.key].mult_mod,
        mult
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
          mult = card.ability[self.key].mult_mod * clips
        }
      end
    end
  end
}
