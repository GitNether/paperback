SMODS.Consumable {
  key = 'ace_of_swords',
  set = 'paperback_minor_arcana',
  config = {
    max_highlighted = 3,
    suit_conv = 'paperback_Crowns'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 0, y = 4 },
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
