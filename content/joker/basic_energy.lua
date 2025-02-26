SMODS.Joker {
  key = "basic_energy",
  config = {
    extra = {
      odds = 5
    }
  },
  rarity = 2,
  pos = { x = 1, y = 6 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    -- Check that the card being consumed is not a copy made by this joker
    if context.using_consumeable and not context.consumeable.ability.paperback_energized then
      if pseudorandom("basic_energy") < G.GAME.probabilities.normal / card.ability.extra.odds then
        G.E_MANAGER:add_event(Event({
          func = function()
            if #G.consumeables.cards < G.consumeables.config.card_limit then
              -- Copy the card and mark it as a copy of this joker
              local copy = copy_card(context.consumeable)
              copy.ability.paperback_energized = true
              copy:add_to_deck()
              G.consumeables:emplace(copy)

              -- Display a copy message, using the color of the set of the card being copied if it exists
              -- otherwise just green
              SMODS.calculate_effect({
                message = localize("paperback_copy_ex"),
                colour = G.C.SECONDARY_SET[context.consumeable.ability.set] or G.C.GREEN
              }, context.blueprint_card or card)
            end
            return true
          end
        }))

        return nil, true
      end
    end
  end
}
