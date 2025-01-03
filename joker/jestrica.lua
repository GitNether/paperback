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
    -- Go through each card in scoring hand and check if it is not a Diamond
    if context.before and not context.blueprint then
      for k, current_card in pairs(context.scoring_hand) do
        -- If current_card is not a Diamond, return early and do not upgrade Joker
        if not current_card:is_suit("Diamonds") then
          return
        end
      end

      -- Upgrade the mult on Joker and return a message
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MULT,
        card = card
      }
    end

    -- Give the mult during scoring
    if context.joker_main then
      return {
        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
        mult_mod = card.ability.extra.mult
      }
    end
  end
}
