SMODS.Joker {
    key = 'prince_of_darkness',
    loc_txt = {
        name = "Prince of Darkness",
        text = {
            "If scoring hand contains a {C:hearts}#1#{} and three",
            "unique suits, this card gains {C:mult}+#2#{} Mult,",
            "{C:chips}+#3#{} Chips, and {C:money}+#4#{} Sell Value",
            "{C:inactive}(Currently {C:mult}+#5#{} {C:inactive}Mult, {C:chips}+#6#{} {C:inactive}Chips)",
        }
    },
    config = {
        extra = {
            suit = 'Heart',
            a_mult = 3,
            a_chips = 5,
            a_sv = 1,
            mult = 0,
            chips = 0
        }
    },
    rarity = 2,
    pos = { x = 6, y = 2 },
    atlas = 'jokers_atlas',
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.suit,
                card.ability.extra.a_mult,
                card.ability.extra.a_chips,
                card.ability.extra.a_sv,
                card.ability.extra.mult,
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        -- Check if the card is not debuffed
        if not card.debuff then
            -- Check if the card is being calculated before the scoring hand is scored and not blueprinted
            if context.before and not context.blueprint then
                local unique_suits = PB_UTIL.get_unique_suits(context.scoring_hand)

                -- Count the number of unique suits
                -- local unique_suits = 0
                -- for k, v in pairs(suits) do
                -- if suits >= 0 then
                -- unique_suits = unique_suits + 1
                -- end
                -- end

                local heart_found = false
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_suit("Hearts") then
                        heart_found = true
                        break
                    end
                end

                -- Check if the scoring hand contains a Heart and three unique suits
                if heart_found and unique_suits >= 3 then
                    -- Increment the mult and chips
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.a_chips

                    -- Increment the sell value
                    if card.set_cost then
                        card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.a_sv
                        card:set_cost()
                    end

                    -- Return the upgrade text
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT,
                        card = card
                    }
                end
            end

            -- Give the mult and chips during play
            if context.joker_main then
                return {
                    message = "Scored!",
                    mult_mod = card.ability.extra.mult,
                    chip_mod = card.ability.extra.chips,
                }
            end
        end
    end
}
