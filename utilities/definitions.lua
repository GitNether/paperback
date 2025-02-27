-- Load mod config
PB_UTIL.config = SMODS.current_mod.config

-- Load values that get reset at the start of each round
SMODS.current_mod.reset_game_globals = function(run_start)
  G.GAME.current_round.paperback_scored_clips = 0
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

PB_UTIL.base_suits = {
  "Spades",
  "Hearts",
  "Clubs",
  "Diamonds"
}

PB_UTIL.vanilla_food = {
  j_gros_michel = true,
  j_egg = true,
  j_ice_cream = true,
  j_cavendish = true,
  j_turtle_bean = true,
  j_diet_cola = true,
  j_popcorn = true,
  j_ramen = true,
  j_selzer = true,
}

-- Define light and dark suits
PB_UTIL.light_suits = { 'Diamonds', 'Hearts' }
PB_UTIL.dark_suits = { 'Spades', 'Clubs' }

-- Add Crowns and Stars if enabled
if PB_UTIL.config.suits_enabled then
  table.insert(PB_UTIL.light_suits, 'paperback_Stars')
  table.insert(PB_UTIL.dark_suits, 'paperback_Crowns')
end

PB_UTIL.requirement_map = {
  requires_custom_suits = {
    setting = 'suits_enabled',
    tooltip = 'paperback_requires_custom_suits'
  },
  requires_enhancements = {
    setting = 'enhancements_enabled',
    tooltip = 'paperback_requires_enhancements'
  },
  requires_paperclips = {
    setting = 'paperclips_enabled',
    tooltip = 'paperback_requires_paperclips'
  },
  requires_minor_arcana = {
    setting = 'minor_arcana_enabled',
    tooltip = 'paperback_requires_minor_arcana'
  },
  requires_tags = {
    setting = 'tags_enabled',
    tooltip = 'paperback_requires_tags'
  },
  requires_editions = {
    setting = 'editions_enabled',
    tooltip = 'paperback_requires_editions'
  }
}

-- Disable specific items by commenting them out
PB_UTIL.ENABLED_JOKERS = {
  "calling_card",
  "forgery",
  "wish_you_were_here",
  "quick_fix",
  "sacrificial_lamb",
  "unholy_alliance",
  "stamp",
  "solar_system",
  "pool_table",
  -- "moai",
  "meeple",
  "solemn_lament",
  "furioso",
  "mismatched_sock",
  "basic_energy",
  "reference_card",
  "skydiver",
  "surfer",
  "apple",
  "joker_cookie",
  "nachos",
  "crispy_taco",
  "soft_taco",
  "complete_breakfast",
  "ghost_cola",
  "b_soda",
  "ice_cube",
  "cream_liqueur",
  "champagne",
  "coffee",
  "epic_sauce",
  "dreamsicle",
  "popsicle_stick",
  "cakepop",
  "pop_stick",
  "caramel_apple",
  "pointy_stick",
  "charred_marshmallow",
  "sticky_stick",
  "sake_cup",
  "full_moon",
  "black_rainbows",
  "emergency_broadcast",
  "triple_moon_goddess",
  -- "plague_doctor",
  -- "white_night",
  -- "one_sin_and_hundreds_of_good_deeds",
  "angel_investor",
  "shopping_center",
  -- "tutor",
  "grand_strategy",
  "great_wave",
  "let_it_happen",
  "prince_of_darkness",
  "jester_of_nihil",
  "wild_prize",
  "deadringer",
  "bicycle",
  "pride_flag",
  "bismuth",
  "cherry_blossoms",
  "hole_in_one",
  "blue_bonnets",
  "derecho",
  "autumn_leaves",
  "river",
  "evergreens",
  "backpack",
  "resurrections",
  "summoning_circle",
  "union_card",
  "book_of_vengeance",
  "moribund",
  "subterfuge",
  "the_world",
  "paranoia",
  "jestrica",
  -- "you_are_a_fool",
  "alert",
  "legacy",
  -- "weather_radio",
  -- "power_surge",
  "find_jimbo",
  -- "jimbocards",
  -- "banana_man",
  "jimbo_adventure",
  -- "ddakji",
  "pocket_pair",
  "the_quiet",
  "big_misser",
  "heretical_joker",
  "quartz",
  "rock_candy",
  "rockin_stick",
  "birches",
  "fraudulent_joker",
  "pyrite",
  "tanghulu",
  "sweet_stick",
  "wheat_field",
  -- "kintsugi_joker",
  -- "watercolor_joker",
  -- "winter_melon",
  -- "freezer",
  -- "perke_os",
  -- "matcha",
  -- "jestrogen",
  -- "jestosterone",
  -- "marketable_plushie",
  -- "jokers_11",
  -- "eyelander",
  -- "highlander",
  -- "peanuts",
  -- "aurora_borealis",
  -- "blue_marble",
  -- "claw",
  -- "marksman",
  -- "built_to_last",
  -- "as_above_so_below",
  -- "everything_must_go",
  -- "mimicry",
  -- "prismatic_shard",
}

PB_UTIL.ENABLED_MINOR_ARCANA = {
  "ace_of_cups",
  "two_of_cups",
  "three_of_cups",
  "four_of_cups",
  "five_of_cups",
  "six_of_cups",
  "seven_of_cups",
  "eight_of_cups",
  "nine_of_cups",
  "ten_of_cups",
  "page_of_cups",
  "knight_of_cups",
  "queen_of_cups",
  "king_of_cups", -- CUPS
  "ace_of_wands",
  "two_of_wands",
  "three_of_wands",
  "four_of_wands",
  "five_of_wands",
  "six_of_wands",
  "seven_of_wands",
  "eight_of_wands",
  "nine_of_wands",
  "ten_of_wands",
  "page_of_wands",
  "knight_of_wands",
  "queen_of_wands", -- WANDS
  "king_of_wands",
  "ace_of_swords",
  -- "two_of_swords",
  -- "three_of_swords",
  -- "four_of_swords",
  -- "five_of_swords",
  -- "six_of_swords",
  -- "seven_of_swords",
  -- "eight_of_swords",
  -- "nine_of_swords",
  -- "ten_of_swords",
  -- "page_of_swords",
  -- "knight_of_swords",
  -- "queen_of_swords",
  -- "king_of_swords",
  "ace_of_pentacles",
  -- "two_of_pentacles",
  -- "three_of_pentacles",
  -- "four_of_pentacles",
  -- "five_of_pentacles",
  -- "six_of_pentacles",
  -- "seven_of_pentacles",
  -- "eight_of_pentacles",
  -- "nine_of_pentacles",
  -- "ten_of_pentacles",
  -- "page_of_pentacles",
  -- "knight_of_pentacles",
  -- "queen_of_pentacles",
  -- "king_of_pentacles",
}

PB_UTIL.DECK_SKINS = {
  steven_universe = {
    name = 'Steven Universe',
    'Spades',
    'paperback_Stars'
  },
  atlyss = {
    name = 'Atlyss',
    'Clubs',
    'bunc_Fleurons'
  },
  flight_knight = {
    name = 'Flight Knight',
    'Hearts',
    'bunc_Halberds'
  },
  hylics = {
    name = 'Hylics',
    'Diamonds',
    'paperback_Crowns'
  },
  steel_ball = {
    name = "Steel Ball Run",
    'paperback_Stars'
  },
  cult_of_the_lamb = {
    name = "Cult of the Lamb",
    'paperback_Crowns'
  }
}

PB_UTIL.ENABLED_MINOR_ARCANA_BOOSTERS = {
  'minor_arcana_normal',
  'minor_arcana_mega',
}

PB_UTIL.ENABLED_VOUCHERS = {
  'celtic_cross',
  'soothsay',
}

PB_UTIL.ENABLED_TAGS = {
  'angel_investment',
  'divination',
  'dichrome',
  'high_risk',
  'breaking',
}

PB_UTIL.ENABLED_ENHANCEMENTS = {
  "soaked",
  "ceramic",
  "wrapped",
  "bandaged",
}

PB_UTIL.ENABLED_EDITIONS = {
  'dichrome'
}

PB_UTIL.ENABLED_SUITS = {
  'crowns',
  'stars',
}

PB_UTIL.ENABLED_POKER_HANDS = {
  'spectrum',
  'straight_spectrum',
  'spectrum_house',
  'spectrum_five',
}

PB_UTIL.ENABLED_PLANETS = {
  'quaoar',
  'haumea',
  'sedna',
  'makemake',
}

PB_UTIL.ENABLED_DECKS = {
  'paper',
  'proud',
  'silver',
}

-- Define a Booster object with certain shared properties for Minor Arcana packs
if PB_UTIL.config.minor_arcana_enabled then
  PB_UTIL.MinorArcanaBooster = SMODS.Booster:extend {
    group_key = 'paperback_minor_arcana_pack',
    draw_hand = true,

    create_card = function(self, card, i)
      return {
        set = 'paperback_minor_arcana',
        area = G.pack_cards,
        skip_materialize = true
      }
    end,

    ease_background_colour = function(self)
      ease_colour(G.C.DYN_UI.MAIN, G.C.PAPERBACK_MINOR_ARCANA)
      ease_background_colour { new_colour = G.C.PAPERBACK_MINOR_ARCANA, special_colour = G.C.BLACK, contrast = 2 }
    end,
  }
end

-- Define Paperclip object
if PB_UTIL.config.paperclips_enabled then
  PB_UTIL.Paperclip = SMODS.Sticker:extend {
    prefix_config = { key = true },
    should_apply = false,
    config = {},
    rate = 0,
    sets = {
      Default = true
    },

    draw = function(self, card)
      local x_offset = (card.T.w / 71) * -4 * card.T.scale
      G.shared_stickers[self.key].role.draw_major = card
      G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center, nil, nil, x_offset)
    end,

    apply = function(self, card, val)
      card.ability[self.key] = val and copy_table(self.config) or nil
    end
  }
end

-- Define custom MinorArcana object with shared properties for handling common behavior
if PB_UTIL.config.minor_arcana_enabled then
  --- @type SMODS.Consumable
  PB_UTIL.MinorArcana = SMODS.Consumable:extend {
    set = 'paperback_minor_arcana',
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
      if not self.config then return end

      if card.ability.paperclip then
        info_queue[#info_queue + 1] = PB_UTIL.paperclip_tooltip(card.ability.paperclip)

        return {
          vars = {
            card.ability.max_highlighted
          }
        }
      elseif card.ability.mod_conv then
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]

        return {
          vars = {
            card.ability.max_highlighted,
            localize {
              type = 'name_text',
              set = 'Enhanced',
              key = card.ability.mod_conv
            }
          }
        }
      elseif card.ability.suit_conv then
        return {
          vars = {
            card.ability.max_highlighted,
            localize(card.ability.suit_conv, 'suits_plural'),
            colours = {
              G.C.SUITS[card.ability.suit_conv]
            }
          }
        }
      end
    end,

    use = function(self, card, area)
      if not self.config then return end

      if card.ability.paperclip or card.ability.mod_conv or card.ability.suit_conv then
        PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
          for _, v in ipairs(G.hand.highlighted) do
            if card.ability.paperclip then
              PB_UTIL.set_paperclip(v, card.ability.paperclip)
            elseif card.ability.mod_conv then
              v:set_ability(G.P_CENTERS[card.ability.mod_conv])
            else
              SMODS.change_base(v, card.ability.suit_conv)
            end
          end
        end)
      end
    end
  }
end

if PB_UTIL.config.suits_enabled then
  --- @type SMODS.Consumable
  PB_UTIL.Planet = SMODS.Consumable:extend {
    set = "Planet",
    is_dwarf = false,

    -- Since the description of all planets is the same, we just copy it from a random one
    -- The name of this planet still needs to be specified in the localization file
    process_loc_text = function(self)
      G.localization.descriptions[self.set][self.key] = {
        text = G.localization.descriptions[self.set].c_mercury.text
      }
    end,

    set_card_type_badge = function(self, card, badges)
      badges[#badges + 1] = create_badge(
        not self.is_dwarf and localize('k_planet_q') or localize('k_dwarf_planet'),
        get_type_colour(self, card),
        nil,
        1.2
      )
    end,

    -- By making this not a function, the game will use the vanilla UI generation
    generate_ui = 'Nope!'
  }
end

--- @alias Paperclip "blue" | "black" | "white" | "red" | "orange" | "pink"
PB_UTIL.ENABLED_PAPERCLIPS = {
  "blue_clip",
  "red_clip",
  "orange_clip",
  "pink_clip",
  "black_clip",
  "white_clip",
}
