SMODS.Voucher {
  key = 'soothsay',
  atlas = 'vouchers_atlas',
  pos = { x = 0, y = 1 },
  discovered = true,
  requires = {
    'v_paperback_celtic_cross'
  },
  paperback = {
    requires_minor_arcana = true,
    requires_tags = true
  },

  loc_vars = function(self, info_queue)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_paperback_divination
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and G.GAME.blind.boss then
      PB_UTIL.add_tag('tag_paperback_divination', true)
    end
  end
}
