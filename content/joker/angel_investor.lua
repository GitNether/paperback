SMODS.Joker {
  key = "angel_investor",
  rarity = 1,
  pos = { x = 7, y = 7 },
  atlas = 'jokers_atlas',
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_tags = true,
  },
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_paperback_angel_investment
  end,

  calculate = function(self, card, context)
    if context.skip_blind then
      PB_UTIL.add_tag('tag_paperback_angel_investment')

      return {
        message = localize('paperback_investment_ex'),
        colour = G.C.MONEY
      }
    end
  end
}
