SMODS.Joker {
  key = 'grand_strategy',
  config = {
    extra = {
      xMult = 4,
      card_modifiers_required = 7,
    }
  },
  rarity = 3,
  pos = { x = 5, y = 5 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local unique_specials = PB_UTIL.special_cards_in_deck()

    return {
      vars = {
        card.ability.extra.xMult,
        card.ability.extra.card_modifiers_required,
        unique_specials
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      if PB_UTIL.special_cards_in_deck() >= card.ability.extra.card_modifiers_required then
        return {
          message = localize { type = "variable", key = 'a_xmult', vars = { card.ability.extra.xMult } },
          Xmult_mod = card.ability.extra.xMult,
          card = card
        }
      end
    end
  end,
}

-- Returns a table of all the unique special effects in the deck
PB_UTIL.special_cards_in_deck = function()
  local enhancements, editions, seals = {}, {}, {}

  if G.playing_cards then
    for _, v in pairs(G.playing_cards) do
      -- Check for an enhancement
      for k, _ in pairs(SMODS.get_enhancements(v)) do
        PB_UTIL.add_unique_value(enhancements, k)
      end

      -- Check for an edition
      if v.edition then
        PB_UTIL.add_unique_value(editions, v.edition.type)
      end

      -- Check for a seal
      if v.Mid.seal then
        PB_UTIL.add_unique_value(seals, v.Mid.seal)
      end
    end
  end

  local total =
      (enhancements and #enhancements or 0)
      + (editions and #editions or 0)
      + (seals and #seals or 0)

  return total
end

PB_UTIL.add_unique_value = function(tbl, value)
  for _, v in pairs(tbl) do
    if v == value then
      return
    end
  end

  table.insert(tbl, value)
end
