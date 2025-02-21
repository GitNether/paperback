SMODS.Tag {
  key = 'dichrome',
  atlas = 'tags_atlas',
  pos = { x = 1, y = 0 },
  discovered = true,

  loc_vars = function(self, info_queue)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_paperback_dichrome
  end,

  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' and not context.card.edition and not context.card.temp_edition then
      if context.card.ability.set == 'Joker' then
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card:set_edition('e_paperback_dichrome', true)
          context.card.ability.couponed = true
          context.card:set_cost()
          context.card.temp_edition = nil
          return true
        end)
      end

      tag.triggered = true
      return true
    end
  end
}
