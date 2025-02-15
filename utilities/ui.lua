-- Create config UI
SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
    nodes = {
      {
        n = G.UIT.R,
        config = { align = 'cm', minh = 1 },
        nodes = {
          { n = G.UIT.T, config = { text = localize('paperback_ui_requires_restart'), colour = G.C.RED, scale = 0.5 } }
        }
      },
      create_toggle {
        label = localize('paperback_ui_enable_jokers'),
        ref_table = PB_UTIL.config,
        ref_value = 'jokers_enabled'
      },
      create_toggle {
        label = localize('paperback_ui_enable_minor_arcana'),
        ref_table = PB_UTIL.config,
        ref_value = 'minor_arcana_enabled'
      },
      create_toggle {
        label = localize('paperback_ui_custom_suits_enabled'),
        ref_table = PB_UTIL.config,
        ref_value = 'suits_enabled'
      },
      create_toggle {
        label = localize('paperback_ui_enable_enhancements'),
        ref_table = PB_UTIL.config,
        ref_value = 'enhancements_enabled'
      },
      create_toggle {
        label = localize('paperback_ui_enable_paperclips'),
        ref_table = PB_UTIL.config,
        ref_value = 'paperclips_enabled'
      }
    }
  }
end

-- Create Credits tab in our mod UI
SMODS.current_mod.extra_tabs = function()
  local credits_tab = {
    n = G.UIT.ROOT,
    config = { align = 'tl', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
    nodes = { {
      n = G.UIT.R,
      nodes = {
        {
          n = G.UIT.C,
          config = { padding = 0.5 },
          nodes = {
            {
              n = G.UIT.R,
              nodes = {
                { n = G.UIT.T, config = { text = localize('paperback_ui_artists'), colour = G.C.CHIPS, scale = 0.75 } },
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cm', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'PaperMoon', colour = G.C.MULT, scale = 0.4 } }
              }
            },
          }
        },
        {
          n = G.UIT.C,
          config = { padding = 0.5 },
          nodes = {
            {
              n = G.UIT.R,
              nodes = {
                { n = G.UIT.T, config = { text = localize('paperback_ui_developers'), colour = G.C.CHIPS, scale = 0.75 } },
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cm', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'OppositeWolf770', colour = G.C.GREEN, scale = 0.4 } }
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cm', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'srockw', colour = G.C.GREEN, scale = 0.4 } }
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cm', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'Nether', colour = G.C.GREEN, scale = 0.4 } }
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cm', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'B', colour = G.C.GREEN, scale = 0.4 } }
              }
            }
          }
        },
        {
          n = G.UIT.C,
          config = { padding = 0.5 },
          nodes = {
            {
              n = G.UIT.R,
              nodes = {
                { n = G.UIT.T, config = { text = localize('paperback_ui_localization'), colour = G.C.CHIPS, scale = 0.75 } },
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cm', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'pinkmaggit-hub', colour = G.C.FILTER, scale = 0.4 } }
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cm', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'mathieulievre', colour = G.C.FILTER, scale = 0.4 } }
              }
            }
          }
        }
      }
    } }
  }

  return {
    {
      label = localize('b_credits'),
      tab_definition_function = function()
        return credits_tab
      end
    }
  }
end

-- Create collection entry for Paperclips
if PB_UTIL.config.paperclips_enabled then
  SMODS.current_mod.custom_collection_tabs = function()
    return {
      UIBox_button({
        button = 'your_collection_paperback_paperclips',
        id = 'your_collection_paperback_paperclips',
        label = { localize('paperback_ui_paperclips') },
        minw = 5,
        minh = 1
      })
    }
  end

  local function paperclips_ui()
    local paperclips = {}

    for k, v in pairs(SMODS.Stickers) do
      if PB_UTIL.is_paperclip(k) then
        paperclips[k] = v
      end
    end

    return SMODS.card_collection_UIBox(paperclips, { 5, 5 }, {
      snap_back = true,
      hide_single_page = true,
      collapse_single_page = true,
      center = 'c_base',
      h_mod = 1.03,
      back_func = 'your_collection_other_gameobjects',
      modify_card = function(card, center)
        card.ignore_pinned = true
        center:apply(card, true)
      end,
    })
  end

  G.FUNCS.your_collection_paperback_paperclips = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
      definition = paperclips_ui()
    }
  end

  local function wrap_without_paperclips(func)
    -- Remove our paperclips from SMODS.Stickers just for this function call
    local removed = {}
    for k, v in pairs(SMODS.Stickers) do
      if PB_UTIL.is_paperclip(k) then
        removed[k] = v
        SMODS.Stickers[k] = nil
      end
    end

    local ret = func()

    -- Add them back once the UI was created
    for k, v in pairs(removed) do
      SMODS.Stickers[k] = v
    end

    return ret
  end

  -- Override the creation of the 'Stickers' tab in the collection
  local stickers_ui_ref = create_UIBox_your_collection_stickers
  create_UIBox_your_collection_stickers = function()
    return wrap_without_paperclips(stickers_ui_ref)
  end

  -- Override the creation of the 'Stickers' tab in our 'Additions' tab
  local other_objects_ref = create_UIBox_Other_GameObjects
  create_UIBox_Other_GameObjects = function()
    return wrap_without_paperclips(other_objects_ref)
  end
end

-- Returns a table that can be inserted into info_queue to show all suits of the provided type
--- @param type 'light' | 'dark'
function PB_UTIL.suit_tooltip(type)
  local suits = type == 'light' and PB_UTIL.light_suits or PB_UTIL.dark_suits
  local key = 'paperback_' .. type .. '_suits'
  local colours = {}

  -- If any modded suits were loaded, we need to dynamically
  -- add them to the localization table
  if #suits > 2 then
    local text = {}
    local line = ""
    local text_parsed = {}

    for i = 1, #suits do
      local suit = suits[i]

      colours[#colours + 1] = G.C.SUITS[suit] or G.C.IMPORTANT
      line = line .. "{V:" .. i .. "}" .. localize(suit, 'suits_plural') .. "{}"

      if i < #suits then
        line = line .. ", "
      end

      if #line > 30 then
        text[#text + 1] = line
        line = ""
      end
    end

    if #line > 0 then
      text[#text + 1] = line
    end

    for _, v in ipairs(text) do
      text_parsed[#text_parsed + 1] = loc_parse_string(v)
    end

    G.localization.descriptions.Other[key].text = text
    G.localization.descriptions.Other[key].text_parsed = text_parsed
  end

  return {
    set = 'Other',
    key = key,
    vars = {
      colours = colours
    }
  }
end

--- @param type "blue"
function PB_UTIL.paperclip_tooltip(type)
  local key = 'paperback_' .. type .. '_clip'
  local paperclip = SMODS.Stickers[key]
  local vars = {}

  -- This may be the case if the paperclip was disabled by the user
  if not paperclip then return end

  if paperclip.loc_vars then
    local dummy_card = { ability = {} }
    paperclip:apply(dummy_card, true)
    vars = paperclip:loc_vars({}, dummy_card).vars
  end

  return {
    set = 'Other',
    key = key,
    vars = vars
  }
end
