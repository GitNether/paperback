SMODS.Joker {
  key = 'weather_radio',
  config = {
    extra = {
      x_mult = 1,
      a_xmult = 0.5,
      xmult_disable = 3,
      xmult_penalty = 2
    }
  },
  rarity = 3,
  pos = { x = 6, y = 10 },
  atlas = 'jokers_atlas',
  cost = 9,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local hand = G.GAME.current_round.paperback_weather_radio_hand

    return {
      vars = {
        card.ability.extra.a_xmult,
        localize(hand or 'High Card', 'poker_hands'),
        card.ability.extra.xmult_disable,
        card.ability.extra.xmult_penalty,
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.before then
      if next(context.poker_hands[G.GAME.current_round.paperback_weather_radio_hand]) then
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.a_xmult

        if G.GAME.blind.boss and not G.GAME.blind.disabled and card.ability.extra.x_mult >= card.ability.extra.xmult_disable then
          card.ability.extra.x_mult = card.ability.extra.x_mult - card.ability.extra.xmult_penalty

          return {
            message = localize('ph_boss_disabled'),
            func = function()
              G.GAME.blind:disable()
            end
          }
        end

        return {
          message = localize {
            type = 'variable',
            key = 'a_xmult',
            vars = { card.ability.extra.x_mult }
          },
          colour = G.C.MULT
        }
      end
    end

    if not context.blueprint and context.first_hand_drawn and G.GAME.blind.boss and not G.GAME.blind.disabled then
      if card.ability.extra.x_mult >= card.ability.extra.xmult_disable then
        card.ability.extra.x_mult = card.ability.extra.x_mult - card.ability.extra.xmult_penalty

        G.GAME.blind:disable()

        return {
          message = localize('ph_boss_disabled')
        }
      end
    end

    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end
}

function PB_UTIL.reset_weather_radio()
  local hands = {}
  for k, v in pairs(G.GAME.hands) do
    if v.visible then hands[#hands + 1] = k end
  end
  local hand = pseudorandom_element(hands, pseudoseed("weather_radio"))
  G.GAME.current_round.paperback_weather_radio_hand = hand
end
