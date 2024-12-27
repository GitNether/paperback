SMODS.Joker {
  key = 'unholy_alliance',
  loc_txt = {
    name = "Unholy Alliance",
    text = {
      "This Joker gains {X:mult,C:white}X#1#{} Mult",
      "when a card or joker is {C:attention}destroyed{}",
      "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
    }
  },
  config = {
    extra = {
      xMult = 1,
      xMult_gain = 0.2
    }
  },
  rarity = 2,
  pos = { x = 6, y = 4 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xMult_gain,
        card.ability.extra.xMult,
      }
    }
  end,

  calculate = function(self, card, context)
    -- Gains mult when cards are destroyed. Each card destroyed provides the specified mult_mod
    if not context.blueprint then
      -- Checks if a joker is destroyed
      if context.destroying_cards then
        if context.destroyed_card and context.destroyed_card ~= card then
          card.ability.extra.xMult = card.ability.extra.xMult + card.ability.extra.xMult_gain

          card_eval_status_text(card, 'extra', nil, nil, nil,
            { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xMult } } })
        end
        -- Checks if playing cards are destroyed
      elseif context.remove_playing_cards then
        if context.removed and #context.removed > 0 then
          card.ability.extra.xMult = card.ability.extra.xMult + (#context.removed * card.ability.extra.xMult_gain)

          card_eval_status_text(card, 'extra', nil, nil, nil,
            { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xMult } } })
        end
      end
    end

    -- Gives the mult when scoring
    if context.joker_main then
      if card.ability.extra.xMult > 1 then
        return {
          Xmult_mod = card.ability.extra.xMult,
          card = card,
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xMult } }
        }
      end
    end
  end
}
