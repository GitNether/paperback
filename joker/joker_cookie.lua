SMODS.Joker {
  key = 'joker_cookie',
  loc_txt = {
    name = "Joker Cookie",
    text = {
      "Earn {C:money}$#1#{} at end of round",
      "Payout increases by {C:money}$#2#{} when cashing out",
      "{C:green}#3# in #4#{} chance this card",
      "is eaten at end of round"
    }
  },
  config = {
    extra = {
        dollar_bonus = 1,
        dollar_gain = 1,
        odds = 5
    }
  },
  rarity = 1,
  pos = { x = 4, y = 5 },
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
        card.ability.extra.dollar_bonus,
        card.ability.extra.dollar_gain,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint then
      if context.end_of_round and not (context.individual or context.repetition) then
        -- Destroy the Joker if the odds are hit
        if pseudorandom("Joker Cookie") < G.GAME.probabilities.normal / card.ability.extra.odds then
          G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card.T.r = -0.2
                card:juice_up(0.3, 0.4)
                card.states.drag.is = true
                card.children.center.pinch.x = true
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                    func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                        return true; end})) 
                return true
            end
          })) 

          -- Return the "Eaten!" message
          return {
            message = localize('k_eaten_ex')
          }
        else

          -- Return the "Safe!" message
          return {
            message = localize('k_safe_ex')
          }
        end 
      end

      -- Upgrade the Joker when the user cashes out
      if context.cashing_out then
        card.ability.extra.dollar_bonus = card.ability.extra.dollar_bonus + card.ability.extra.dollar_gain
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Upgraded!", colour = G.C.MONEY})
      end 
    end
  end,

  -- Gives the money in the cash out screen
  calc_dollar_bonus = function(self, card)
    local dollar_bonus = card.ability.extra.dollar_bonus

    return dollar_bonus
  end
}


-- Hooks into cash_out function to call calculate_joker()
local cash_out_ref = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
  for i = 1, #G.jokers.cards do
    G.jokers.cards[i]:calculate_joker({ cashing_out = true })
  end

  cash_out_ref(e)
end