SMODS.Suit {
  key = 'Stars',
  card_key = 'STARS',

  lc_atlas = 'suits_lc',
  lc_ui_atlas = 'suits_ui_lc',
  lc_colour = G.C.PAPERBACK_STARS_LC,

  hc_atlas = 'suits_hc',
  hc_ui_atlas = 'suits_ui_hc',
  hc_colour = G.C.PAPERBACK_STARS_HC,

  pos = { y = 0 },
  ui_pos = { x = 0, y = 1 },

  in_pool = function(self, args)
    if args and args.initial_deck then
      -- When creating a deck
      local back = G.GAME.selected_back
      local config = back and back.effect.center.paperback

      return config and config.create_stars
    else
      -- If not creating a deck
      return PB_UTIL.has_suit_in_deck('paperback_Stars', true) or PB_UTIL.spectrum_played()
    end
  end
}
