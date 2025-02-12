PB_UTIL = {}

-- Load utility functions into PB_UTIL
NFS.load(SMODS.current_mod.path .. "/utilities/definitions.lua")()
NFS.load(SMODS.current_mod.path .. "/utilities/misc_functions.lua")()
NFS.load(SMODS.current_mod.path .. "/utilities/ui.lua")()
NFS.load(SMODS.current_mod.path .. "/utilities/hooks.lua")()
NFS.load(SMODS.current_mod.path .. "/utilities/cross-mod.lua")()

-- Load the atlases
NFS.load(SMODS.current_mod.path .. "/content/atlas.lua")()

-- Only load jokers if they are enabled in the config
if PB_UTIL.config.jokers_enabled then
  PB_UTIL.register_items(PB_UTIL.ENABLED_JOKERS, "content/joker")
end

-- Only load minor arcana if they are enabled in config
if PB_UTIL.config.minor_arcana_enabled then
  -- Register the consumable type to be used by Minor Arcana
  SMODS.ConsumableType {
    key = 'minor_arcana',
    prefix_config = { key = true },                -- Add the prefix of the mod to the key
    primary_colour = G.C.PAPERBACK_MINOR_ARCANA,
    secondary_colour = G.C.PAPERBACK_MINOR_ARCANA, -- Color of the collection button and badge
    shop_rate = 0,                                 -- These will not appear in the shop
    default = 'c_paperback_two_of_cups',           -- Card to spawn if pool is empty
    collection_rows = { 7, 7 }
  }

  -- Register Minor Arcana cards
  PB_UTIL.register_items(PB_UTIL.ENABLED_MINOR_ARCANA, "content/minor_arcana")

  -- Register Minor Arcana boosters
  PB_UTIL.register_items(PB_UTIL.ENABLED_MINOR_ARCANA_BOOSTERS, "content/booster")
end

-- Only load enhancements if they are enabled in the config
if PB_UTIL.config.enhancements_enabled then
  PB_UTIL.register_items(PB_UTIL.ENABLED_ENHANCEMENTS, "content/enhancement")
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
      return not (args and args.initial_deck) and PB_UTIL.has_suit_in_deck('paperback_Stars', true)
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
      return not (args and args.initial_deck) and PB_UTIL.has_suit_in_deck('paperback_Crowns', true)
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

    config.requirements = {}
    for k, _ in pairs(config) do
      local data = PB_UTIL.requirement_map[k]
      if data then
        table.insert(config.requirements, data)
      end
    end

    -- Hook the in_pool function, adding extra logic depending on the
    -- config provided by this center
    center.in_pool = function(self, args)
      local ret, dupes = func_ref(self, args)

      for _, v in ipairs(config.requirements) do
        ret = ret and PB_UTIL.config[v.setting]
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
