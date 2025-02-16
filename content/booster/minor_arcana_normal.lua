SMODS.Booster {
  key = 'minor_arcana_normal',
  group_key = 'paperback_minor_arcana_pack',
  atlas = 'boosters_atlas',
  pos = { x = 0, y = 0 },
  config = {
    extra = 4,
    choose = 1
  },
  weight = 1,
  cost = 5,
  draw_hand = true,
  discovered = true,

  create_card = function(self, card, i)
    return {
      set = 'paperback_minor_arcana',
      area = G.pack_cards,
      skip_materialize = true
    }
  end,

  ease_background_colour = function(self)
    ease_colour(G.C.DYN_UI.MAIN, G.C.PAPERBACK_MINOR_ARCANA)
    ease_background_colour { new_colour = G.C.PAPERBACK_MINOR_ARCANA, special_colour = G.C.BLACK, contrast = 2 }
  end,
}
