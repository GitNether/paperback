PB_UTIL.MinorArcanaBooster {
  key = 'minor_arcana_mega',
  atlas = 'boosters_atlas',
  pos = { x = 1, y = 0 },
  config = {
    extra = 5,
    choose = 2
  },
  -- Since there is only one mega pack, compared to the 2 Tarot ones,
  -- we make the weight higher so that this is not incredibly rare
  weight = 0.75,
  cost = 9,
  discovered = true
}
