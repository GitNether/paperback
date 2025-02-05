SMODS.Joker {
  key = 'subterfuge',
  config = {
    extra = {
      xMult = 1,
      xMult_gain = 0.1,
    }
  },
  rarity = 3,
  pos = { x = 3, y = 5 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local xMult = math.max(1,
      (card.ability.extra.xMult_gain) * (G.playing_cards and (G.GAME.starting_deck_size - #G.playing_cards) or 1) + 1)

    if xMult < 1 then
      xMult = 1
    end

    return {
      vars = {
        card.ability.extra.xMult_gain,
        G.GAME.starting_deck_size,
        xMult
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint then
      -- Destroy all cards in first hand
      if context.after and G.GAME.current_round.hands_played == 0 and not (context.individual or context.repetition) then
        local destroyed_cards = {}

        for i = #G.play.cards, 1, -1 do
          destroyed_cards[#destroyed_cards + 1] = G.play.cards[i]
        end

        PB_UTIL.destroy_playing_cards(destroyed_cards, card, {
          message = localize('paperback_destroyed_ex'),
          colour = G.C.MULT
        })
      end
    end

    -- Give the xMult during scoring
    if context.joker_main then
      local xMult = math.max(1,
        (card.ability.extra.xMult_gain) * (G.playing_cards and (G.GAME.starting_deck_size - #G.playing_cards) or 1) + 1)

      -- Only give xMult if the xMult is greater than 1
      if xMult > 1 then
        return {
          x_mult = xMult,
          card = card,
        }
      end
    end
  end
}
