SMODS.Joker {
    key = "let_it_happen",
    loc_txt = {
        name = "Let it Happen",
        text = {
            "If hand has not been played this Ante,",
            "balance {C:mult}mult{} and {C:chips}chips{}",
            "{C:inactive}(Hands played:{C:attention}#1# {C:inactive})"

        }
    },
    config = {
        extra = {
            hands_played_this_ante = {},
        }
    },
    rarity = 3,
    pos = { x = 7, y = 2 },
    atlas = "jokers_atlas",
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    loc_vars = function(self, info_queue, center)
        local hands_played_string = ""

        for i = 1, #center.ability.extra.hands_played_this_ante do
            if i == 1 then
                hands_played_string = hands_played_string .. " "
            else
                hands_played_string = hands_played_string .. ", "
            end
            
            hands_played_string = hands_played_string .. center.ability.extra.hands_played_this_ante[i]
        end

        if hands_played_string == "" then
            hands_played_string = " None"
        end

        return {
            vars = {
                hands_played_string
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            -- Return early if hand has already been played this ante
            for i = 1, #card.ability.extra.hands_played_this_ante do
                if context.scoring_name == card.ability.extra.hands_played_this_ante[i] then
                    return
                end
            end

            -- Balance the chips if the hand is not debuffed
            local tot = hand_chips + mult
            if not context.debuffed_hand then
                hand_chips = mod_chips(math.floor(tot / 2))
                mult = mod_mult(math.floor(tot / 2))
                update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })

                table.insert(card.ability.extra.hands_played_this_ante, context.scoring_name)

                -- Return balanced message
                return {
                    message = localize('k_balanced'),
                    colour = { 0.8, 0.45, 0.85, 1 }
                }
            end
        end

        -- Reset the joker at the end of the ante
        if context.end_of_round and not (context.individual or context.repetition) and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.hands_played_this_ante = {}

            return {
                message = localize('k_reset'),
                colour = { 0.8, 0.45, 0.85, 1 }
            }
        end

    end
}