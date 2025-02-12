PB_UTIL = NFS.load(SMODS.current_mod.path .. "/paperback-utils.lua")()

-- Load our mod's UI
NFS.load(SMODS.current_mod.path .. "/ui.lua")()

-- Registers the atlas for Jokers
SMODS.Atlas {
  key = 'jokers_atlas',
  px = 71,
  py = 95,
  path = 'Jokers.png'
}

-- Registers the atlas for Minor Arcana
SMODS.Atlas {
  key = 'minor_arcana_atlas',
  px = 71,
  py = 95,
  path = 'MinorArcana.png'
}

--- Registers atlas for Crowns and Stars
-- Low contrast
SMODS.Atlas {
  key = 'suits_lc',
  path = 'suits_lc.png',
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = 'suits_ui_lc',
  path = 'suits_ui_lc.png',
  px = 18,
  py = 18
}

-- High contrast
SMODS.Atlas {
  key = 'suits_hc',
  path = 'suits_hc.png',
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = 'suits_ui_hc',
  path = 'suits_ui_hc.png',
  px = 18,
  py = 18
}

-- Registers the mod icon
SMODS.Atlas { -- modicon
  key = 'modicon',
  px = 32,
  py = 32,
  path = 'modicon.png'
}

-- Disable specific jokers by commenting them out
local ENABLED_JOKERS = {
  "calling_card",
  "quick_fix",
  "sacrificial_lamb",
  "wish_you_were_here",
  "stamp",
  "solar_system",
  "furioso",
  "pride_flag",
  "pool_table",
  "summoning_circle",
  "hole_in_one",
  "derecho",
  "forgery",
  "skydiver",
  "solemn_lament",
  "ghost_cola",
  "mismatched_sock",
  "shopping_center",
  "union_card",
  "nachos",
  "jester_of_nihil",
  "complete_breakfast",
  "reference_card",
  "crispy_taco",
  "soft_taco",
  "prince_of_darkness",
  -- "passport",
  "black_rainbows",
  "emergency_broadcast",
  "triple_moon_goddess",
  -- "plague_doctor",
  -- "white_night",
  -- "one_sin_and_hundreds_of_good_deeds",
  -- "marksman",
  -- "built_to_last",
  -- "everything_must_go",
  "wild_prize",
  -- "down_to_size",
  "bicycle",
  "grand_strategy",
  -- "marketable_plushie",
  "great_wave",
  "let_it_happen",
  "dreamsicle",
  "popsicle_stick",
  "cakepop",
  "pop_stick",
  "caramel_apple",
  "pointy_stick",
  "charred_marshmallow",
  "sticky_stick",
  "paranoia",
  "subterfuge",
  -- "as_above_so_below",
  "unholy_alliance",
  "cherry_blossoms",
  "blue_bonnets",
  "autumn_leaves",
  "evergreens",
  "river",
  "moribund",
  "jimbo_adventure",
  "joker_cookie",
  "the_world",
  "meeple",
  -- "angel_investor",
  "basic_energy",
  "coffee",
  "cream_liqueur",
  -- "mimicry",
  -- "prismatic_shard",
  "big_misser",
  -- "eyelander",
  -- "highlander",
  -- "peanuts",
  -- "aurora_borealis",
  -- "blue_marble",
  -- "b_soda",
  -- "jestrogen",
  -- "jestosterone",
  -- "power_surge",
  -- "weather_radio",
  "jestrica",
  "epic_sauce",
  "find_jimbo",
  "champagne",
  -- "deadringer",
  "apple",
  -- "winter_melon",
  -- "ddakji",
  -- "you_are_a_fool",
  -- "book_of_vengeance",
  -- "perke_os",
  "alert",
  "legacy",
  -- "freezer",
  "ice_cube",
  "backpack",
  "pocket_pair",
  -- "throwing_card",
  -- "jimbocards",
  -- "moai",
  -- "the_quiet",
  -- "hanafuda",
  "heretical_joker",
  "fraudulent_joker",
  "rock_candy",
  "rockin_stick",
  "tanghulu",
  "sweet_stick",
  "quartz",
  "pyrite",
  -- "bismuth",
  -- "kintsugi_joker",
  -- "watercolor_joker"
}

local ENABLED_MINOR_ARCANA = {
  -- "ace_of_cups",
  "two_of_cups",
  -- "three_of_cups",
  "four_of_cups",
  -- "five_of_cups",
  "six_of_cups",
  "seven_of_cups",
  "eight_of_cups",
  "nine_of_cups",
  "ten_of_cups",
  -- "page_of_cups",
  "knight_of_cups",
  -- "queen_of_cups",
  "king_of_cups",
  -- "ace_of_wands",
  -- "two_of_wands",
  -- "three_of_wands",
  -- "four_of_wands",
  -- "five_of_wands",
  -- "six_of_wands",
  -- "seven_of_wands",
  -- "eight_of_wands",
  -- "nine_of_wands",
  -- "ten_of_wands",
  -- "page_of_wands",
  -- "knight_of_wands",
  -- "queen_of_wands",
  -- "king_of_wands",
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

-- Only load jokers if they are enabled in the config
if PB_UTIL.config.jokers_enabled then
  PB_UTIL.register_items(ENABLED_JOKERS, "joker")
end

-- Only load minor arcana if they are enabled in config
if PB_UTIL.config.minor_arcana_enabled then
  -- Register the consumable type to be used by Minor Arcana
  SMODS.ConsumableType {
    key = 'minor_arcana',
    prefix_config = { key = true },      -- Add the prefix of the mod to the key
    primary_colour = HEX("BDA0D9"),
    secondary_colour = HEX("BDA0D9"),    -- Color of the collection button and badge
    shop_rate = 0,                       -- These will not appear in the shop
    default = 'c_paperback_two_of_cups', -- Card to spawn if pool is empty
    collection_rows = { 7, 7 }
  }

  PB_UTIL.register_items(ENABLED_MINOR_ARCANA, "minor_arcana")
end

-- Load custom suit "Crowns" and "Stars" only if enabled
if PB_UTIL.config.suits_enabled then
  SMODS.Suit {
    key = 'Stars',
    card_key = 'STARS',

    lc_atlas = 'suits_lc',
    lc_ui_atlas = 'suits_ui_lc',
    lc_colour = G.C.PAPERBACK_STARS_LC,

    hc_atlas = 'suits_hc',
    hc_ui_atlas = 'suits_ui_hc',
    hc_colour = G.C.PAPERBACK_STARS_HC,

    pos = { y = 0 },
    ui_pos = { x = 0, y = 1 },

    in_pool = function(self, args)
      -- Only add this suit to pool when not creating a deck
      return not (args and args.initial_deck)
    end
  }

  SMODS.Suit {
    key = 'Crowns',
    card_key = 'CROWNS',

    lc_atlas = 'suits_lc',
    lc_ui_atlas = 'suits_ui_lc',
    lc_colour = G.C.PAPERBACK_CROWNS_LC,

    hc_atlas = 'suits_hc',
    hc_ui_atlas = 'suits_ui_hc',
    hc_colour = G.C.PAPERBACK_CROWNS_HC,

    pos = { y = 1 },
    ui_pos = { x = 0, y = 0 },

    in_pool = function(self, args)
      -- Only add this suit to pool when not creating a deck
      return not (args and args.initial_deck)
    end
  }
end

-- Apply paperback config to each loaded center
for _, center in pairs(SMODS.Centers) do
  if type(center) == "table" and center.paperback then
    local func_ref = center.in_pool or function() return true end
    local config = center.paperback

    if config.requires_crowns or config.requires_stars then
      config.requires_custom_suits = true
    end

    -- Hook the in_pool function, adding extra logic depending on the
    -- config provided by this center
    center.in_pool = function(self, args)
      local ret, dupes = func_ref(self, args)

      if config.requires_custom_suits then
        ret = ret and PB_UTIL.config.suits_enabled
      end

      if config.requires_crowns then
        ret = ret and PB_UTIL.has_suit_in_deck('paperback_Crowns', true)
      end

      if config.requires_stars then
        ret = ret and PB_UTIL.has_suit_in_deck('paperback_Stars', true)
      end

      return ret, dupes
    end
  end
end
