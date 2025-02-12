SMODS.Joker {
  key = "alert",
  config = {
    extra = {
      current = 0,
      max = 3
    }
  },
  rarity = 2,
  pos = { x = 3, y = 7 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = false,
  soul_pos = { x = 4, y = 7 },
  yes_pool_flag = 'paperback_alert_can_spawn',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current,
        card.ability.extra.max
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.destroying_card and #context.full_hand == 1 then
      if context.destroying_card:is_face() then
        if card.ability.extra.current < card.ability.extra.max then
          -- If played hand is a single face card and the destroyed amount is
          -- less than the limit, destroy it and increase the count
          card.ability.extra.current = card.ability.extra.current + 1

          local ret = {
            remove = true,
            focus = card,
            message = localize {
              type = 'variable',
              key = 'paperback_a_completion',
              vars = {
                card.ability.extra.current,
                card.ability.extra.max
              },
              colour = G.C.UI.TEXT_INACTIVE
            },
            colour = G.C.UI.BACKGROUND_INACTIVE
          }

          if card.ability.extra.current >= card.ability.extra.max then
            -- Destroy this joker and create Legacy
            PB_UTIL.destroy_joker(card, function()
              -- Remove Alert from the pool
              G.GAME.pool_flags.paperback_alert_can_spawn = false

              SMODS.add_card({ key = 'j_paperback_legacy' })
            end)

            -- Modify the message
            ret.message = localize('paperback_destroyed_ex')
            ret.colour = G.C.MULT
          end

          return ret
        end
      end
    end
  end
}
