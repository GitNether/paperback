SMODS.Shader {
  key = 'dichrome',
  path = 'dichrome.fs'
}

SMODS.Edition {
  key = 'dichrome',
  shader = 'dichrome',
  config = {
    amount = 1
  },
  discovered = true,
  weight = 3,     -- As rare as polychrome
  in_shop = true,
  extra_cost = 5, -- As expensive as polychrome

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.edition.amount
      }
    }
  end,

  calculate = function(self, card, context)
    if context.setting_blind and card.ability.set == 'Joker' then
      G.E_MANAGER:add_event(Event {
        trigger = 'after',
        delay = 1,
        func = function()
          local res = PB_UTIL.get_lowest_hand_discard()
          -- Pick hands over discards
          local func = res.hands and ease_hands_played or ease_discard
          local message = res.hands and 'a_hands' or 'paperback_a_discards'

          func(card.edition.amount, true)

          SMODS.calculate_effect({
            message = localize {
              type = 'variable',
              key = message .. (res.amt < 0 and '_minus' or ''),
              vars = { card.edition.amount }
            },
            colour = res.hands and G.C.CHIPS or G.C.MULT,
            instant = true
          }, card)
          return true
        end
      })
    end
  end
}

-- Prevent Dichrome edition being added to non-jokers
local poll_edition_ref = poll_edition
function poll_edition(_key, _mod, _no_neg, _guaranteed, _options)
  local removed, pos

  if _no_neg then
    for i, v in ipairs(G.P_CENTER_POOLS.Edition) do
      if v.key == 'e_paperback_dichrome' then
        pos = i
        removed = table.remove(G.P_CENTER_POOLS.Edition, i)
        break
      end
    end
  end

  local ret = poll_edition_ref(_key, _mod, _no_neg, _guaranteed, _options)

  if _no_neg and removed and pos then
    table.insert(G.P_CENTER_POOLS.Edition, pos, removed)
  end

  return ret
end
