SMODS.Consumable {
  key = 'two_of_cups',
  set = 'paperback_minor_arcana',
  config = {
    extra = {
      max = 3
    }
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 1, y = 0 },
  unlocked = true,
  discovered = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.max
      }
    }
  end,

  can_use = function(self, card)
    return #G.hand.highlighted == card.ability.extra.max
  end,

  use = function(self, card, area)
    local cards = {}

    for i = 1, card.ability.extra.max do
      cards[i] = G.hand.highlighted[i]
    end

    -- The order of highlighted cards depends on the time they were clicked,
    -- this makes it so it's position based
    table.sort(cards, function(a, b)
      return a.T.x < b.T.x
    end)

    local left = cards[1]
    local middle = cards[math.ceil(#cards / 2)]
    local right = cards[#cards]

    local suit = left.base.suit
    local rank = right.base.value

    PB_UTIL.use_consumable_animation(card, middle, function()
      PB_UTIL.destroy_playing_cards { left, right }
      assert(SMODS.change_base(middle, suit, rank))
    end)
  end
}
