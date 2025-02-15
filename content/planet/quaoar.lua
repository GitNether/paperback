SMODS.Consumable {
  set = 'Planet',
  atlas = 'planets_atlas',
  key = 'quaoar',

  config = {hand_type = 'paperback_Spectrum', softlock = true},
  pos = { x = 0, y = 0 },

  generate_ui = 0,
  process_loc_text = function(self)
      local target_text = G.localization.descriptions[self.set]['c_mercury'].text
      SMODS.Consumable.process_loc_text(self)
      G.localization.descriptions[self.set][self.key] = {}
      G.localization.descriptions[self.set][self.key].name = "Quaoar"
      G.localization.descriptions[self.set][self.key].text = target_text
  end
}