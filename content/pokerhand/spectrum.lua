SMODS.PokerHandPart { -- Spectrum base (Referenced from SixSuits)
  key = 'spectrum',
  func = function(hand)
    if #hand < 5 then return {} end
    local unique_suits = PB_UTIL.get_unique_suits(hand, nil, true)
    return (unique_suits >= 5) and { hand } or {}
  end
}

SMODS.PokerHand { -- Spectrum (Referenced from SixSuits)
  key = 'Spectrum',
  visible = false,
  chips = 50,
  mult = 6,
  l_chips = 20,
  l_mult = 2,
  example = {
    { 'S_2',                true },
    { 'D_7',                true },
    { 'C_3',                true },
    { 'paperback_CROWNS_5', true },
    { 'H_K',                true },
  },

  evaluate = function(parts)
    return parts.paperback_spectrum
  end
}
