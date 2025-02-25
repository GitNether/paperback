SMODS.Joker {
  key = "forgery",
  rarity = 3,
  config = {
    extra = {
      copying = nil,
      max_multiplier = 1.5,
      multiplier = 1
    }
  },
  pos = { x = 2, y = 1 },
  atlas = 'jokers_atlas',
  cost = 2,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,

  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and G.jokers then
      local keys = {}

      for _, v in ipairs(G.jokers.cards) do
        if keys[v.config.center_key] then return true end

        keys[v.config.center_key] = true
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    local copying = card.ability.extra.copying

    return {
      vars = {
        card.ability.extra.max_multiplier - 1,
        card.ability.extra.max_multiplier,
        copying and G.localization.descriptions.Joker[copying].name or localize('paperback_none'),
        card.ability.extra.multiplier
      }
    }
  end,

  generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    -- When this joker is in the shop, show the name and description of the basic Joker
    local in_shop = card.area and card.area.config.type == 'shop'
    local key = in_shop and 'j_joker' or self.key
    local vars = in_shop and { G.P_CENTERS.j_joker.config.mult } or self:loc_vars(info_queue, card).vars

    self.no_main_mod_badge = in_shop

    full_UI_table.name = localize {
      type = 'name',
      key = key,
      set = 'Joker',
    }

    localize {
      type = 'descriptions',
      key = key,
      set = 'Joker',
      nodes = desc_nodes,
      vars = vars
    }
  end,

  set_card_type_badge = function(self, card, badges)
    -- When this joker is in the shop, show Common rarity
    local in_shop = card.area and card.area.config.type == 'shop'

    badges[#badges + 1] = create_badge(
      localize(in_shop and 'k_common' or 'k_rare'),
      in_shop and G.C.CHIPS or G.C.MULT,
      G.C.WHITE,
      1.2
    )
  end,

  set_ability = function(self, card, initial, delay_sprites)
    if G.STAGE == G.STAGES.RUN then
      PB_UTIL.reset_forgery(card)
    end
  end,

  calculate = function(self, card, context)
    local ret = nil

    if card.ability.extra.copying then
      local jokers = SMODS.find_card(card.ability.extra.copying)
      local other_joker = pseudorandom_element(jokers, pseudoseed("forgery_dupes"))

      -- This part is a copy of how the base game does it
      if other_joker and not context.no_blueprint then
        context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
        context.blueprint_card = context.blueprint_card or card

        if context.blueprint > #G.jokers.cards + 1 then return end

        local other_joker_ret = other_joker:calculate_joker(context)
        local eff_card = context.blueprint_card or card
        context.blueprint = nil
        context.blueprint_card = nil

        if other_joker_ret then
          other_joker_ret.card = eff_card

          -- Multiply the returned effects if they're mult, xmult or chips
          for k, v in pairs(other_joker_ret) do
            if PB_UTIL.is_valid_forgery_effect(k) and type(v) == "number" then
              PB_UTIL.modify_forgery_effect(card, k, v, other_joker_ret)
            end
          end

          ret = other_joker_ret
        end
      elseif not other_joker then
        card.ability.extra.copying = nil
      end
    end

    -- Swaps the copied card after a hand is played, showing a reset message
    if not context.blueprint and context.after and context.cardarea == G.jokers then
      PB_UTIL.reset_forgery(card)

      SMODS.calculate_effect({
        message = localize('k_reset')
      }, card)
    end

    return ret
  end
}

PB_UTIL.forgery_valid_effects = {
  -- The list of all effects can be found in smods/src/utils.lua:1121
  'chips', 'h_chips', 'chip_mod',
  'x_chips', 'xchips', 'Xchip_mod',
  'mult', 'h_mult', 'mult_mod',
  'x_mult', 'Xmult', 'xmult', 'x_mult_mod', 'Xmult_mod'
}

PB_UTIL.forgery_mod_effects = {
  chip_mod = 'chips',
  Xchip_mod = 'x_chips',
  mult_mod = 'mult',
  x_mult_mod = 'x_mult',
  Xmult_mod = 'x_mult',
}

function PB_UTIL.modify_forgery_effect(card, key, value, effects)
  local eff_type = PB_UTIL.forgery_mod_effects[key]

  -- If the effect is a 'mod' effect
  if eff_type then
    -- Create what the message would look like
    local message = localize {
      type = 'variable',
      key = 'a_' .. eff_type .. (value < 0 and '_minus' or ''),
      vars = { value }
    }

    -- If the message sent by the other joker is the same as the expected one
    -- we remove it so the actual multiplied value will show instead of the
    -- original one
    if effects.message == message then
      effects.message = nil
    end

    -- Remove the 'mod' effect
    effects[key] = nil
  end

  effects[eff_type or key] = value * card.ability.extra.multiplier
end

function PB_UTIL.is_valid_forgery_effect(effect)
  for _, v in ipairs(PB_UTIL.forgery_valid_effects) do
    if v == effect then return true end
  end

  return false
end

function PB_UTIL.reset_forgery(card)
  -- Find a random owned joker that is blueprint compatible
  local eligible_jokers = {}

  for k, v in ipairs(G.jokers.cards) do
    if v ~= card and v.config.center.blueprint_compat then
      eligible_jokers[#eligible_jokers + 1] = v
    end
  end

  -- Select what multiplier to use for the effects of this joker
  card.ability.extra.multiplier = card.ability.extra.max_multiplier - pseudorandom("forgery_multiplier")

  -- Assign the key of the random joker to Forgery
  local joker = pseudorandom_element(eligible_jokers, pseudoseed("forgery"))
  card.ability.extra.copying = joker and joker.config.center_key or nil
end
