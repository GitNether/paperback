SMODS.Joker {
  key = 'emergency_broadcast',
  config = {
    extra = {
      a_mult = 5,
      a_chips = 8,
    }
  },
  rarity = 1,
  pos = { x = 9, y = 4 },
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
        card.ability.extra.a_mult,
        card.ability.extra.a_chips,
      }
    }
  end,

  calculate = function(self, card, context)
    if not card.debuff then
      if context.individual and context.cardarea == G.play then
        if context.other_card:get_id() == 5 or context.other_card:get_id() == 8 then
          return {
            mult = card.ability.extra.a_mult,
            chips = card.ability.extra.a_chips,
            card = card
          }
        end
      end
    end
  end
}
