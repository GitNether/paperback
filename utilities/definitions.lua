-- Load mod config
PB_UTIL.config = SMODS.current_mod.config

PB_UTIL.base_poker_hands = {
  "Straight Flush",
  "Four of a Kind",
  "Full House",
  "Flush",
  "Straight",
  "Three of a Kind",
  "Two Pair",
  "Pair",
  "High Card"
}

PB_UTIL.base_ranks = {
  "Ace",
  "King",
  "Queen",
  "Jack",
  "10",
  "9",
  "8",
  "7",
  "6",
  "5",
  "4",
  "3",
  "2"
}

PB_UTIL.base_rarities = {
  "Common",
  "Uncommon",
  "Rare",
  "Legendary"
}

-- Define light and dark suits
PB_UTIL.light_suits = { 'Diamonds', 'Hearts' }
PB_UTIL.dark_suits = { 'Spades', 'Clubs' }

-- Add Crowns and Stars if enabled
if PB_UTIL.config.suits_enabled then
  table.insert(PB_UTIL.light_suits, 'paperback_Stars')
  table.insert(PB_UTIL.dark_suits, 'paperback_Crowns')
end
