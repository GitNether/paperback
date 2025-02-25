PB_UTIL = {}

-- Load utility functions into PB_UTIL
SMODS.load_file("utilities/definitions.lua")()
SMODS.load_file("utilities/misc_functions.lua")()
SMODS.load_file("utilities/ui.lua")()
SMODS.load_file("utilities/hooks.lua")()
SMODS.load_file("utilities/cross-mod.lua")()

-- Load the atlases
SMODS.load_file("content/atlas.lua")()

-- Test Comment

-- Load Jokers if they are enabled
if PB_UTIL.config.jokers_enabled then
  PB_UTIL.register_items(PB_UTIL.ENABLED_JOKERS, "content/joker")
end

-- Load Minor Arcana if they are enabled
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

  -- Register music for Minor Arcana boosters
  SMODS.Sound {
    key = 'music_minor_arcana',
    path = 'music_minor_arcana.ogg',
    select_music_track = function(self)
      -- We only check the booster once there are cards in the pack_cards area
      local booster = G.pack_cards and G.pack_cards.cards and SMODS.OPENED_BOOSTER

      -- If it's a minor arcana pack, we return the priority of this music
      if booster and booster.config.center_key:find('p_paperback_minor_arcana_') then
        return 1e10
      end
    end
  }
end

-- Load enhancements if they are enabled
if PB_UTIL.config.enhancements_enabled then
  PB_UTIL.register_items(PB_UTIL.ENABLED_ENHANCEMENTS, "content/enhancement")
end

if PB_UTIL.config.editions_enabled then
  PB_UTIL.register_items(PB_UTIL.ENABLED_EDITIONS, "content/edition")
end

-- Load Paperclips if they are enabled
if PB_UTIL.config.paperclips_enabled then
  PB_UTIL.register_items(PB_UTIL.ENABLED_PAPERCLIPS, "content/paperclip")
end

-- Load custom suits and spectrums if they are enabled
if PB_UTIL.config.suits_enabled then
  PB_UTIL.register_items(PB_UTIL.ENABLED_SUITS, "content/suit")

  -- Register Spectrum poker hand some other Spectrum mods are not installed
  if not (next(SMODS.find_mod('Bunco') or next(SMODS.find_mod("SixSuits") or next(SMODS.find_mod("SpectrumFramework"))))) then
    PB_UTIL.register_items(PB_UTIL.ENABLED_POKER_HANDS, "content/pokerhand")
    PB_UTIL.register_items(PB_UTIL.ENABLED_PLANETS, "content/planet")
  end
end

-- Load Vouchers if they're enabled
if PB_UTIL.config.vouchers_enabled then
  PB_UTIL.register_items(PB_UTIL.ENABLED_VOUCHERS, "content/voucher")
end

-- Load Tags if they're enabled
if PB_UTIL.config.tags_enabled then
  PB_UTIL.register_items(PB_UTIL.ENABLED_TAGS, "content/tag")
end

-- Load custom Decks
PB_UTIL.register_items(PB_UTIL.ENABLED_DECKS, "content/deck")

-- Register DeckSkins for Friends of Paperback
for skin, data in pairs(PB_UTIL.DECK_SKINS) do
  for _, suit in ipairs(data) do
    local key = skin .. "_" .. suit:lower()

    -- Common ranks used in both palettes
    local ranks = { 'Jack', 'Queen', 'King', 'Ace' }
    local display_ranks = PB_UTIL.reverse_table(ranks)

    local atlas_lc = SMODS.Atlas {
      key = key .. '_lc',
      path = 'collabs/' .. key .. '_lc.png',
      px = 71,
      py = 95
    }

    local atlas_hc = SMODS.Atlas {
      key = key .. '_hc',
      path = 'collabs/' .. key .. '_hc.png',
      px = 71,
      py = 95
    }

    SMODS.DeckSkin {
      key = key,
      suit = suit,
      loc_txt = {
        ['en-us'] = data.name
      },
      palettes = {
        {
          key = 'lc',
          ranks = ranks,
          display_ranks = display_ranks,
          pos_style = 'ranks',
          atlas = atlas_lc.key
        },
        {
          key = 'hc',
          ranks = ranks,
          display_ranks = display_ranks,
          pos_style = 'ranks',
          atlas = atlas_hc.key,
          hc_default = true
        }
      }
    }
  end
end

-- Collect valid objects to apply Paperback config to
local objects = {}

for _, v in pairs(SMODS.Centers) do
  objects[#objects + 1] = { obj = v, center = true }
end

for _, v in pairs(SMODS.Tags) do
  objects[#objects + 1] = { obj = v, tag = true }
end

-- Apply said config to each valid object
for _, v in ipairs(objects) do
  local obj = v.obj
  if obj and type(obj) == "table" and obj.paperback then
    local func_ref = obj.in_pool or function() return true end
    local config = obj.paperback

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
    obj.in_pool = function(self, args)
      local ret, dupes = func_ref(self, args)

      for _, req in ipairs(config.requirements) do
        ret = ret and PB_UTIL.config[req.setting]
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
