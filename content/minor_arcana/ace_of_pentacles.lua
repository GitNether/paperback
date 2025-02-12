SMODS.Consumable {
  key = 'ace_of_pentacles',
  set = 'paperback_minor_arcana',
  config = {
    max_highlighted = 3,
    suit_conv = 'paperback_Stars'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 2, y = 0 },
  unlocked = true,
  discovered = true,
  paperback = {
    requires_custom_suits = true
  },

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
  end
}
