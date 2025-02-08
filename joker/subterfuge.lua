SMODS.Joker {
  key = 'subterfuge',
  rarity = 3,
  pos = { x = 3, y = 5 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  calculate = function(self, card, context)
    if not context.blueprint and context.after and not (context.individual or context.repetition) then
      local destroyed_cards = {}

      for _, v in ipairs(G.play.cards) do
        destroyed_cards[#destroyed_cards + 1] = v
      end

      -- Destroy all cards in first hand
      if G.GAME.current_round.hands_played == 0 then
        PB_UTIL.destroy_playing_cards(destroyed_cards, card, {
          message = localize('paperback_destroyed_ex'),
          colour = G.C.MULT
        })
      end
    end
  end
}
