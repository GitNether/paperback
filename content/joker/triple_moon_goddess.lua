if PB_UTIL.config.minor_arcana_enabled then
  SMODS.Joker {
    key = 'triple_moon_goddess_minor_arcana',
    config = {
      extra = {
        tarot_odds = 3,
        minor_arcana_odds = 6
      }
    },
    rarity = 2,
    pos = { x = 5, y = 4 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          G.GAME.probabilities.normal,
          card.ability.extra.tarot_odds,
          card.ability.extra.minor_arcana_odds
        }
      }
    end,

    calculate = function(self, card, context)
      if context.before and context.main_eval and next(context.poker_hands["Three of a Kind"]) then
        local eff_card = context.blueprint_card or card

        -- Tarot spawn
        local roll = pseudorandom('triple_moon_goddess_tarot')
        if roll < G.GAME.probabilities.normal / card.ability.extra.tarot_odds then
          PB_UTIL.try_spawn_card({ set = 'Tarot' }, function()
            SMODS.calculate_effect {
              message = localize('k_plus_tarot'),
              colour = G.C.SECONDARY_SET.Tarot,
              card = eff_card
            }
          end)
        end

        -- Minor Arcana spawn
        roll = pseudorandom('triple_moon_goddess_minor_arcana')
        if roll < G.GAME.probabilities.normal / card.ability.extra.minor_arcana_odds then
          PB_UTIL.try_spawn_card({ set = 'paperback_minor_arcana' }, function()
            SMODS.calculate_effect {
              message = localize('paperback_plus_minor_arcana'),
              colour = G.C.PAPERBACK_MINOR_ARCANA,
              card = eff_card
            }
          end)
        end
      end
    end
  }
else
  SMODS.Joker {
    key = 'triple_moon_goddess',
    config = {
      extra = {
        planet_odds = 3,
        tarot_odds = 3,
      }
    },
    rarity = 2,
    pos = { x = 5, y = 4 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          G.GAME.probabilities.normal,
          card.ability.extra.planet_odds,
          card.ability.extra.tarot_odds
        }
      }
    end,

    calculate = function(self, card, context)
      if context.before and context.main_eval and next(context.poker_hands["Three of a Kind"]) then
        local eff_card = context.blueprint_card or card

        -- Check if planet card is generated and there is enough space in the consumeables area
        local roll = pseudorandom("Triple Moon Goddess (Planet)")
        if roll < G.GAME.probabilities.normal / card.ability.extra.planet_odds then
          PB_UTIL.try_spawn_card({ set = 'Planet' }, function()
            SMODS.calculate_effect {
              message = localize('k_plus_planet'),
              colour = G.C.SECONDARY_SET.Planet,
              card = eff_card
            }
          end)
        end

        -- Check if a tarot card is generated and there is enough space in the consumeables area
        roll = pseudorandom("Triple Moon Goddess (Tarot)")
        if roll < G.GAME.probabilities.normal / card.ability.extra.tarot_odds then
          PB_UTIL.try_spawn_card({ set = 'Tarot' }, function()
            SMODS.calculate_effect {
              message = localize('k_plus_tarot'),
              colour = G.C.SECONDARY_SET.Tarot,
              card = eff_card
            }
          end)
        end
      end
    end
  }
end
