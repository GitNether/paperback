SMODS.Joker {
  key = "river",
  loc_txt = {
    name = "River",
    text = {
      "If played hand contains {C:attention}5 scoring cards{}",
      "earn the lowest scoring card's {C:chips}Chip Bonus{} as {C:money}money{}"
    }
  },
  rarity = 2,
  pos = { x = 4, y = 4 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  calculate = function(self, card, context)
    if context.before and not (context.individual or context.repetition) then
      -- Check if the scoring_hand contains five cards
      if #context.scoring_hand >= 5 then
        local lowest_card = nil
        if context.scoring_hand[1].ability.name ~= "Stone Card" then
          lowest_card = context.scoring_hand[1]
        end

        -- Find the lowest card in the scoring_hand
        for i = 2, #context.scoring_hand do
          local current_card = context.scoring_hand[i]

          if current_card.ability.name ~= "Stone Card" then
            if current_card.base.nominal < lowest_card.base.nominal then
              lowest_card = current_card
            end
          end
        end

        -- If the hand is not all rankless cards (Stone Cards), give the money
        if lowest_card then
          ease_dollars(lowest_card.base.nominal)
          return {
            message = localize("$") .. lowest_card.base.nominal,
            colour = G.C.MONEY,
            delay = 0.45,
            card = card
          }
        end
      end
    end
  end
}
