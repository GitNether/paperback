SMODS.Consumable {
  key = 'ace_of_swords',
  set = 'paperback_minor_arcana',
  config = {
    max_highlighted = 3,
    suit_conv = 'paperback_Crowns'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 1, y = 0 },
  unlocked = true,
  discovered = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted,
        localize(card.ability.suit_conv, 'suits_plural'),
        colours = {
          G.C.SUITS[card.ability.suit_conv]
        }
      }
    }
  end,

  paperback = {
    requires_custom_suits = true
  },

  in_pool = function(self)
    return PB_UTIL.config.suits_enabled
  end
}
