SMODS.Consumable {
  key = 'nine_of_cups',
  set = 'paperback_minor_arcana',
  config = {
    extra = {
      max_jokers = 1
    }
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 1, y = 1 },
  unlocked = true,
  discovered = true,

  can_use = function(self, card)
    -- Prevent changing eternal jokers
    if #G.jokers.highlighted == card.ability.extra.max_jokers then
      return not G.jokers.highlighted[1].ability.eternal
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.max_jokers
      }
    }
  end,

  use = function(self, card, area)
    local joker = G.jokers.highlighted[1]
    local rarity = joker.config.center.rarity

    if type(rarity) == "number" then
      if rarity < 3 then
        rarity = rarity + 1
      end

      rarity = PB_UTIL.base_rarities[rarity] or rarity
    end

    G.E_MANAGER:add_event(Event {
      trigger = 'after',
      delay = 0.4,
      func = function()
        card:juice_up()

        PB_UTIL.destroy_joker(joker, function()
          SMODS.add_card {
            set = 'Joker',
            rarity = rarity,
            edition = joker.edition
          }
        end)

        return true
      end
    })
  end
}
