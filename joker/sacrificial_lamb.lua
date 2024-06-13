SMODS.Joker {
    key = 'sacrificial_lamb',
    loc_txt = {
        name = "Sacrificial Lamb",
        text = {
            "Gains {C:mult}+5 Mult{} when",
            "for each card {C:attention}sold{}",
            "{C:inactive}(Currently gives {}{C:mult}+#1#{} {C:inactive}Mult){}"
        }
    },
    config = { extra = { Xmult_mod = 5, mult = 0 } },
    rarity = 2,
    pos = { x = 5, y = 0 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.mult = card.ability.extra.mult or 0
        card.ability.extra.mult_mod = 5
    end,

    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.mult, center.ability.extra.x_mult} }
    end,
    
    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        end
        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    mult_mod = card.ability.extra.mult,
                    card = self,
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
                }
            end
        end
    end,
}