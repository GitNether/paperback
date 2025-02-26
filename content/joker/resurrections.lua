SMODS.Joker {
  key = 'resurrections',
  config = {
    extra = {
      sell_cost = 10,
      odds = 5,
      odds_cap = 4
    }
  },
  rarity = 3,
  pos = { x = 0, y = 10 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative

    return {
      vars = {
        math.min(G.GAME.probabilities.normal, card.ability.extra.odds_cap),
        card.ability.extra.odds,
        card.ability.extra.sell_cost,
        card.ability.extra.odds_cap
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.selling_card and context.card and context.card.ability.set == 'Joker' then
      local chance = math.min(G.GAME.probabilities.normal, card.ability.extra.odds_cap)
      local roll = pseudorandom("resurrections") < chance / card.ability.extra.odds

      if roll and #G.jokers.cards < G.jokers.config.card_limit then
        local copy = copy_card(context.card)
        copy:set_edition('e_negative')
        copy:add_to_deck()
        G.jokers:emplace(copy)
        PB_UTIL.modify_sell_value(copy, -(copy.sell_cost + card.ability.extra.sell_cost))

        return {
          message = localize('k_duplicated_ex')
        }
      end
    end
  end
}
