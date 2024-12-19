SMODS.Joker {
    key = "furioso",
    loc_txt = {
        name = "Furioso",
        text = {
            "Each uniquely scored {C:attention}rank{}",
            "adds {X:mult,C:white}X#1#{} Mult to this Joker.",
            "Resets after defeating a {C:attention}boss blind",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)",
            "{C:inactive}(Ranks played:{C:attention}#3# {C:inactive})"
        }
    },
    config = {
        extra = {
            x_mult_mod = 0.2,
            x_mult = 1,
            ranks = {
                [0] = false,
                [1] = false,
                [2] = false,
                [3] = false,
                [4] = false,
                [5] = false,
                [6] = false,
                [7] = false,
                [8] = false,
                [9] = false,
                [10] = false,
                [11] = false,
                [12] = false
            }
        }
    },
    rarity = 2,
    pos = { x = 2, y = 0 },
    atlas = "jokers_atlas",
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    loc_vars = function(self, info_queue, center)
        local ranks_played = ""

        for k, v in pairs(center.ability.extra.ranks) do
            if v then
                if k == 11 then
                    ranks_played = ranks_played .. " J"
                elseif k == 12 then
                    ranks_played = ranks_played .. " Q"
                elseif k == 13 then
                    ranks_played = ranks_played .. " K"
                elseif k == 14 then
                    ranks_played = ranks_played .. " A"
                else
                    ranks_played = ranks_played .. " " .. k
                end
            end
        end

        if ranks_played == "" then
            ranks_played = " None"
        end

        return {
            vars = {
                center.ability.extra.x_mult_mod,
                center.ability.extra.x_mult,
                ranks_played
            }
        }
    end,

    calculate = function (self, card, context)
        -- Calculate the added x_mult depending on rank flags
        if context.individual and not context.blueprint and not context.repetition then
            if context.cardarea == G.play then
                if not context.other_card.debuff then
                    local rank
                    if context.other_card.ability.effect == 'Stone Card' then
                        rank = 0
                    else
                        rank = context.other_card:get_id()
                    end
                    if not card.ability.extra.ranks[rank] then
                        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
    
                        card.ability.extra.ranks[rank] = true

                        return {
                            extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.MULT},
                            card = card,
                        }
                    end
                end
            end
        end

        -- Give the x_mult during play
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.x_mult,
                message = localize{ type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                card = card
            }
        end

        -- If boss blind defeated, reset all rank flags and reset x_mult
        if context.end_of_round and not (context.individual or context.repetition) and G.GAME.blind.boss and not context.blueprint then
            for i=1, #card.ability.extra.ranks do
                card.ability.extra.ranks[i] = false
            end

            card.ability.extra.x_mult = 1

            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end
}
