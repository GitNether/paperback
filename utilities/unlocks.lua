-- Disable blind
local disable_ref = Blind.disable
function Blind.disable(self)
  check_for_unlock { blind_disabled = self.config.blind.key }
  return disable_ref(self)
end

-- Set cost
local set_cost_ref = Card.set_cost
function Card.set_cost(self)
  local ret = set_cost_ref(self)
  check_for_unlock { set_card_cost = true, card = self }
  return ret
end
