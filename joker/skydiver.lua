SMODS.Joker {
  key = 'skydiver',
  config = {
    extra = {
      x_mult = 3,
      lowest_rank = 14,
    }
  },
  rarity = 2,
  pos = { x = 4, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local lowest_rank = localize(get_rank(card.ability.extra.lowest_rank), 'ranks')

    return {
      vars = {
        card.ability.extra.x_mult,
        lowest_rank
      }
    }
  end,

  -- Calculate function for the Joker
  calculate = function(self, card, context)
    if not card.debuff then
      -- Give the xMult during play if conditions are met
      if context.joker_main then
        local active = true

        -- Loop through the scoring_hand
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i].ability.name == "Stone Card" then
            if 0 > card.ability.extra.lowest_rank then
              active = false
              break
            end
          elseif context.scoring_hand[i]:get_id() > card.ability.extra.lowest_rank then
            active = false
            break
          end
        end
        if active then
          return {
            message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
            Xmult_mod = card.ability.extra.x_mult,
            card = card
          }
        end
      end

      if context.after and not (context.individual or context.repetition) and not context.blueprint then
        local last_lowest = card.ability.extra.lowest_rank

        if context.scoring_hand then
          for _, v in pairs(context.scoring_hand) do
            if v.ability.name == "Stone Card" then
              if 0 < card.ability.extra.lowest_rank then
                card.ability.extra.lowest_rank = 0
              end
            elseif v:get_id() < card.ability.extra.lowest_rank then
              card.ability.extra.lowest_rank = v:get_id()
            end
          end

          if card.ability.extra.lowest_rank < last_lowest then
            return {
              message = tostring(card.ability.extra.lowest_rank),
              card = card
            }
          end
        end
      end

      if context.end_of_round and not (context.individual or context.repetition) and G.GAME.blind.boss and not context.blueprint then
        card.ability.extra.lowest_rank = 14

        return {
          message = localize('k_reset'),
          colour = G.C.MULT,
          card = card
        }
      end
    end
  end
}


function get_rank(rank)
  if rank == 11 then
    return "Jack"
  elseif rank == 12 then
    return "Queen"
  elseif rank == 13 then
    return "King"
  elseif rank == 14 then
    return "Ace"
  else
    return tostring(rank)
  end
end
