-- Only load our breaking tag if the one from Bunco isn't loaded
if SMODS.Tags.tag_bunc_breaking then return end

SMODS.Tag {
  key = 'breaking',
  atlas = 'tags_atlas',
  pos = { x = 4, y = 0 },
  discovered = true,

  apply = function(self, tag, context)
    if context.type == 'round_start_bonus' and G.GAME.blind.boss then
      tag:yep('+', G.C.DARK_EDITION, function()
        G.GAME.blind:disable()
        return true
      end)

      tag.triggered = true
      return true
    end
  end
}
