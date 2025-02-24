-- Disable blind
local disable_ref = Blind.disable
function Blind.disable(self)
  check_for_unlock { blind_disabled = self.config.blind.key }
  return disable_ref(self)
end
