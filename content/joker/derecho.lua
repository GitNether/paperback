SMODS.Joker {
  key = 'derecho',
  config = {
    extra = {
      x_mult_mod = 0.1,
      x_mult = 1
    }
  },
  rarity = 2,
  pos = { x = 0, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')

    return {
      vars = {
        card.ability.extra.x_mult_mod,
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    -- Upgrade the Joker when hand is played
    if context.before and context.main_eval and not context.blueprint then
      for _, v in ipairs(context.scoring_hand) do
        if not SMODS.has_any_suit(v) and PB_UTIL.is_suit(v, 'light') then
          return
        end
      end

      card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod

      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MULT,
        card = card
      }
    end

    -- Give the xMult during play
    if context.joker_main and card.ability.extra.x_mult ~= 1 then
      return {
        x_mult = card.ability.extra.x_mult,
        card = card,
      }
    end
  end

}
