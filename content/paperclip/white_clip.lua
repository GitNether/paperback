PB_UTIL.Paperclip {
  key = 'white_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 0, y = 0 },
  badge_colour = G.C.WHITE,
  badge_text_colour = G.C.PAPERBACK_BLACK,
  config = {
    chip_mod = 1,
    chips = 0
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].chip_mod,
        card.ability[self.key].chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.playing_card_end_of_round and context.cardarea == G.hand then
      local increase = card.ability[self.key].chip_mod * (G.GAME.current_round.paperback_scored_clips or 0)

      if increase > 0 then
        card.ability[self.key].chips = card.ability[self.key].chips + increase

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS
        }
      end
    end

    if context.main_scoring and context.cardarea == G.play then
      local chips = card.ability[self.key].chips

      if chips ~= 0 then
        return {
          chips = chips
        }
      end
    end
  end
}
