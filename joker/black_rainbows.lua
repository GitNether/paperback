SMODS.Joker {
  key = 'black_rainbows',
  loc_txt = {
    name = "Black Rainbows",
    text = {
      "Scored {C:spades}Spades{} and {C:clubs}Clubs{} have a",
      "{C:green}#1# in #2#{} chance to be made {C:polychrome}Polychrome{}",
    }
  },
  config = {
    extra = {
      odds = 11,
    }
  },
  rarity = 3,
  pos = { x = 7, y = 3 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome

    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") and not context.other_card.debuffed then
        if pseudorandom('black_rainbows') < G.GAME.probabilities.normal / card.ability.extra.odds then
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            func = function()
              context.other_card:set_edition({ polychrome = true }, true)
              return true
            end
          }))
        end
      end
    end
  end
}
