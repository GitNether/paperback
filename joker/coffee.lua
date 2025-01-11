SMODS.Joker {
  key = "coffee",
  config = {
    extra = {
      hand_size = 0,
      increase = 1,
      odds = 5
    }
  },
  rarity = 2,
  pos = { x = 3, y = 6 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = false,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.hand_size,
        card.ability.extra.increase,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end

    if context.skip_blind then
      -- Increment the hand size when skipping a blind
      card.ability.extra.hand_size = card.ability.extra.hand_size + card.ability.extra.increase
      G.hand:change_size(card.ability.extra.increase)

      return {
        message = localize('k_upgrade_ex')
      }
    end

    if context.setting_blind and not context.blind.boss then
      if pseudorandom("coffee") < G.GAME.probabilities.normal / card.ability.extra.odds then
        -- Destroy the joker
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.3,
              blockable = false,
              func = function()
                G.jokers:remove_card(card)
                card:remove()
                return true
              end
            }))
            return true
          end
        }))

        -- Revert all the hand size increase when eaten
        G.hand:change_size(-card.ability.extra.hand_size)

        return {
          message = localize('paperback_consumed_ex'),
          colour = G.C.MULT
        }
      end
    end
  end
}
