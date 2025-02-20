if PB_UTIL.config.minor_arcana_enabled and PB_UTIL.config.vouchers_enabled then
  SMODS.Back {
    key = 'silver',
    atlas = 'decks_atlas',
    pos = { x = 2, y = 0 },
    config = {
      vouchers = {
        'v_paperback_celtic_cross'
      },
      consumables = {
        'c_paperback_nine_of_cups'
      }
    },

    loc_vars = function(self, info_queue)
      return {
        vars = {
          localize { type = 'name_text', key = 'v_paperback_celtic_cross', set = 'Voucher' },
          localize { type = 'name_text', key = 'c_paperback_nine_of_cups', set = 'paperback_minor_arcana' }
        }
      }
    end
  }
end
