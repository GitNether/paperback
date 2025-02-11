SMODS.Joker {
  key = 'quartz',
  config = {
    extra = {
      x_chips = 0.5
    }
  },
  rarity = 2,
  pos = { x = 1, y = 9 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  in_pool = function(self, card)
    return PB_UTIL.config.suits_enabled
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit('paperback_Stars') then
        local stars = 0

        for _, v in ipairs(context.full_hand) do
          if v:is_suit('paperback_Stars') and v ~= context.other_card then
            stars = stars + 1
          end
        end

        if stars > 0 then
          return {
            x_chips = 1 + card.ability.extra.x_chips * stars
          }
        end
      end
    end
  end
}
