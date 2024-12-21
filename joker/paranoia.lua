SMODS.Joker {
  key = 'paranoia',
  loc_txt = {
    name = "Paranoia",
    text = {
      "After scoring a hand, destroy all {C:dark_suit}dark{} suits played",
      "and all {C:light_suit}light suits held in hand"
    }
  },
  rarity = 3,
  pos = { x = 6, y = 3 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  calculate = function(self, card, context)
    if not context.blueprint then
      if context.after and not (context.repetition or context.individual) then
        -- Loop through each card in scoring_hand and check if it is a dark suit
        for _, v in pairs(context.scoring_hand) do
          -- If it is a dark suit, destroy that card
          if v:is_suit("Spades") or v:is_suit("Clubs") or v.ability.name == "Wild Card" then
            v.getting_sliced = true
            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.2,
              func = function()
                if v.ability.name == 'Glass Card' then
                  v:shatter()
                else
                  v:start_dissolve()
                end
                return true
              end
            }))
          end
        end
      end
    end
  end
}

G.C.DARK_SUIT = HEX('324975')
G.C.LIGHT_SUIT = HEX('f05250')
