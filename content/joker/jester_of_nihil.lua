SMODS.Joker {
  key = "jester_of_nihil",
  config = {
    extra = {
      suit = 'Spades',
      debuff_mult = 5,
      mult = 0
    }
  },
  rarity = 3,
  pos = { x = 2, y = 6 },
  atlas = 'jokers_atlas',
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = false,

  set_ability = function(self, card, initial, delay_sprites)
    if G.STAGE == G.STAGES.RUN then
      -- When first created, check if the player already owns this joker
      local others = SMODS.find_card('j_paperback_jester_of_nihil')

      if #others > 0 then
        -- If they do, copy the suit of the other joker to this new one
        card.ability.extra.suit = others[1].ability.extra.suit
      else
        -- If they do not, select a random suit to debuff
        local cards = {}

        for k, v in ipairs(G.playing_cards) do
          if not SMODS.has_no_suit(v) then
            cards[#cards + 1] = v
          end
        end

        local selected = pseudorandom_element(cards, pseudoseed('jester_of_nihil'))

        if selected then
          card.ability.extra.suit = selected.base.suit
        end
      end
    end
  end,

  add_to_deck = function(self, card, from_debuff)
    -- Whenever this card is added to deck, update the debuffed
    -- status of all playing cards, this is mostly relevant when
    -- added in the middle of a blind
    for k, v in ipairs(G.playing_cards) do
      G.GAME.blind:debuff_card(v)
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = {
      set = 'Other',
      key = 'debuffed_playing_card'
    }

    return {
      vars = {
        card.ability.extra.debuff_mult,
        localize(card.ability.extra.suit, 'suits_plural'),
        card.ability.extra.mult,
        colours = { G.C.SUITS[card.ability.extra.suit] }
      }
    }
  end,

  update = function(self, card, dt)
    -- Update the mult this card gives by counting the amount of debuffed cards
    if G.playing_cards then
      local total = 0

      for k, v in ipairs(G.playing_cards) do
        if v.debuff then
          total = total + 1
        end
      end

      card.ability.extra.mult = math.max(0, total * card.ability.extra.debuff_mult)
    end
  end,

  calculate = function(self, card, context)
    -- If possible, swap suits after a hand is played
    if not context.blueprint and context.after and context.cardarea == G.jokers then
      local last_scored = nil

      -- Only consider the last card with a suit
      for i = #context.scoring_hand, 1, -1 do
        local c = context.scoring_hand[i]
        if not SMODS.has_no_suit(c) then
          last_scored = c
          break
        end
      end

      -- Only update the suit if it's a different suit
      if last_scored and last_scored.base.suit ~= card.ability.extra.suit then
        card.ability.extra.suit = last_scored.base.suit

        G.E_MANAGER:add_event(Event {
          func = function()
            -- Update the debuff of all playing cards when swapping suits
            for k, v in ipairs(G.playing_cards) do
              G.GAME.blind:debuff_card(v)
            end

            return true
          end
        })

        return {
          message = localize(card.ability.extra.suit, 'suits_plural'),
          colour = G.C.SUITS[card.ability.extra.suit]
        }
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end
}

-- We hook into the vanilla function used to update the debuffed status of cards
local debuff_card_ref = Blind.debuff_card
function Blind.debuff_card(self, card, from_blind)
  local ret = debuff_card_ref(self, card, from_blind)

  if card.area ~= G.jokers then
    for k, v in ipairs(SMODS.find_card('j_paperback_jester_of_nihil')) do
      if card:is_suit(v.ability.extra.suit) then
        card:set_debuff(true)
        if card.debuff then card.debuffed_by_blind = true end
      end
    end
  end

  return ret
end
