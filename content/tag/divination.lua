SMODS.Tag {
  key = 'divination',
  atlas = 'tags_atlas',
  pos = { x = 2, y = 0 },
  discovered = true,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      tag:yep('+', G.C.PAPERBACK_MINOR_ARCANA, function()
        PB_UTIL.open_booster_pack('p_paperback_minor_arcana_mega')
        return true
      end)

      tag.triggered = true
      return true
    end
  end
}
