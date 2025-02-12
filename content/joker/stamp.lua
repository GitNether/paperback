SMODS.Joker {
  key = "stamp",
  config = {
    extra = {
      chips = 0,
      chip_mod = 25,
      odds = 3
    }
  },
  rarity = 3,
  pos = { x = 8, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  -- Sets the sprite and hitbox
  set_ability = function(self, card, initial, delay_sprites)
    local w_scale, h_scale = 35 / 71, 45 / 95

    card.T.h = card.T.h * h_scale
    card.T.w = card.T.w * w_scale
  end,

  set_sprites = function(self, card, front)
    local w_scale, h_scale = 35 / 71, 45 / 95

    card.children.center.scale.y = card.children.center.scale.y * h_scale
    card.children.center.scale.x = card.children.center.scale.x * w_scale
  end,

  load = function(self, card, card_table, other_card)
    local w_scale, h_scale = 35 / 71, 45 / 95

    card.T.h = card.T.h * h_scale
    card.T.w = card.T.w * w_scale
  end,
  -----------------------------

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
        card.ability.extra.chip_mod,
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    -- Upgrades Joker if seal is played
    if context.individual and not context.blueprint then
      if context.cardarea == G.play then
        if context.other_card:get_seal() then
          -- Gives chips if roll succeeds
          if pseudorandom("Stamp") < G.GAME.probabilities.normal / card.ability.extra.odds then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            card_eval_status_text(card, 'extra', nil, nil, nil,
              { message = localize('k_upgrade_ex'), colour = G.C.CHIPS })
          end
        end
      end
    end

    -- Gives the chips during play
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end
}
