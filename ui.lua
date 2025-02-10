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
