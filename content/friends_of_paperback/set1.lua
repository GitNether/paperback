local atlas_key = 'paperback_deckskin_set1_atlas'

local atlas_path = 'deckskin_set1_lc.png'
local atlas_path_hc = 'deckskin_set1_hc.png'

local suits = {'hearts', 'clubs', 'diamonds', 'spades'}
local ranks = {'Jack', 'Queen', 'King', 'Ace'}

local descriptions = {'Fight Knight', 'Atlyss', 'Hylics', 'Steven Universe'}

SMODS.Atlas{  
    key = atlas_key..'_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = {key = false}, -- See end of file for notes
}

if atlas_path_hc then
    SMODS.Atlas{  
        key = atlas_key..'_hc',
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = {key = false}, -- See end of file for notes
    }
end

PB_UTIL.register_deckskin_set(suits, ranks, atlas_key, atlas_path_hc, descriptions)