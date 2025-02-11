SMODS.Joker {
  key = 'skydiver',
  config = {
    extra = {
      x_mult = 3,
      lowest_rank = 'Ace',
      lowest_id = 14,
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
    local lowest_rank = localize(card.ability.extra.lowest_rank, 'ranks')

    return {
      vars = {
        card.ability.extra.x_mult,
        lowest_rank
      }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      PB_UTIL.reset_skydiver(card)
    end
  end,

  -- Calculate function for the Joker
  calculate = function(self, card, context)
    if not card.debuff then
      -- Give the xMult during play if conditions are met
      if context.joker_main then
        local active = true

        -- If there is a scored card with a rank that has a higher rank than the lowest
        -- recorded by this joker, do not trigger the effect
        for k, v in ipairs(context.scoring_hand) do
          if not SMODS.has_no_rank(v) and PB_UTIL.compare_ranks(v:get_id(), card.ability.extra.lowest_id) then
            active = false
            break
          end
        end

        if active then
          return {
            x_mult = card.ability.extra.x_mult,
            card = card
          }
        end
      end

      if context.after and context.main_eval and not context.blueprint then
        local last_lowest = PB_UTIL.get_rank_from_id(card.ability.extra.lowest_id)

        if context.scoring_hand then
          for _, v in pairs(context.scoring_hand) do
            if not SMODS.has_no_rank(v) then
              local other_rank = PB_UTIL.get_rank_from_id(v:get_id())

              -- If the lowest rank is higher than or equal to the new rank, that means we have a new low
              if PB_UTIL.compare_ranks(last_lowest, other_rank, true) then
                last_lowest = other_rank
              end
            end
          end

          local updated = card.ability.extra.lowest_id ~= last_lowest.id

          if updated then
            card.ability.extra.lowest_rank = last_lowest.key
            card.ability.extra.lowest_id = last_lowest.id

            return {
              message = localize(card.ability.extra.lowest_rank, 'ranks'),
            }
          end
        end
      end

      if context.end_of_round and context.main_eval and not context.blueprint then
        PB_UTIL.reset_skydiver(card)

        return {
          message = localize('k_reset'),
          colour = G.C.MULT
        }
      end
    end
  end
}
