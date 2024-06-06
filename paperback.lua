

--- STEAMODDED HEADER
--- MOD_NAME: Paperback
--- MOD_ID: paperback
--- MOD_AUTHOR: [PaperMoon, Nether]
--- MOD_DESCRIPTION: Add new Jokers to the game
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 0.2.0

----------------------------------------------
------------MOD CODE -------------------------

-- feel free to add your names to the Mod Author list if you're working on this mod

_RELEASE_MODE = false -- REMOVE IN RELEASE

PB_UTIL = require(SMODS.current_mod.path.."/paperback-utils")

-- Config: Enable or disable additional jokers here
local CONFIG = {
    joker_example
}

for key, enabled in pairs(CONFIG) do
    if enabled then
        local path = key:gsub("_", "/")
        require(SMODS.current_mod.path .. path) -- name files "joker_<name>" so they get loaded automatically
        sendDebugMessage("Paperback :: Loaded joker: " .. key)
    end
end