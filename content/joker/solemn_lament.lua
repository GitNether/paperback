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
  paperback = {
    ignores_the_world = true
  },

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if context.other_card == context.scoring_hand[1] then
        return {
          message = localize('k_again_ex'),
          repetitions = PB_UTIL.get_lowest_hand_discard().amt,
          card = card
        }
      end
    end
  end
}
