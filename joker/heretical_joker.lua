SMODS.Joker {
  key = "heretical_joker",
  effect = "Suit Mult",
  config = {
    extra = {
      s_mult = 5,
      suit = 'paperback_Stars'
    }
  },
  rarity = 1,
  pos = { x = 5, y = 8 },
  atlas = "jokers_atlas",
  cost = 5,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_stars = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.s_mult,
      }
    }
  end
}
