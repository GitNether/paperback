SMODS.Joker {
  key = 'triple_moon_goddess',
  config = {
    extra = {
      planet_odds = 3,
      tarot_odds = 3,
    }
  },
  rarity = 2,
  pos = { x = 5, y = 4 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.planet_odds,
        G.GAME.probabilities.normal,
        card.ability.extra.tarot_odds
      }
    }
  end,

  calculate = function(self, card, context)
    -- Check for a 30ak in played hand
    if context.before and not context.blueprint and context.main_eval then
      -- Keep track of the number of specific ranks in scoring_hand, and initialize the found flag
      local count = {}
      local found = false

      -- Loop over scoring_hand to add them to the count
      for _, v in pairs(context.scoring_hand) do
        -- Only check cards that are not stone cards
        if v.ability.name ~= "Stone Card" then
          local rank = v:get_id()
          count[rank] = (count[rank] or 0) + 1

          -- Check if a 3oak has been found
          if count[rank] >= 3 then
            found = true
            break
          end
        end
      end

      -- If a 3oak is present, perform the rng checks
      if found then
        -- Check if planet card is generated and there is enough space in the consumeables area
        if pseudorandom("Triple Moon Goddess (Planet)") < G.GAME.probabilities.normal / card.ability.extra.planet_odds and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = function()
              local card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'moon')
              card:add_to_deck()
              G.consumeables:emplace(card)
              G.GAME.consumeable_buffer = 0
              return true
            end
          }))
          card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
            { message = localize('k_plus_planet'), colour = G.C.SET.Planet })
        end

        -- Check if a tarot card is generated and there is enough space in the consumeables area
        if pseudorandom("Triple Moon Goddess (Tarot)") < G.GAME.probabilities.normal / card.ability.extra.tarot_odds and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = function()
              local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'moon')
              card:add_to_deck()
              G.consumeables:emplace(card)
              G.GAME.consumeable_buffer = 0
              return true
            end
          }))
          card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
            { message = localize('k_plus_tarot'), colour = G.C.SET.Tarot })
        end
      end
    end
  end
}
