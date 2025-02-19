SMODS.Tag {
  key = 'angel_investment',
  config = {
    money = 1,
    every = 5
  },
  atlas = 'tags_atlas',
  pos = { x = 0, y = 0 },
  discovered = true,

  loc_vars = function(self, info_queue)
    local dollars = math.floor(G.GAME.dollars / self.config.every * self.config.money)
    return {
      vars = {
        self.config.money,
        self.config.every,
        math.max(0, dollars)
      }
    }
  end,

  apply = function(self, tag, context)
    if context.type == 'immediate' then
      tag:yep('+', G.C.MONEY, function()
        return true
      end)

      G.E_MANAGER:add_event(Event {
        trigger = 'immediate',
        func = function()
          local dollars = math.floor(G.GAME.dollars / self.config.every * self.config.money)
          ease_dollars(math.max(0, dollars), true)
          return true
        end
      })

      tag.triggered = true
    end
  end
}
