-- Create config UI
SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = {
      align = 'cm',
      padding = 0.05,
      emboss = 0.05, -- raises this element
      r = 0.1,       -- adds a radius to the borders
      colour = G.C.BLACK
    },
    nodes = {
      {
        n = G.UIT.R, -- Row
        config = { align = 'cm', minh = 1 },
        nodes = {
          {
            n = G.UIT.T, -- Text
            config = {
              text = localize('paperback_ui_requires_restart'),
              colour = G.C.RED,
              scale = 0.5
            }
          }
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
      }
    }
  }
end

-- Create Credits tab in our mod UI
SMODS.current_mod.extra_tabs = function()
  return {
    {
      label = localize('b_credits'),
      tab_definition_function = function()
        return {
          n = G.UIT.ROOT,
          config = {
            align = 'tl',
            padding = 0.05,
            emboss = 0.05, -- raises this element
            r = 0.1,       -- adds a radius to the borders
            colour = G.C.BLACK
          },
          nodes = {
            {
              n = G.UIT.R, -- Row
              nodes = {
                {
                  n = G.UIT.C, -- Column
                  config = { padding = 0.5 },
                  nodes = {
                    {
                      n = G.UIT.R, -- Row
                      nodes = {
                        {
                          n = G.UIT.T, -- Text
                          config = {
                            text = localize('paperback_ui_artists'),
                            colour = G.C.CHIPS,
                            scale = 0.75
                          }
                        },
                      }
                    },
                    {
                      n = G.UIT.R, -- Row
                      config = { align = 'cm', minh = 0.25 },
                      nodes = {
                        {
                          n = G.UIT.T, -- Text
                          config = {
                            text = 'PaperMoon',
                            colour = G.C.MULT,
                            scale = 0.4
                          }
                        }
                      }
                    },
                  }
                },
                {
                  n = G.UIT.C, -- Column
                  config = { padding = 0.5 },
                  nodes = {
                    {
                      n = G.UIT.R, -- Row
                      nodes = {
                        {
                          n = G.UIT.T, -- Text
                          config = {
                            text = localize('paperback_ui_developers'),
                            colour = G.C.CHIPS,
                            scale = 0.75
                          }
                        },
                      }
                    },
                    {
                      n = G.UIT.R, -- Row
                      config = { align = 'cm', minh = 0.25 },
                      nodes = {
                        {
                          n = G.UIT.T, -- Text
                          config = {
                            text = 'OppositeWolf770',
                            colour = G.C.GREEN,
                            scale = 0.4
                          }
                        }
                      }
                    },
                    {
                      n = G.UIT.R, -- Row
                      config = { align = 'cm', minh = 0.25 },
                      nodes = {
                        {
                          n = G.UIT.T, -- Text
                          config = {
                            text = 'srockw',
                            colour = G.C.GREEN,
                            scale = 0.4
                          }
                        }
                      }
                    },
                    {
                      n = G.UIT.R, -- Row
                      config = { align = 'cm', minh = 0.25 },
                      nodes = {
                        {
                          n = G.UIT.T, -- Text
                          config = {
                            text = 'Nether',
                            colour = G.C.GREEN,
                            scale = 0.4
                          }
                        }
                      }
                    },
                    {
                      n = G.UIT.R, -- Row
                      config = { align = 'cm', minh = 0.25 },
                      nodes = {
                        {
                          n = G.UIT.T, -- Text
                          config = {
                            text = 'B',
                            colour = G.C.GREEN,
                            scale = 0.4
                          }
                        }
                      }
                    }
                  }
                },
                {
                  n = G.UIT.C, -- Column
                  config = { padding = 0.5 },
                  nodes = {
                    {
                      n = G.UIT.R, -- Row
                      nodes = {
                        {
                          n = G.UIT.T, -- Text
                          config = {
                            text = localize('paperback_ui_localization'),
                            colour = G.C.CHIPS,
                            scale = 0.75
                          }
                        },
                      }
                    },
                    {
                      n = G.UIT.R, -- Row
                      config = { align = 'cm', minh = 0.25 },
                      nodes = {
                        {
                          n = G.UIT.T, -- Text
                          config = {
                            text = 'pinkmaggit-hub',
                            colour = G.C.FILTER,
                            scale = 0.4
                          }
                        }
                      }
                    },
                    {
                      n = G.UIT.R, -- Row
                      config = { align = 'cm', minh = 0.25 },
                      nodes = {
                        {
                          n = G.UIT.T, -- Text
                          config = {
                            text = 'mathieulievre',
                            colour = G.C.FILTER,
                            scale = 0.4
                          }
                        }
                      }
                    },
                  }
                },
              }
            }
          }
        }
      end
    }
  }
end
