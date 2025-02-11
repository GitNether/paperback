PB_UTIL = {}

-- Load mod config
PB_UTIL.config = SMODS.current_mod.config

-- Initialize Food pool if not existing, which may be created by other mods.
-- Any joker can add itself to this pool by adding a pools table to its definition
-- Credits to Cryptid for the idea
if not SMODS.ObjectTypes.Food then
  SMODS.ObjectType {
    key = 'Food',
    default = 'j_egg',
    cards = {},
    inject = function(self)
      SMODS.ObjectType.inject(self)
      -- Insert base game food jokers
      self:inject_card(G.P_CENTERS.j_gros_michel)
      self:inject_card(G.P_CENTERS.j_egg)
      self:inject_card(G.P_CENTERS.j_ice_cream)
      self:inject_card(G.P_CENTERS.j_cavendish)
      self:inject_card(G.P_CENTERS.j_turtle_bean)
      self:inject_card(G.P_CENTERS.j_diet_cola)
      self:inject_card(G.P_CENTERS.j_popcorn)
      self:inject_card(G.P_CENTERS.j_ramen)
      self:inject_card(G.P_CENTERS.j_selzer)
    end
  }
end

function PB_UTIL.is_food(card)
  -- Accepts a key, a center or a card
  local key = (type(card) == "string" and card) or (card.key and card.key) or card.config.center_key

  if key then
    for _, v in ipairs(G.P_CENTER_POOLS.Food) do
      if v.key == key then return true end
    end
  end
end

-- Gets all the food jokers in the G.jokers card area
function PB_UTIL.get_owned_food()
  local res = {}

  if G.jokers then
    for _, v in ipairs(G.jokers.cards) do
      if PB_UTIL.is_food(v) then
        res[#res + 1] = v
      end
    end
  end

  return res
end

-- Define light and dark suits
PB_UTIL.light_suits = { 'Diamonds', 'Hearts' }
PB_UTIL.dark_suits = { 'Spades', 'Clubs' }

-- Add Crowns and Stars if enabled
if PB_UTIL.config.suits_enabled then
  table.insert(PB_UTIL.light_suits, 'paperback_Stars')
  table.insert(PB_UTIL.dark_suits, 'paperback_Crowns')
end

PB_UTIL.base_poker_hands = {
  "Straight Flush",
  "Four of a Kind",
  "Full House",
  "Flush",
  "Straight",
  "Three of a Kind",
  "Two Pair",
  "Pair",
  "High Card"
}

PB_UTIL.base_ranks = {
  "Ace",
  "King",
  "Queen",
  "Jack",
  "10",
  "9",
  "8",
  "7",
  "6",
  "5",
  "4",
  "3",
  "2"
}

PB_UTIL.base_rarities = {
  "Common",
  "Uncommon",
  "Rare",
  "Legendary"
}

-- Register a list of items in custom order
function PB_UTIL.register_items(items, path)
  for i = 1, #items do
    local status, err = pcall(function()
      return NFS.load(SMODS.current_mod.path .. "/" .. path .. "/" .. items[i] .. ".lua")()
    end)
    sendDebugMessage("Loaded item " .. path .. ":" .. items[i], "Paperback")

    -- If a file didn't load correctly, display the file in question and return
    if not status then
      error(items[i] .. ": " .. err)
    end
  end
end

-- Creates the flags
local BackApply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
  BackApply_to_run_ref(arg_56_0)
  G.GAME.pool_flags.quick_fix_can_spawn = true
  G.GAME.pool_flags.soft_taco_can_spawn = false
  G.GAME.pool_flags.ghost_cola_can_spawn = false
  G.GAME.pool_flags.dreamsicle_can_spawn = true
  G.GAME.pool_flags.cakepop_can_spawn = true
  G.GAME.pool_flags.caramel_apple_can_spawn = true
  G.GAME.pool_flags.charred_marshmallow_can_spawn = true
  G.GAME.pool_flags.rock_candy_can_spawn = true
  G.GAME.pool_flags.tanghulu_can_spawn = true
  G.GAME.pool_flags.sticks_can_spawn = false
  G.GAME.pool_flags.paperback_alert_can_spawn = true
  G.GAME.pool_flags.paperback_legacy_can_spawn = false

  G.P_CENTERS['j_diet_cola']['no_pool_flag'] = 'ghost_cola_can_spawn'
end

-- set_cost hook for zeroing out a sell value
local set_cost_ref = Card.set_cost
function Card.set_cost(self)
  if G.STAGE == G.STAGES.RUN and self.added_to_deck then
    -- If this card is Union Card, set sell cost to 0
    if self.config.center.key == "j_paperback_union_card" then
      self.sell_cost = 0
      return
    end

    if next(SMODS.find_card("j_paperback_union_card")) then
      self.sell_cost = 0
      return
    end
  end

  -- Don't calculate the original sell_cost calculation if a custom sell_cost increase has been indicated
  if self.custom_sell_cost then
    self.sell_cost = self.sell_cost + (self.custom_sell_cost_increase or 0)
    self.custom_sell_cost_increase = nil
  else
    set_cost_ref(self)
  end

  -- if trying to set the sell cost to zero, set it to zero
  if self.zero_sell_cost then
    self.sell_cost = 0
    self.custom_sell_cost = true
    self.zero_sell_cost = nil
  end
end

-- Add new context that happens before triggering tags
local yep_ref = Tag.yep
function Tag.yep(self, message, _colour, func)
  SMODS.calculate_context({
    paperback = {
      using_tag = true,
      tag = self
    }
  })

  return yep_ref(self, message, _colour, func)
end

-- Add new context that happens after destroying jokers
local remove_ref = Card.remove
function Card.remove(self)
  -- Check that the card being removed is a joker that's in the player's deck and that it's not being sold
  if self.added_to_deck and self.ability.set == 'Joker' and not G.CONTROLLER.locks.selling_card then
    SMODS.calculate_context({
      paperback = {
        destroying_joker = true,
        destroyed_joker = self
      }
    })
  end

  return remove_ref(self)
end

-- Add new context that happens when pressing the cash out button
local cash_out_ref = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
  SMODS.calculate_context({
    paperback = {
      cashing_out = true
    }
  })

  cash_out_ref(e)
end

-- Adds a new context for leveling up a hand
local level_up_hand_ref = level_up_hand
function level_up_hand(card, hand, instant, amount)
  local ret = level_up_hand_ref(card, hand, instant, amount)

  SMODS.calculate_context({
    paperback = {
      level_up_hand = true
    }
  })

  return ret
end

function PB_UTIL.get_complete_suits(vanilla_ranks)
  if not G.playing_cards then return 0 end

  local deck = {}
  local amount = 0

  for k, v in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(v) then
      deck[v.base.suit] = deck[v.base.suit] or {}
      deck[v.base.suit][v.base.value] = true
    end
  end

  for _, deck_ranks in pairs(deck) do
    local res = true

    for k, v in pairs(vanilla_ranks and PB_UTIL.base_ranks or SMODS.Ranks) do
      if not deck_ranks[vanilla_ranks and v or k] then
        res = false
      end
    end

    amount = amount + (res and 1 or 0)
  end

  return amount
end

function PB_UTIL.modify_sell_value(card, amount)
  if not card.set_cost or amount == 0 then return end

  if card.custom_sell_cost then
    card.custom_sell_cost_increase = amount
  else
    card.ability.extra_value = (card.ability.extra_value or 0) + amount
  end

  card:set_cost()
end

function PB_UTIL.calculate_stick_xMult(card)
  local xMult = card.ability.extra.xMult

  -- Only calculate the xMult if the G.jokers cardarea exists
  if G.jokers and G.jokers.cards then
    for k, current_card in pairs(G.jokers.cards) do
      if current_card ~= card and string.match(string.lower(current_card.ability.name), "%f[%w]stick%f[%W]") then
        xMult = xMult + card.ability.extra.xMult
      end
    end
  end

  return xMult
end

-- Gets the number of unique suits in a scoring hand
function PB_UTIL.get_unique_suits(scoring_hand)
  -- Initialize the suits table
  local suits = {}

  for k, v in pairs(SMODS.Suits) do
    suits[k] = 0
  end

  -- Check for unique suits in scoring_hand
  for i = 1, #scoring_hand do
    local scoring_card = scoring_hand[i]

    for scoring_suit, _ in pairs(suits) do
      if suits[scoring_suit] == 0 and scoring_card:is_suit(scoring_suit, true) then
        suits[scoring_suit] = 1

        -- Stop checking other suits if it's a Wild Card
        if scoring_card.ability.name == 'Wild Card' then
          break
        end
      end
    end
  end

  local unique_suits = 0

  for _, v in pairs(suits) do
    unique_suits = unique_suits + v
  end

  return unique_suits
end

function PB_UTIL.is_in_your_collection(card)
  if not G.your_collection then return false end
  for i = 1, 3 do
    if (G.your_collection[i] and card.area == G.your_collection[i]) then return true end
  end
  return false
end

-- Adds a booster pack with the specified key to the shop
-- Does nothing if the shop doesn't exist
function PB_UTIL.add_booster_pack(key)
  if not G.shop then return end

  -- Create the pack the same way vanilla game does it
  local pack = Card(
    G.shop_booster.T.x + G.shop_booster.T.w / 2,
    G.shop_booster.T.y,
    G.CARD_W * 1.27, G.CARD_H * 1.27,
    G.P_CARDS.empty,
    G.P_CENTERS[key],
    { bypass_discovery_center = true, bypass_discovery_ui = true }
  )

  -- Create the price tag above the pack
  create_shop_card_ui(pack, 'Booster', G.shop_booster)

  -- Add the pack to the shop
  pack:start_materialize()
  G.shop_booster:emplace(pack)
end

-- Gets a pseudorandom tag from the Tag pool
function PB_UTIL.poll_tag(seed)
  -- This part is basically a copy of how the base game does it
  -- Look at get_next_tag_key in common_events.lua
  local pool = get_current_pool('Tag')
  local tag_key = pseudorandom_element(pool, pseudoseed(seed))

  while tag_key == 'UNAVAILABLE' do
    tag_key = pseudorandom_element(pool, pseudoseed(seed))
  end

  local tag = Tag(tag_key)

  -- The way the hand for an orbital tag in the base game is selected could cause issues
  -- with mods that modify blinds, so we randomly pick one from all visible hands
  if tag_key == "tag_orbital" then
    local available_hands = {}

    for k, hand in pairs(G.GAME.hands) do
      if hand.visible then
        available_hands[#available_hands + 1] = k
      end
    end

    tag.ability.orbital_hand = pseudorandom_element(available_hands, pseudoseed(seed .. '_orbital'))
  end

  return tag
end

-- Gets a psuedorandom consumable from the Consumables pool (Soul and Black Hole included)
function PB_UTIL.poll_consumable(seed, soulable)
  local types = {}

  for k, v in pairs(SMODS.ConsumableTypes) do
    types[#types + 1] = k
  end

  return SMODS.create_card {
    set = pseudorandom_element(types, pseudoseed(seed)),
    area = G.consumables,
    soulable = soulable,
    key_append = seed,
  }
end

-- This is used for jokers that need to destroy cards outside
-- of the "destroy_card" context
function PB_UTIL.destroy_playing_cards(destroyed_cards, card, effects)
  G.E_MANAGER:add_event(Event({
    func = function()
      -- Show a message on the card at the same time the playing cards are
      -- being destroyed
      if #destroyed_cards > 0 and type(effects) == 'table' then
        effects.sound = 'tarot1'
        effects.instant = true
        SMODS.calculate_effect(effects, card)
      end

      -- Destroy every card
      for _, v in ipairs(destroyed_cards) do
        if SMODS.shatters(v) then
          v:shatter()
        else
          v:start_dissolve()
        end
      end

      G.E_MANAGER:add_event(Event {
        func = function()
          SMODS.calculate_context({
            remove_playing_cards = true,
            removed = destroyed_cards
          })
          return true
        end
      })

      return true
    end
  }))

  -- Mark the cards as destroyed
  for _, v in ipairs(destroyed_cards) do
    if SMODS.shatters(v) then
      v.shattered = true
    else
      v.destroyed = true
    end
  end
end

function PB_UTIL.destroy_joker(card, after)
  G.E_MANAGER:add_event(Event({
    func = function()
      play_sound('tarot1')
      card.T.r = -0.2
      card:juice_up(0.3, 0.4)
      card.states.drag.is = true
      card.children.center.pinch.x = true
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        blockable = false,
        func = function()
          G.jokers:remove_card(card)
          card:remove()

          if after and type(after) == "function" then
            after()
          end

          return true
        end
      }))
      return true
    end
  }))
end

-- This function is basically a copy of how the base game does the flipping
-- animation on playing cards when using a consumable that modifies them
function PB_UTIL.use_consumable_animation(card, cards_to_flip, action)
  -- If it's not a list, make it one
  if cards_to_flip and not cards_to_flip[1] then
    cards_to_flip = { cards_to_flip }
  end

  G.E_MANAGER:add_event(Event {
    trigger = 'after',
    delay = 0.4,
    func = function()
      play_sound('tarot1')
      card:juice_up(0.3, 0.5)
      return true
    end
  })

  if cards_to_flip then
    for i = 1, #cards_to_flip do
      local c = cards_to_flip[i]
      local percent = 1.15 - (i - 0.999) / (#cards_to_flip - 0.998) * 0.3

      G.E_MANAGER:add_event(Event {
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('card1', percent)
          c:juice_up(0.3, 0.3)
          return true
        end
      })
    end

    delay(0.2)
  end

  G.E_MANAGER:add_event(Event {
    trigger = 'after',
    delay = '0.1',
    func = function()
      if action and type(action) == "function" then
        action()
      end
      return true
    end
  })

  if cards_to_flip then
    for i = 1, #cards_to_flip do
      local c = cards_to_flip[i]
      local percent = 0.85 + (i - 0.999) / (#cards_to_flip - 0.998) * 0.3

      G.E_MANAGER:add_event(Event {
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('tarot2', percent, 0.6)
          c:juice_up(0.3, 0.3)
          return true
        end
      })
    end
  end

  G.E_MANAGER:add_event(Event {
    trigger = 'after',
    delay = 0.2,
    func = function()
      G.hand:unhighlight_all()
      return true
    end
  })

  if cards_to_flip then
    delay(0.5)
  end
end

PB_UTIL.forgery_valid_effects = {
  -- The list of all effects can be found in smods/src/utils.lua:1121
  'chips', 'h_chips', 'chip_mod',
  'x_chips', 'xchips', 'Xchip_mod',
  'mult', 'h_mult', 'mult_mod',
  'x_mult', 'Xmult', 'xmult', 'x_mult_mod', 'Xmult_mod'
}

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

function PB_UTIL.reset_find_jimbo(card)
  local valid_cards = {}

  for k, v in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(v) and not SMODS.has_no_rank(v) then
      valid_cards[#valid_cards + 1] = v
    end
  end

  if #valid_cards > 0 then
    local selected_card = pseudorandom_element(valid_cards, pseudoseed('find_jimbo'))
    card.ability.extra.rank = selected_card.base.value
    card.ability.extra.id = selected_card.base.id
    card.ability.extra.suit = selected_card.base.suit
  end
end

function PB_UTIL.reset_skydiver(card)
  local highest_rank = PB_UTIL.get_sorted_ranks()[1]
  card.ability.extra.lowest_rank = highest_rank.key
  card.ability.extra.lowest_id = highest_rank.id
end

function PB_UTIL.update_solar_system(card)
  local hands = G.GAME.hands

  -- set the minimum level to the first planet in the subset
  local min_level = hands[PB_UTIL.base_poker_hands[1]].level

  -- go through each hand, comparing them to the first hand in subset
  for _, hand in ipairs(PB_UTIL.base_poker_hands) do
    local current_hand = hands[hand]

    -- if the hand level is lower, set the minimum level to that value
    if current_hand.level < min_level then
      min_level = current_hand.level
    end
  end

  -- set the card's x_mult to a value depending on the minimum level
  card.ability.extra.x_mult = card.ability.extra.x_mult_mod * math.max(1, min_level)
end

-- Gets a sorted list of all ranks in descending order
function PB_UTIL.get_sorted_ranks()
  local ranks = {}

  for k, v in pairs(SMODS.Ranks) do
    ranks[#ranks + 1] = v
  end

  table.sort(ranks, function(a, b)
    return a.sort_nominal > b.sort_nominal
  end)

  return ranks
end

function PB_UTIL.get_rank_from_id(id)
  for k, v in pairs(SMODS.Ranks) do
    if v.id == id then return v end
  end
end

-- Returns whether the first rank is higher than the second
function PB_UTIL.compare_ranks(rank1, rank2, allow_equal)
  if type(rank1) ~= "table" then
    rank1 = PB_UTIL.get_rank_from_id(rank1)
  end

  if type(rank2) ~= "table" then
    rank2 = PB_UTIL.get_rank_from_id(rank2)
  end

  local comp = function(a, b)
    return allow_equal and (a >= b) or (a > b)
  end

  return comp(rank1.sort_nominal, rank2.sort_nominal)
end

-- Used to check whether a card is a light or dark suit
--- @param type 'light' | 'dark'
function PB_UTIL.is_suit(card, type)
  for _, v in ipairs(type == 'light' and PB_UTIL.light_suits or PB_UTIL.dark_suits) do
    if card:is_suit(v) then return true end
  end
end

-- Returns a table that can be inserted into info_queue to show all suits of the provided type
--- @param type 'light' | 'dark'
function PB_UTIL.suit_tooltip(type)
  local suits = type == 'light' and PB_UTIL.light_suits or PB_UTIL.dark_suits
  local key = 'paperback_' .. type .. '_suits'
  local colours = {}

  -- If any modded suits were loaded, we need to dynamically
  -- add them to the localization table
  if #suits > 2 then
    local text = {}
    local line = ""
    local text_parsed = {}

    for i = 1, #suits do
      local suit = suits[i]

      colours[#colours + 1] = G.C.SUITS[suit] or G.C.IMPORTANT
      line = line .. "{V:" .. i .. "}" .. localize(suit, 'suits_plural') .. "{}"

      if i < #suits then
        line = line .. ", "
      end

      if #line > 30 then
        text[#text + 1] = line
        line = ""
      end
    end

    if #line > 0 then
      text[#text + 1] = line
    end

    for _, v in ipairs(text) do
      text_parsed[#text_parsed + 1] = loc_parse_string(v)
    end

    G.localization.descriptions.Other[key].text = text
    G.localization.descriptions.Other[key].text_parsed = text_parsed
  end

  return {
    set = 'Other',
    key = key,
    vars = {
      colours = colours
    }
  }
end

-- Load modded suits
if (SMODS.Mods["Bunco"] or {}).can_load then
  local prefix = SMODS.Mods["Bunco"].prefix

  table.insert(PB_UTIL.light_suits, prefix .. '_Fleurons')
  table.insert(PB_UTIL.dark_suits, prefix .. '_Halberds')
end

return PB_UTIL
