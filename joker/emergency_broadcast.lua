SMODS.Joker {
	key = 'emergency_broadcast',
	loc_txt = {
    name = "Emergency Broadcast",
    text = {
      "Temporary Description"
    }
	},
	config = {
	  extra = {

	  }
  },
  rarity = 1,
  pos = { x = 0, y = 0 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)

  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
       message = localize('k_balanced'),
       colour = { 0.8, 0.45, 0.85, 1 },
      }
    end
  end
}
