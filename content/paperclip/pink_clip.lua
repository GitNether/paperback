PB_UTIL.Paperclip {
  key = 'pink_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 3, y = 1 },
  badge_colour = G.C.PAPERBACK_PINK,
  config = {
    x_mult = 1,
    x_mult_mod = 0.1
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].x_mult,
        card.ability[self.key].x_mult_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.paperback and context.paperback.clip_scored then
      card.ability[self.key].x_mult = card.ability[self.key].x_mult + card.ability[self.key].x_mult_mod
    end

    if context.main_scoring and context.cardarea == G.hand then
      local x_mult = card.ability[self.key].x_mult

      if x_mult ~= 1 then
        return {
          x_mult = x_mult
        }
      end
    end

    if context.after then
      card.ability[self.key].x_mult = 1
    end
  end
}
