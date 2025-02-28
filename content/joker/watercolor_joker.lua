SMODS.Joker {
  key = "watercolor_joker",
  config = {
    extra = {
      enhancement = "m_paperback_soaked",
      xChips = 1.5,
    }
  },
  rarity = 2,
  pos = { x = 7, y = 9 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,
  paperback = {
    requires_enhancements = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]

    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        },
        card.ability.extra.xChips,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, card.ability.extra.enhancement) then
        return {
          xchips = card.ability.extra.xChips,
        }
      end
    end
  end
}
