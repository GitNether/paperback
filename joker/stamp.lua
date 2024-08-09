SMODS.Joker {
    key = "stamp",
    loc_txt = {
        name = "Stamp",
        text = {
            "{C:chips}+#1#{} Chips when any card with",
            "a {C:attention}seal{} is scored"
        }
    },
    config = {
        extra = {
            chips = 25
        }
    },
    rarity = 3,
    pos = { x = 8, y = 0 },
    atlas = "jokers_atlas",
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    -- Sets the sprite and hitbox
    set_ability = function(self, card, initial, delay_sprites)
        local w_scale, h_scale = 35/71, 45/95

        card.T.h = card.T.h * h_scale
        card.T.w = card.T.w * w_scale
    end,

    set_sprites = function(self, card, front)
        local w_scale, h_scale = 35/71, 45/95

        card.children.center.scale.y = card.children.center.scale.y * h_scale
        card.children.center.scale.x = card.children.center.scale.x * w_scale
    end,

    load = function(self, card, card_table, other_card)
        local w_scale, h_scale = 35/71, 45/95
        
        card.T.h = card.T.h * h_scale
        card.T.w = card.T.w * w_scale
    end,
    -----------------------------

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.chips
            }
        }
    end,

    calculate = function (self, card, context)
        if context.individual then
            if context.cardarea == G.play then
                if context.other_card:get_seal() then
                    return {
                        chips = card.ability.extra.chips,
                        card = card
                    }
                end
            end
        end
    end
}


-- JokerDisplay mod integration
if SMODS.Mods["JokerDisplay"] and _G["JokerDisplay"] then
    jd_def = JokerDisplay.Definitions

    jd_def["j_pape_soft_taco"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = 'card.ability.extra', ref_value = 'x_mult' },
                },
            }
        }
    }
end