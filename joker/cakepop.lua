SMODS.Joker {
  key = "cakepop",
  config = {
    extra = {
      mult = 5,
      odds = 6
    }
  },
  rarity = 2,
  pos = { x = 0, y = 3 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  yes_pool_flag = "cakepop_can_spawn",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    -- Give the mult during play if card is a Heart
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Hearts") then
        return {
          mult = 5,
          card = card
        }
      end
    end

    -- Check if the Joker needs to be eaten
    if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
      if pseudorandom("Cakepop") < G.GAME.probabilities.normal / card.ability.extra.odds then
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
                -- card = nil

                -- Remove Cakepop from the pool
                G.GAME.pool_flags.cakepop_can_spawn = false

                -- Create Popsicle Stick
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                  local jokers_to_create = math.min(1,
                    G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                  G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create

                  G.E_MANAGER:add_event(Event({
                    func = function()
                      local card = create_card('Joker', G.jokers, nil, 0, nil, nil,
                        'j_paperback_pop_stick', nil)
                      card:add_to_deck()
                      G.jokers:emplace(card)
                      card:start_materialize()
                      G.GAME.joker_buffer = 0
                      return true
                    end
                  }))
                end
                return true;
              end
            }))
            return true
          end
        }))

        return {
          message = localize('k_eaten_ex'),
          colour = G.C.MULT,
          card = card
        }
      else
        return {
          message = localize('k_safe_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      end
    end
  end
}
