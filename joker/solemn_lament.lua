SMODS.Joker {
  key = "solemn_lament",
  rarity = 2,
  pos = { x = 3, y = 1 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if context.other_card == context.scoring_hand[1] then
        return {
          message = localize('k_again_ex'),
          repetitions = sl_get_repetitions(),
          card = card
        }
      end
    end
  end
}

-- Returns the number of repetitions for the joker
function sl_get_repetitions()
  return (G.GAME.current_round.hands_left < G.GAME.current_round.discards_left)
      and G.GAME.current_round.hands_left
      or G.GAME.current_round.discards_left
end
