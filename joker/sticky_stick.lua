SMODS.Joker {
    key = 'sticky_stick',
    loc_txt = {
        name = "Sticky Stick",
        text = {
            "Gives {X:mult,C:white}X#1#{} Mult for every",
            "other {C:attention}\"Stick\"{} Joker you have..."
        }
    },
    config = {
        extra = {
            xMult = 1
        }
    },
    rarity = 2,
    pos = { x = 5, y = 3 },
    atlas = 'jokers_atlas',
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,
    yes_pool_flag = "sticks_can_spawn",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xMult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local xMult = card.ability.extra.xMult
            for i = 1, #G.jokers.cards do
                local current_card = G.jokers.cards[i]
                if current_card ~= card and string.match(string.lower(current_card.ability.name), "%f[%w]stick%f[%W]") then
                    xMult = xMult + card.ability.extra.xMult
                end
            end

            return {
                message = localize{ type = 'variable', key = 'a_xmult', vars = { xMult } },
                Xmult_mod = xMult,
                card = card
            }
        end
    end
}