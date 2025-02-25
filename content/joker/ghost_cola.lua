SMODS.Joker {
  key = 'ghost_cola',
  config = {},
  rarity = 2,
  pos = { x = 5, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  blueprint_compat = false,
  eternal_compat = false,
  yes_pool_flag = "ghost_cola_can_spawn",
  pools = {
    Food = true
  },
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_negative

    return {
      vars = {
        localize { type = 'name_text', set = 'Tag', key = 'tag_negative', nodes = {} },
      }
    }
  end,

  calculate = function(self, card, context)
    if context.selling_self then
      -- Adds the negative tag
      PB_UTIL.add_tag('tag_negative', true)

      -- Creates the negative spectral card
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = (function()
          local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'sea')
          local edition = { negative = true }
          card:set_edition(edition, true)
          card:add_to_deck()
          G.consumeables:emplace(card)
          return true
        end
        )
      }))

      -- Make Ghost Cola extinct
      G.GAME.pool_flags.ghost_cola_can_spawn = false

      return nil, true
    end
  end,
}


-- Allows Ghost Cola to spawn on Diet Cola sold
local calculate_joker_ref = Card.calculate_joker
function Card:calculate_joker(context)
  local ret, ret2 = calculate_joker_ref(self, context)

  if self.ability.set == "Joker" and not self.debuff then
    if context.selling_self then
      if self.ability.name == 'Diet Cola' then
        G.GAME.pool_flags.ghost_cola_can_spawn = true
      end
    end
  end

  return ret, ret2
end

--------------------------------------------------
