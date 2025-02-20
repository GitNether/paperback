SMODS.Joker {
  key = "jimbo_adventure",
  rarity = 1,
  pos = { x = 1, y = 5 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = { x = 2, y = 5 },

  calculate = function(self, card, context)
    if context.skip_blind then
      PB_UTIL.add_tag(PB_UTIL.poll_tag("jimbo_adventure"))
    end
  end,
}
