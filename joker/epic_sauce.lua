SMODS.Joker {
  key = "epic_sauce",
  config = {
    extra = {
      x_mult = 4,
    }
  },
  rarity = 3,
  pos = { x = 0, y = 7 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.x_mult }
    }
  end,

  calculate = function(self, card, context)
    -- Give the X mult when playing hands
    if context.joker_main and context.cardarea == G.jokers then
      return {
        x_mult = card.ability.extra.x_mult,
      }
    end

    -- After a hand is played, check if at least one hand has been played,
    -- then collect all jokers that are not eternal or getting sliced by
    -- Madness, if at least one is available, randomly pick one and destroy it
    if not context.blueprint and context.cardarea == G.jokers and context.after then
      if G.GAME.current_round.hands_played > 0 then
        local eligible_jokers = {}

        for k, v in pairs(G.jokers.cards) do
          if not v.ability.eternal and not v.getting_sliced then
            eligible_jokers[#eligible_jokers + 1] = v
          end
        end

        if #eligible_jokers > 0 then
          PB_UTIL.destroy_joker(pseudorandom_element(eligible_jokers, pseudoseed("epic_sauce")))

          return {
            message = localize('paperback_too_hot_ex'),
            colour = G.C.MULT
          }
        end
      end
    end
  end
}
