SMODS.Joker {
  key = 'the_world',
  rarity = 3,
  pos = { x = 0, y = 6 },
  atlas = 'jokers_atlas',
  cost = 9,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,
  soul_pos = nil,
}

local calculate_joker_ref = Card.calculate_joker
function Card.calculate_joker(self, context)
  local joker = next(SMODS.find_card('j_paperback_the_world'))
  local ignores = (self.config.center.paperback or {}).ignores_the_world

  local previous = {
    hands_played = G.GAME.current_round.hands_played,
    hands_left = G.GAME.current_round.hands_left,
    discards_used = G.GAME.current_round.discards_used,
  }

  if joker and not ignores then
    for k, _ in pairs(previous) do
      G.GAME.current_round[k] = 0
    end
  end

  local ret = calculate_joker_ref(self, context)

  if joker and not ignores then
    for k, v in pairs(previous) do
      G.GAME.current_round[k] = v
    end
  end

  return ret
end
