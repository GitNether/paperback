PB_UTIL.MinorArcana {
  key = 'knight_of_cups',
  config = {
    min_highlighted = 2,
    max_highlighted = 2
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 4, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.min_highlighted
      }
    }
  end,

  use = function(self, card, area)
    local left = G.hand.highlighted[1]
    local right = G.hand.highlighted[2]

    -- Make it position based
    if right.T.x < left.T.x then
      local swap = left
      left = right
      right = swap
    end

    PB_UTIL.use_consumable_animation(card, left, function()
      local rank = left.base.value
      local suit = left.base.suit

      copy_card(right, left)
      assert(SMODS.change_base(left, suit, rank))

      PB_UTIL.destroy_playing_cards { right }
    end)
  end
}
