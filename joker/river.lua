SMODS.Joker {
  key = "river",
  config = {
    extra = {
      money_cap = 11
    }
  },
  rarity = 2,
  pos = { x = 4, y = 4 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money_cap
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not (context.individual or context.repetition) then
      -- Check if the scoring_hand contains five cards
      if #context.scoring_hand >= 5 then
        local lowest_chip_card = context.scoring_hand[1]

        -- Find the lowest card in the scoring_hand
        for k, current_card in pairs(context.scoring_hand) do
          if current_card:get_chip_bonus() < lowest_chip_card:get_chip_bonus() then
            lowest_chip_card = current_card
          end
        end

        -- Do not give money if the lowest card is debuffed
        if lowest_chip_card.debuff then
          return {
            message = localize('k_debuffed'),
            colour = G.C.MULT,
            card = card
          }
        end

        -- Calculate the money to give and return it
        local lowest_chip_bonus = lowest_chip_card:get_chip_bonus()
        local money_to_give = lowest_chip_bonus > card.ability.extra.money_cap
            and card.ability.extra.money_cap or lowest_chip_bonus

        ease_dollars(money_to_give)

        return {
          message = localize("$") .. money_to_give,
          colour = G.C.MONEY,
          delay = 0.45,
          card = card
        }
      end
    end
  end
}
