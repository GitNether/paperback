SMODS.Joker {
  key = "backpack",
  rarity = 1,
  pos = { x = 4, y = 6 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_buffoon_normal_1
  end,

  calculate = function(self, card, context)
    local ctx = context.paperback

    if ctx and ctx.entering_shop and ctx.create_boosters then
      G.E_MANAGER:add_event(Event {
        func = function()
          PB_UTIL.add_booster_pack('p_buffoon_normal_' .. pseudorandom('backpack', 1, 2), 0)
          return true
        end
      })

      return {
        message = localize('paperback_supplies_ex'),
        colour = G.C.CHIPS
      }
    end
  end
}
