SMODS.Joker {
  key = "autumn_leaves",
  loc_txt = {
    name = "Autumn Leaves",
    text = {
      "Scored {C:diamonds}Diamonds{} give {C:mult}+#1#{} Mult for",
      "every {C:money}${} in {C:money}Sell Value{} this Joker has",
      "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult)"
    }
  },
  config = {
    extra = {
      a_mult = 1
    }
  },
  rarity = 1,
  pos = { x = 0, y = 4 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_mult,
        card.ability.extra.a_mult * card.sell_cost
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Diamonds") then
        return {
          mult = card.ability.extra.a_mult * card.sell_cost,
          card = card
        }
      end
    end
  end
}
