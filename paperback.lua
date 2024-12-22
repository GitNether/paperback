--- STEAMODDED HEADER
--- MOD_NAME: Paperback
--- MOD_ID: paperback
--- MOD_AUTHOR: [PaperMoon, Nether, OppositeWolf770, B]
--- MOD_DESCRIPTION: A vanilla centered mod built upon expanding the base game with jokers
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 0.0.2-alpha
--- BADGE_COLOR: 8b61ad

_RELEASE_MODE = false -- DEBUG MODE :: REMOVE IN RELEASE

PB_UTIL = NFS.load(SMODS.current_mod.path .. "/paperback-utils.lua")()

-- -- Loads the JokerDisplay
-- if JokerDisplay then
--     SMODS.load_path("JokerDisplay.lua")()
-- end

-- Registers the atlas for Jokers
SMODS.Atlas {
    key = 'jokers_atlas',
    px = 71,
    py = 95,
    path = 'Jokers.png'
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
    -- "hole_in_one",
    "derecho",
    -- "forgery",
    "skydiver",
    "solemn_lament",
    "ghost_cola",
    "mismatched_sock",
    "shopping_center",
    -- "union_card",
    "nachos",
    -- "jester_of_nihil",
    -- "complete_breakfast",
    "reference_card",
    "crispy_taco",
    "soft_taco",
    "prince_of_darkness",
    -- "passport",
    -- "black_rainbows",
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
    -- "grand_strategy",
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
    -- "paranoia",
    -- "as_above_so_below",
    -- "unholy_alliance",
    -- "cherry_blossoms",
    -- "blue_bonnets",
    -- "autumn_leaves",
    -- "evergreens",
    -- "river",
    "moribund",
    "jimbo_adventure",
}

-- Register the jokers in custom order
for i = 1, #ENABLED_JOKERS do
    NFS.load(SMODS.current_mod.path .. "/joker/" .. ENABLED_JOKERS[i] .. ".lua")()
    sendDebugMessage("Loaded joker: " .. ENABLED_JOKERS[i], "Paperback")
end
