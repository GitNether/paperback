SMODS.Joker {
  key = "summoning_circle",
  rarity = 3,
  pos = { x = 1, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  calculate = function(self, card, context)
    if not card.debuff then
      if context.before then
        if context.scoring_name == "Five of a Kind" or context.scoring_name == "Flush Five" then
          -- Check if there is room to copy a card
          if G.consumeables.cards[1] and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            -- Add the card to G.consumeables
            G.E_MANAGER:add_event(Event({
              func = function()
                local copied_card
                -- Incantation support
                if next(SMODS.find_mod('incantation')) then
                  local total, checked = 0, 0
                  for i = 1, #G.consumeables.cards do
                    total = total + (G.consumeables.cards[i]:getQty())
                  end
                  local poll = pseudorandom(pseudoseed('summoning_circle')) * total
                  for i = 1, #G.consumeables.cards do
                    checked = checked + (G.consumeables.cards[i]:getQty())
                    if checked >= poll then
                      copied_card = G.consumeables.cards[i]
                      break
                    end
                  end
                else
                  copied_card = pseudorandom_element(G.consumeables.cards, pseudoseed('summoning_circle'))
                end
                copied_card = copy_card(copied_card, nil, nil, nil,
                  copied_card.edition and copied_card.edition.negative)
                -- More Incantation support
                if next(SMODS.find_mod('incantation')) then
                  copied_card.ability.qty = 1
                  copied_card:set_cost()
                end
                copied_card:add_to_deck()
                G.consumeables:emplace(copied_card)
                return true
              end
            }))

            return {
              message = localize('k_duplicated_ex')
            }
          end
        end
      end
    end
  end
}
