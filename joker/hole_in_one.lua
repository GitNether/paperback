SMODS.Joker {
  key = 'hole_in_one',
  loc_txt = {
    name = "Hole in One",
    text = {
      "If first {C:chips}hand{} of round cleared the {C:attention}blind{},",
      "double the {C:money}Sell Value{} of all Jokers and Consumeables {C:inactive}(Max of {C:money}$#1#{C:inactive} per round).",
      "If this Joker is sold, all Jokers and Consumeables are set to",
      "a {C:money}Sell Value{} of {C:money}$0{}"
    }
  },
  config = {
    extra = {
      money_max = 9,
    }
  },
  rarity = 3,
  pos = { x = 1, y = 1 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money_max
      }
    }
  end,

  calculate = function(self, card, context)
    -- Double all sell values at end of round and if hands played == 1
    if context.end_of_round and not (context.individual or context.repetition) and not context.blueprint then
      if G.GAME.current_round.hands_played == 1 then
        -- Double all Joker sell values
        for index, v in ipairs(G.jokers.cards) do
          if v.custom_sell_cost then
            if v.set_cost then
              v.custom_sell_cost_increase = v.sell_cost
              v:set_cost()
            end
          else
            if v.set_cost then
              v.ability.extra_value = (v.ability.extra_value or 0)
                  + (v.sell_cost > card.ability.extra.money_max and card.ability.extra.money_max or v.sell_cost)
              v:set_cost()
            end
          end
        end

        -- Double all Consumeable sell values
        for index, v in ipairs(G.consumeables.cards) do
          if card.set_cost then
            if v.custom_sell_cost then
              v.custom_sell_cost_increase = v.sell_cost
            else
              v.ability.extra_value = (v.ability.extra_value or 0)
                  + (v.sell_cost > card.ability.extra.money_max and card.ability.extra.money_max or v.sell_cost)
            end
            v:set_cost()
          end
        end

        return {
          message = localize('k_val_up'),
          colour = G.C.MONEY
        }
      end
    end

    -- Set all sell values to 0 when selling this Joker
    if context.selling_self and not context.blueprint then
      -- Resets all Jokers' sell values
      for index, v in ipairs(G.jokers.cards) do
        if v ~= card then
          if v.set_cost then
            v.ability.extra_value = 0
            v.zero_sell_cost = true
            v:set_cost()
          end
        end
      end

      -- Resets all consumeables' sell values
      for index, v in ipairs(G.consumeables.cards) do
        if v.set_cost then
          v.ability.extra_value = 0
          v.zero_sell_cost = true
          v:set_cost()
        end
      end
    end
  end
}
