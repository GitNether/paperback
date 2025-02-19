SMODS.Voucher {
  key = 'celtic_cross',
  atlas = 'vouchers_atlas',
  pos = { x = 0, y = 0 },
  discovered = true,
  paperback = {
    requires_minor_arcana = true
  },

  redeem = function(self, card)
    -- 4 is the default rate for Tarots with no vouchers
    G.GAME.paperback_minor_arcana_rate = 4
  end
}
