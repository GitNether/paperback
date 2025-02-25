SMODS.Joker {
  key = "furioso",
  config = {
    extra = {
      x_mult_mod = 0.2,
      x_mult = 1,
      ranks = {}
    }
  },
  rarity = 2,
  pos = { x = 2, y = 0 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    local ranks_played = ""

    for k, v in pairs(card.ability.extra.ranks) do
      ranks_played = ranks_played .. " " .. localize(v, 'ranks')
    end

    if ranks_played == "" then
      ranks_played = " " .. localize('paperback_none')
    end

    return {
      vars = {
        card.ability.extra.x_mult_mod,
        card.ability.extra.x_mult,
        ranks_played
      }
    }
  end,

  calculate = function(self, card, context)
    -- Calculate the added x_mult depending on rank flags
    if context.individual and not context.blueprint and not context.repetition then
      if context.cardarea == G.play and not context.other_card.debuff then
        local rank = SMODS.has_no_rank(context.other_card) and nil or context.other_card:get_id()

        if rank and not card.ability.extra.ranks[rank] then
          card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
          card.ability.extra.ranks[rank] = context.other_card.base.value

          return {
            extra = { focus = card, message = localize('k_upgrade_ex'), colour = G.C.MULT },
            card = card,
          }
        end
      end
    end

    -- Give the x_mult during play
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
        card = card
      }
    end

    -- If boss blind defeated, reset all rank flags and reset x_mult
    if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
      card.ability.extra.ranks = {}
      card.ability.extra.x_mult = 1

      return {
        message = localize('k_reset'),
        colour = G.C.RED
      }
    end
  end
}
