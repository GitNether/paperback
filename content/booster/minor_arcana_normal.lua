PB_UTIL.MinorArcanaBooster {
  key = 'minor_arcana_normal',
  atlas = 'boosters_atlas',
  pos = { x = 0, y = 0 },
  config = {
    extra = 4,
    choose = 1
  },
  -- Since there is only one normal pack, compared to the 4 Tarot ones,
  -- we make the weight higher so that this is not incredibly rare
  weight = 3,
  cost = 5,
  discovered = true,
}
