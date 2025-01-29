SMODS.Joker {
  key = 'moribund',
  config = {
    extra = {
      a_mult = 10,
      mult = 0,
    }
  },
  rarity = 2,
  pos = { x = 0, y = 5 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_mult,
        card.ability.extra.mult,
      }
    }
  end,

  calculate = function(self, card, context)
    -- Prevent Blueprint or Brainstorm from copying these effects
    if not context.blueprint then
      if context.end_of_round then
        -- If blind not cleared, double current mult
        if context.game_over then
          card.ability.extra.mult = card.ability.extra.mult * 2

          return {
            message = localize('paperback_doubled_ex'),
            colour = G.C.MULT,
            card = card
          }
        end

        -- If blind cleared and 0 hands left, upgrade joker
        if G.GAME.current_round.hands_left == 0 and not (context.individual or context.repetition) then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult

          return {
            message = localize('k_upgrade_ex'),
            card = card,
            colour = G.C.MULT,
          }
        end
      end
    end

    -- Give the mult during scoring
    if context.joker_main then
      if card.ability.extra.mult ~= 0 then
        return {
          mult = card.ability.extra.mult,
        }
      end
    end
  end
}
