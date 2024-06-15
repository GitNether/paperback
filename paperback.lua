--- STEAMODDED HEADER
--- MOD_NAME: Paperback
--- MOD_ID: paperback
--- MOD_AUTHOR: [PaperMoon, Nether, OppositeWolf770, B]
--- MOD_DESCRIPTION: A vanilla centered mod built upon expanding the base game with jokers
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 1.0.0
--- BADGE_COLOR: 8b61ad

----------------------------------------------
------------MOD CODE -------------------------
----------------------------------------------

_RELEASE_MODE = false -- DEBUG MODE :: REMOVE IN RELEASE

PB_UTIL = require(SMODS.current_mod.path .. "/paperback-utils")

-- Registers the atlas for Jokers
SMODS.Atlas {  
    key = 'jokers_atlas',
    px = 71,
    py = 95,
    path = 'Jokers.png'
}

-- Config: Enable or disable additional jokers here
local CONFIG = {
    joker_pool_table = true,
    joker_calling_card = true,
    joker_ghost_cola = true,
}

for key, enabled in pairs(CONFIG) do
    if enabled then
        local path = key:gsub("_", "/", 1)
        require(SMODS.current_mod.path .. "/" .. path) -- name files "joker_<name>" so they get loaded automatically
        sendDebugMessage("Paperback :: Loaded joker: " .. key)
    end
end



-- Code to allow Ghost Cola to show up
-- in the shop When Diet Cola is sold
--------------------------------------------------

-- Creates the flag
local BackApply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
    BackApply_to_run_ref(arg_56_0)
    G.GAME.pool_flags.diet_cola_sold = false
    G.P_CENTERS['j_diet_cola']['yes_pool_flag'] = 'diet_cola_sold'
    G.P_CENTERS['j_pape_ghost_cola']['no_pool_flag'] = 'diet_cola_sold'
end

-- Modifies the `diet_cola_sold` flag
local calculate_joker_ref = Card.calculate_joker
function Card:calculate_joker(context)
    local ret = calculate_joker_ref(self, context)

    if self.ability.set == "Joker" and not self.debuff then
        if context.selling_self then
            if self.ability.name == 'Diet Cola' then
                G.GAME.pool_flags.diet_cola_sold = true
                sendDebugMessage("Diet Cola Sold!")
            end
        end
    end

    return ret
end
--------------------------------------------------