SMODS.Joker {
  key = "stamp",
  config = {
    extra = {
      chips = 0,
      chip_mod = 25,
      odds = 3
    }
  },
  rarity = 3,
  pos = { x = 8, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  unlocked = false,
  pixel_size = { w = 35, h = 45 },

  check_for_unlock = function(self, args)
    if args.type == "hand" then
      local seals = 0

      for k, v in ipairs(args.scoring_hand or {}) do
        if v:get_seal() then seals = seals + 1 end
      end

      return seals >= 5
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = { 5 }
    }
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
        card.ability.extra.chip_mod,
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    -- Upgrades Joker if seal is played
    if context.individual and not context.blueprint then
      if context.cardarea == G.play then
        if context.other_card:get_seal() then
          -- Gives chips if roll succeeds
          if pseudorandom("Stamp") < G.GAME.probabilities.normal / card.ability.extra.odds then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            card_eval_status_text(card, 'extra', nil, nil, nil,
              { message = localize('k_upgrade_ex'), colour = G.C.CHIPS })
          end
        end
      end
    end

    -- Gives the chips during play
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end
}
