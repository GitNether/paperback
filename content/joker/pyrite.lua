SMODS.Joker {
  key = 'pyrite',
  config = {
    extra = {
      min_money = -1,
      max_money = 3
    }
  },
  rarity = 2,
  pos = { x = 2, y = 9 },
  atlas = 'jokers_atlas',
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_crowns = true
  },
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.min_money,
        card.ability.extra.max_money
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit('paperback_Crowns') then
        local dollars = pseudorandom("pyrite", card.ability.extra.min_money, card.ability.extra.max_money)

        if dollars ~= 0 then
          return {
            dollars = dollars
          }
        end
      end
    end
  end
}
