SMODS.Joker {
  key = 'power_surge',
  config = {
    extra = {
      rank = 7,
      xMult = 2,
      odds = 4,
    }
  },
  rarity = 3,
  pos = { x = 7, y = 10 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.rank,
        card.ability.extra.xMult,
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == card.ability.extra.rank then
        if pseudorandom('power_surge') < G.GAME.probabilities.normal / card.ability.extra.odds then
          local destroyed_card = #G.hand.cards > 0 and
              pseudorandom_element(G.hand.cards, pseudoseed('power_surge_destroy')) or nil

          if destroyed_card then
            G.E_MANAGER:add_event(Event({
              func = function()
                destroyed_card:start_dissolve({ G.C.RED }, nil, 1.6)
                return true
              end
            }))
          end
        end

        return {
          xmult = card.ability.extra.xMult
        }
      end
    end
  end

}
