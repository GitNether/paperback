SMODS.Joker {
    key = "bicycle",
    loc_txt = {
        name = "Bicycle",
        text = {
            "{C:attention}Wild Face Cards{} give",
            "{X:mult,C:white}X#1#{} Mult when scored"
        }
    },
    config = {
        extra = {
            x_mult = 1.5
        }
    },
    rarity = 1,
    pos = { x = 2, y = 2 },
    atlas = "jokers_atlas",
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    enhancement_gate = "m_wild",

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild

        return {
            vars = {
                center.ability.extra.x_mult
            }
        }
    end,

    calculate = function (self, card, context)
        if context.individual then
            if context.cardarea == G.play then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = card,
                    }
                elseif context.other_card:is_face() and context.other_card.ability.name == 'Wild Card' then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        card = card
                    }
                end
            end
        end
    end
}
