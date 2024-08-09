SMODS.Joker {
    key = "stamp",
    loc_txt = {
        name = "Stamp",
        text = {
            "{C:chips}+#1#{} Chips when any card with",
            "a {C:important}seal{} is scored"
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

    set_ability = function(self, card, initial, delay_sprites)
        local X, Y, W, H = card.T.x, card.T.y, card.T.w, card.T.h

        W = W - 0.1

        card.T.w = W
    end,

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


-- local set_sprites_ref = Card.set_sprites
-- function Card:set_sprites(_center, _front)
--     set_sprites_ref(self, _center, _front)

--     if _center and _center.set then
--         if _center.name == "j_pape_stamp" then
--             -- self.children.center.scale.y = self.children.center.scale.y/1.7
--             -- self.children.center.scale.x = self.children.center.scale.x - 18
--         end
--     end
-- end


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