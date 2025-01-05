SMODS.Joker {
  key = 'jestrica',
  config = {
    extra = {
      mult = 0,
      a_mult = 2,
    }
  },
  rarity = 1,
  pos = { x = 7, y = 5 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_mult,
        card.ability.extra.mult,
      }
    }
  end,

  calculate = function(self, card, context)
    -- Go through each card in scoring hand and check how many diamonds there are
    if context.before and not context.blueprint then
      local diamonds = 0

      for k, current_card in pairs(context.scoring_hand) do
        if current_card:is_suit("Diamonds") then
          diamonds = diamonds + 1
        end
      end

      if diamonds >= #context.scoring_hand then
        -- Upgrade the mult on Joker and return a message if everything is a diamond
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      elseif diamonds <= 0 and card.ability.extra.mult > 0 then
        -- Reduce the mult of this card by half if none are diamonds
        card.ability.extra.mult = math.floor(card.ability.extra.mult / 2)
        return {
          message = localize('paperback_downgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end

    -- Give the mult during scoring
    if context.joker_main and card.ability.extra.mult > 0 then
      return {
        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
        mult_mod = card.ability.extra.mult
      }
    end
  end
}
