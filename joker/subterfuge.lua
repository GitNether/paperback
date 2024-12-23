SMODS.Joker {
  key = 'subterfuge',
  loc_txt = {
    name = "Subterfuge",
    text = {
      "Destroy the {C:attention}first played hand{} every round",
      "Gains {X:mult,C:white}X#1#{} mult for every card below {C:attention}#2#{}",
      "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} mult)"
    }
  },
  config = {
    extra = {
      xMult = 1,
      xMult_gain = 0.1,
    }
  },
  rarity = 3,
  pos = { x = 3, y = 5 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local xMult = math.max(1,
      (card.ability.extra.xMult_gain) * (G.playing_cards and (G.GAME.starting_deck_size - #G.playing_cards) or 1) + 1)

    if xMult < 1 then
      xMult = 1
    end

    return {
      vars = {
        card.ability.extra.xMult_gain,
        G.GAME.starting_deck_size,
        xMult
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint then
      -- Destroy all cards in first hand
      if context.after and G.GAME.current_round.hands_played == 0 and not (context.individual or context.repetition) then
        local destroyed_cards = {}

        for i = #G.play.cards, 1, -1 do
          destroyed_cards[#destroyed_cards + 1] = G.play.cards[i]
        end

        local dissolve_time_fac = 1
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.7 * dissolve_time_fac * 1.051,
          func = function()
            if #destroyed_cards ~= 0 then
              card_eval_status_text(card, 'extra', nil, nil, nil,
                { message = "Destroyed!", colour = G.C.MULT, instant = true })

              play_sound('tarot1')
              card:juice_up(0.3, 0.5)
            end

            for i = 1, #destroyed_cards do
              local current_card = destroyed_cards[i]
              if not current_card.removed then
                if current_card.ability.name == 'Glass Card' then
                  current_card:shatter()
                else
                  current_card:start_dissolve(nil, nil, dissolve_time_fac)
                end
              end
            end
            return true
          end
        }))

        for _, current_card in ipairs(destroyed_cards) do
          current_card.destroyed = true
        end

        for i = 1, #G.jokers.cards do
          G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = destroyed_cards })
        end
      end
    end


    -- Give the xMult during scoring
    if context.joker_main then
      local xMult = math.max(1,
        (card.ability.extra.xMult_gain) * (G.playing_cards and (G.GAME.starting_deck_size - #G.playing_cards) or 1) + 1)

      -- Only give xMult if the xMult is greater than 1
      if xMult > 1 then
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { xMult } },
          Xmult_mod = xMult,
          card = card,
        }
      end
    end
  end
}
