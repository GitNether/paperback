SMODS.Joker {
  key = 'joker_cookie',
  loc_txt = {
    name = "Joker Cookie",
    text = {

    }
  },
  config = {
    extra = {
        dollar_bonus = 1,
    }
  },
  rarity = 1,
  pos = { x = 4, y = 5 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {

      }
    }
  end,

  calculate = function(self, card, context)
    
  end,

  calc_dollar_bonus = function(self, card)
    local dollar_bonus = card.ability.extra.dollar_bonus

    card.ability.extra.dollar_bonus = card.ability.extra.dollar_bonus + 1
    card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Upgraded!", colour = G.C.MONEY})

    return dollar_bonus
  end
}
