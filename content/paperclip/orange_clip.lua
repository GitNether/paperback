PB_UTIL.Paperclip {
  key = 'orange_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 4, y = 0 },
  badge_colour = G.C.ORANGE,
  config = {
    money = 1,
    every = 2
  },

  loc_vars = function(self, info_queue, card)
    local clips = PB_UTIL.count_paperclips {
      area = G.hand,
      exclude_highlighted = true
    }

    return {
      vars = {
        card.ability[self.key].money,
        card.ability[self.key].every,
        card.ability[self.key].money * math.floor(clips / card.ability[self.key].every)
      }
    }
  end,

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      local clips = PB_UTIL.count_paperclips { area = G.hand }

      if clips >= card.ability[self.key].every then
        return {
          dollars = card.ability[self.key].money * math.floor(clips / card.ability[self.key].every)
        }
      end
    end
  end
}
