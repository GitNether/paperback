SMODS.Joker {
  key = "book_of_vengeance",
  rarity = 3,
  pos = { x = 4, y = 9 },
  atlas = 'jokers_atlas',
  cost = 9,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    local main_end

    if G.jokers then
      for _, v in ipairs(G.jokers.cards) do
        if v.edition and v.edition.negative then
          main_end = {}
          localize {
            type = 'other',
            key = 'remove_negative',
            nodes = main_end
          }
          break
        end
      end
    end

    return {
      main_end = main_end and main_end[1]
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.end_of_round and context.main_eval
        and G.GAME.blind.boss and G.GAME.current_round.hands_played <= 1 then
      local other_joker

      for i, v in ipairs(G.jokers.cards) do
        if v == card then
          other_joker = G.jokers.cards[i + 1]
          break
        end
      end

      if other_joker and other_joker ~= card then
        PB_UTIL.destroy_joker(card, function()
          if #G.jokers.cards < G.jokers.config.card_limit then
            local strip_edition = other_joker.edition and other_joker.edition.negative
            local copy = copy_card(other_joker, nil, nil, nil, strip_edition)
            copy:add_to_deck()
            G.jokers:emplace(copy)
          end
        end)

        return {
          message = localize('k_duplicated_ex')
        }
      end
    end
  end
}
