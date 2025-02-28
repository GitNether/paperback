SMODS.Joker {
  key = "ddakji",
  config = {
    extra = {
      odds = 3
    }
  },
  rarity = 3,
  pos = { x = 8, y = 6 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and context.main_eval then
      local face_down
      local face_up

      for _, v in ipairs(context.scoring_hand) do
        if v.ability.paperback_ddakji_flipped then
          face_down = true
        else
          face_up = true
        end
      end

      if face_down and face_up then
        local type = PB_UTIL.poll_consumable_type('ddakji').key
        return nil, PB_UTIL.try_spawn_card {
          set = type,
          area = G.consumeables,
          soulable = true,
          key_append = 'ddakji',
          func = function()
            SMODS.calculate_effect({
              message = localize('paperback_plus_consumable'),
              colour = G.C.SECONDARY_SET[type] or G.C.TAROT
            }, context.blueprint_card or card)
          end
        }
      end
    end

    -- Clear the flipped mark at end of round
    if context.end_of_round and context.main_eval and not context.blueprint then
      for _, v in ipairs(G.playing_cards) do
        v.ability.paperback_ddakji_flipped = nil
      end
    end
  end
}

local stay_flipped_ref = Blind.stay_flipped
function Blind.stay_flipped(self, area, card)
  if area == G.hand then
    local _, ddakji = next(SMODS.find_card('j_paperback_ddakji'))
    if ddakji and pseudorandom('ddakji') < G.GAME.probabilities.normal / ddakji.ability.extra.odds then
      -- Mark the card as flipped, since the card is flipped before scoring
      card.ability.paperback_ddakji_flipped = true
      return true
    end
  end

  return stay_flipped_ref(self, area, card)
end
