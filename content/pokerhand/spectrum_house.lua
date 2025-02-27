SMODS.PokerHand { -- Spectrum House (Referenced from SixSuits)
  key = 'Spectrum House',
  above_hand = 'Flush House',
  visible = false,
  chips = 150,
  mult = 15,
  l_chips = 40,
  l_mult = 4,
  example = {
    { 'S_Q',                true },
    { 'paperback_CROWNS_Q', true },
    { 'C_Q',                true },
    { 'D_8',                true },
    { 'H_8',                true }
  },

  evaluate = function(parts)
    if #parts._3 < 1 or #parts._2 < 2 or not next(parts.paperback_spectrum) then return {} end
    return { SMODS.merge_lists(parts._all_pairs, parts.paperback_spectrum) }
  end
}
