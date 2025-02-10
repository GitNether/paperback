SMODS.Consumable {
  key = 'four_of_cups',
  set = 'paperback_minor_arcana',
  config = {
    max_highlighted = 3,
    extra = {
      money = 5
    }
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 6, y = 0 },
  unlocked = true,
  discovered = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted,
        card.ability.extra.money
      }
    }
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      local money = 0

      for _, v in ipairs(G.hand.highlighted) do
        for _, _ in pairs(SMODS.get_enhancements(v)) do
          money = money + card.ability.extra.money
        end
        v:set_ability(G.P_CENTERS.c_base)

        if v.seal then
          money = money + card.ability.extra.money
          v.seal = nil
        end

        if v.edition then
          money = money + card.ability.extra.money
          v.edition = nil
        end
      end

      if money > 0 then
        ease_dollars(money)
      end
    end)
  end
}
