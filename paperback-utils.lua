PB_UTIL = {}

-- message for the scoring of "Prince of Darkness"
G.localization.misc.v_dictionary.prince_of_darkness = { "+#1# Mult, +#2# Chips" }

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
  G.GAME.pool_flags.sticks_can_spawn = false

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
    self.sell_cost = self.sell_cost + (self.custom_sell_cost_increase or 1)
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

-- Add new context for destroying cards of any type (Used for Sacrificial Lamb)
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  if self.getting_sliced then
    for i = 1, #G.jokers.cards do
      G.jokers.cards[i]:calculate_joker({ destroying_cards = true, destroyed_card = self })
    end
  end

  start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
end

local remove_ref = Card.remove
function Card.remove(self)
  -- Check that the card being removed is a joker that's in the player's deck and that it's not being sold
  if self.added_to_deck and self.ability.set == 'Joker' and not G.CONTROLLER.locks.selling_card then
    for k, v in ipairs(G.jokers.cards) do
      -- Make sure the joker that triggers due to this card's removal is not being removed itself
      if not v.removed and not v.getting_sliced then
        if v.config.center_key == 'j_paperback_sacrificial_lamb' then
          v.ability.extra.mult = v.ability.extra.mult + v.ability.extra.mult_mod

          SMODS.eval_this(v, {
            message = localize {
              type = 'variable',
              key = 'a_mult',
              vars = { v.ability.extra.mult_mod }
            }
          })
        elseif v.config.center_key == 'j_paperback_unholy_alliance' then
          v.ability.extra.xMult = v.ability.extra.xMult + v.ability.extra.xMult_gain

          SMODS.eval_this(v, {
            message = localize {
              type = 'variable',
              key = 'a_xmult',
              vars = { v.ability.extra.xMult_gain }
            }
          })
        end
      end
    end
  end

  return remove_ref(self)
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

-- Gets the number of unique suits in a scoring hand
function PB_UTIL.get_unique_suits(scoring_hand)
  -- Initialize the suits table
  local suits = {
    ['Hearts'] = 0,
    ['Diamonds'] = 0,
    ['Spades'] = 0,
    ['Clubs'] = 0
  }

  -- Check for unique suits in scoring_hand
  for i = 1, #scoring_hand do
    local scoring_card = scoring_hand[i]
    for scoring_suit, _ in pairs(suits) do
      -- Check if the suit hasn't been matched yet
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

-- xChips functions from @PT_Cerlo on Discord
function PB_UTIL.xChips(amt, card)
  hand_chips = mod_chips(hand_chips * (amt or 1))
  update_hand_text(
    { delay = 0 },
    { chips = hand_chips }
  )
  PB_UTIL.card_eval_status_text(card, 'x_chips', amt, percent)
end

function PB_UTIL.card_eval_status_text(card, eval_type, amt, percent, dir, extra)
  percent = percent or (0.9 + 0.2 * math.random())
  if dir == 'down' then
    percent = 1 - percent
  end

  if extra and extra.focus then card = extra.focus end

  local text = ''
  local sound = nil
  local volume = 1
  local card_aligned = 'bm'
  local y_off = 0.15 * G.CARD_H
  if card.area == G.jokers or card.area == G.consumeables then
    y_off = 0.05 * card.T.h
  elseif card.area == G.hand then
    y_off = -0.05 * G.CARD_H
    card_aligned = 'tm'
  elseif card.area == G.play then
    y_off = -0.05 * G.CARD_H
    card_aligned = 'tm'
  elseif card.jimbo then
    y_off = -0.05 * G.CARD_H
    card_aligned = 'tm'
  end
  local config = {}
  local delay = 0.65
  local colour = config.colour or (extra and extra.colour) or (G.C.FILTER)
  local extrafunc = nil

  if eval_type == 'debuff' then
    sound = 'cancel'
    amt = 1
    colour = G.C.RED
    config.scale = 0.6
    text = localize('k_debuffed')
  elseif eval_type == 'chips' then
    sound = 'chips1'
    amt = amt
    colour = G.C.CHIPS
    text = localize { type = 'variable', key = 'a_chips', vars = { amt } }
    delay = 0.6
  elseif eval_type == 'mult' then
    sound = 'multhit1' --'other1'
    amt = amt
    text = localize { type = 'variable', key = 'a_mult', vars = { amt } }
    colour = G.C.MULT
    config.type = 'fade'
    config.scale = 0.7
  elseif (eval_type == 'x_mult') or (eval_type == 'h_x_mult') then
    sound = 'multhit2'
    volume = 0.7
    amt = amt
    text = localize { type = 'variable', key = 'a_xmult', vars = { amt } }
    colour = G.C.XMULT
    config.type = 'fade'
    config.scale = 0.7
  elseif eval_type == 'h_mult' then
    sound = 'multhit1'
    amt = amt
    text = localize { type = 'variable', key = 'a_mult', vars = { amt } }
    colour = G.C.MULT
    config.type = 'fade'
    config.scale = 0.7
  elseif eval_type == 'x_chips' then
    sound = 'chips1'
    amt = amt
    text = "X" .. amt .. " Chips"
    colour = G.C.CHIPS
    config.type = 'fade'
    config.scale = 0.7
  elseif eval_type == 'dollars' then
    sound = 'coin3'
    amt = amt
    text = (amt < -0.01 and '-' or '') .. localize("$") .. tostring(math.abs(amt))
    colour = amt < -0.01 and G.C.RED or G.C.MONEY
  elseif eval_type == 'swap' then
    sound = 'generic1'
    amt = amt
    text = localize('k_swapped_ex')
    colour = G.C.PURPLE
  elseif eval_type == 'extra' or eval_type == 'jokers' then
    sound = extra.edition and 'foil2' or extra.mult_mod and 'multhit1' or extra.Xmult_mod and 'multhit2' or
        'generic1'
    if extra.edition then
      colour = G.C.DARK_EDITION
    end
    volume = extra.edition and 0.3 or sound == 'multhit2' and 0.7 or 1
    delay = extra.delay or 0.75
    amt = 1
    text = extra.message or text
    if not extra.edition and (extra.mult_mod or extra.Xmult_mod) then
      colour = G.C.MULT
    end
    if extra.chip_mod then
      config.type = 'fall'
      colour = G.C.CHIPS
      config.scale = 0.7
    elseif extra.swap then
      config.type = 'fall'
      colour = G.C.PURPLE
      config.scale = 0.7
    else
      config.type = 'fall'
      config.scale = 0.7
    end
  end
  delay = delay * 1.25

  if amt > 0 or amt < 0 then
    if extra and extra.instant then
      if extrafunc then extrafunc() end
      attention_text({
        text = text,
        scale = config.scale or 1,
        hold = delay - 0.2,
        backdrop_colour = colour,
        align = card_aligned,
        major = card,
        offset = { x = 0, y = y_off }
      })
      play_sound(sound, 0.8 + percent * 0.2, volume)
      if not extra or not extra.no_juice then
        card:juice_up(0.6, 0.1)
        G.ROOM.jiggle = G.ROOM.jiggle + 0.7
      end
    else
      G.E_MANAGER:add_event(Event({ --Add bonus chips from this card
        trigger = 'before',
        delay = delay,
        func = function()
          if extrafunc then extrafunc() end
          attention_text({
            text = text,
            scale = config.scale or 1,
            hold = delay - 0.2,
            backdrop_colour = colour,
            align = card_aligned,
            major = card,
            offset = { x = 0, y = y_off }
          })
          play_sound(sound, 0.8 + percent * 0.2, volume)
          if not extra or not extra.no_juice then
            card:juice_up(0.6, 0.1)
            G.ROOM.jiggle = G.ROOM.jiggle + 0.7
          end
          return true
        end
      }))
    end
  end
  if extra and extra.playing_cards_created then
    playing_card_joker_effects(extra.playing_cards_created)
  end
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

-- If Cryptid is also loaded, add food jokers to pool for ://SPAGHETTI
if (SMODS.Mods["Cryptid"] or {}).can_load then
  table.insert(Cryptid.food, "j_paperback_cakepop")
  table.insert(Cryptid.food, "j_paperback_caramel_apple")
  table.insert(Cryptid.food, "j_paperback_charred_marshmallow")
  table.insert(Cryptid.food, "j_paperback_crispy_taco")
  table.insert(Cryptid.food, "j_paperback_dreamsicle")
  table.insert(Cryptid.food, "j_paperback_ghost_cola")
  table.insert(Cryptid.food, "j_paperback_joker_cookie")
  table.insert(Cryptid.food, "j_paperback_nachos")
  table.insert(Cryptid.food, "j_paperback_soft_taco")
  table.insert(Cryptid.food, "j_paperback_complete_breakfast")
  table.insert(Cryptid.food, "j_paperback_coffee")
end

return PB_UTIL
