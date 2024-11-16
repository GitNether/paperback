--- STEAMODDED HEADER
--- MOD_NAME: Paperback
--- MOD_ID: paperback
--- MOD_AUTHOR: [PaperMoon, Nether, OppositeWolf770, B]
--- MOD_DESCRIPTION: A vanilla centered mod built upon expanding the base game with jokers
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 0.19.0
--- BADGE_COLOR: 8b61ad

----------------------------------------------
------------MOD CODE -------------------------
----------------------------------------------

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

-- Config: Enable or disable additional jokers here
local CONFIG = {
    joker_calling_card = true,
    joker_quick_fix = true,
    joker_sacrificial_lamb = true,
    joker_wish_you_were_here = true,
    joker_stamp = true,
    joker_solar_system = true,
    joker_furioso = true,
    joker_pride_flag = true,
    joker_pool_table = true,
    joker_summoning_circle = true,
    joker_derecho = true,
    joker_skydiver = true,
    joker_solemn_lament = true,
    joker_ghost_cola = true,
    joker_shopping_center = true,
    joker_nachos = true,
    joker_soft_taco = true,
    joker_crispy_taco = true,
    joker_bicycle = true,
    joker_reference_card = true,
    joker_great_wave = true,
    joker_wild_prize = true,
}

for key, enabled in pairs(CONFIG) do
    if enabled then
        local path = key:gsub("_", "/", 1)
        NFS.load(SMODS.current_mod.path .. "/" .. path .. ".lua")() -- name files "joker_<name>" so they get loaded automatically
        sendDebugMessage("Loaded joker: " .. key, "Paperback")
    end
end
