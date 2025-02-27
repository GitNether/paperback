SMODS.Joker {
  key = 'deadringer',
  config = {
    extra = {
      [14] = 1,
      [7] = 1,
      [9] = 2
    }
  },
  rarity = 2,
  pos = { x = 4, y = 8 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local vars = {}
    for k, _ in pairs(card.ability.extra) do
      vars[#vars + 1] = localize(PB_UTIL.get_rank_from_id(k).key, 'ranks')
    end

    return {
      vars = vars
    }
  end,

  calculate = function(self, card, context)
    if context.repetition then
      return {
        repetitions = card.ability.extra[context.other_card:get_id()]
      }
    end
  end
}
