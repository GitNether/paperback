PB_UTIL.Paperclip {
  key = 'red_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 3, y = 0 },
  badge_colour = G.C.MULT,
  config = {
    mult_mod = 5
  },

  loc_vars = function(self, info_queue, card)
    local clips = PB_UTIL.count_paperclips {
      area = G.hand,
      exclude_highlighted = true
    }

    return {
      vars = {
        card.ability[self.key].mult_mod,
        card.ability[self.key].mult_mod * clips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      local clips = PB_UTIL.count_paperclips { area = G.hand }

      if clips > 0 then
        return {
          mult = card.ability[self.key].mult_mod * clips
        }
      end
    end
  end
}
