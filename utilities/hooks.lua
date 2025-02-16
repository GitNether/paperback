---@diagnostic disable: duplicate-set-field, lowercase-global
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
  if self.ability.custom_sell_cost then
    self.sell_cost = self.sell_cost + (self.ability.custom_sell_cost_increase or 0)
    self.ability.custom_sell_cost_increase = nil
  else
    set_cost_ref(self)
  end

  -- if trying to set the sell cost to zero, set it to zero
  if self.zero_sell_cost then
    self.sell_cost = 0
    self.ability.custom_sell_cost = true
    self.zero_sell_cost = nil
  end
end

-- Draws a debuffed shader on top of cards in your collection if they are disabled
-- as a consequence of a certain setting being disabled in our config
local draw_ref = Card.draw
function Card.draw(self, layer)
  local ret = draw_ref(self, layer)

  if not self.debuff and self.area and self.area.config and self.area.config.collection then
    local config = self.config and self.config.center and self.config.center.paperback or {}
    local disabled = false

    for _, v in ipairs(config.requirements or {}) do
      if not PB_UTIL.config[v.setting] then
        disabled = true
        break
      end
    end

    if disabled then
      self.children.center:draw_shader('debuff', nil, self.ARGS.send_to_shader)
    end
  end

  return ret
end

-- Count scored Clips each round
local eval_card_ref = eval_card
function eval_card(card, context)
  local ret, ret2 = eval_card_ref(card, context)

  if context.cardarea == G.play and context.main_scoring and ret and ret.playing_card and PB_UTIL.has_paperclip(card) then
    G.GAME.current_round.paperback_scored_clips = G.GAME.current_round.paperback_scored_clips + 1
  end

  return ret, ret2
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
