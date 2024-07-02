SMODS.Joker {
    key = 'pool_table',
    loc_txt = {
        name = "Pool Table",
        text = {
            "If first hand of round scores all {C:attention}non-face cards{},",
            "creates the {C:planet}Planet{} card of the played {C:attention}poker hand{}",
            "{C:inactive}(Must have room)"
        }
    },
    config = {},
    rarity = 3,
    pos = { x = 9, y = 0 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    -- Calculate function for the Joker
    calculate = function(self, card, context)
        if context.before then
            if G.GAME.current_round.hands_played == 0 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local faces = false
                -- Checks if played hand contains a face card
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_face() then faces = true end
                end
                -- If not, creates the planet card of poker hand played
                if not faces then
                    local card_type = 'Planet'
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = function()
                            local _planet = 0
                            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                                if v.config.hand_type == context.scoring_name then
                                    _planet = v.key
                                end
                            end
                            local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, _planet, nil)
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end})
                    )
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
                end
            end
        end
    end
}


-- JokerDisplay Mod Integration
if SMODS.Mods["JokerDisplay"] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_pape_pool_table"] = {
        line_1 = {
            {
                ref_table = "card.joker_display_values",
                ref_value = "active_text"
            },
            {
                ref_table = "card.joker_display_values",
                ref_value = "count"
            },
            {
                ref_table = "card.joker_display_values",
                ref_value = "active_text_pool_table",
                colour = G.C.SECONDARY_SET.Planet
            }
        },
        calc_function = function(card)
            local faces = false
            local planet_card = ""
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)

            -- Checks each card in the scoring hand for a face card
            for i = 1, #scoring_hand do
                if scoring_hand[i]:is_face() then
                    faces = true
                    break
                end
            end

            -- Gets the name of the scoring hand to be used in the description (Need a better way to get this info)
            if faces then
                planet_card = "Planet"
            elseif text == "High Card" then
                planet_card = "Pluto"
            elseif text == "Pair" then
                planet_card = "Mercury"
            elseif text == "Two Pair" then
                planet_card = "Uranus"
            elseif text == "Three of a Kind" then
                planet_card = "Venus"
            elseif text == "Straight" then
                planet_card = "Saturn"
            elseif text == "Flush" then
                planet_card = "Jupiter"
            elseif text == "Full House" then
                planet_card = "Earth"
            elseif text == "Four of a Kind" then
                planet_card = "Mars"
            elseif text == "Straight Flush" then
                planet_card = "Neptune"
            elseif text == "Five of a Kind" then
                planet_card = "Planet X"
            elseif text == "Flush House" then
                planet_card = "Ceres"
            elseif text == "Flush Five" then
                planet_card = "Eris"
            end

            -- Determines if the Joker's ability is active
            card.joker_display_values.active = G.GAME and G.GAME.current_round.hands_played == 0
            card.joker_display_values.active_text = card.joker_display_values.active and "+" or "(Inactive)"

            -- If Joker's ability is active, display ability effect
            if card.joker_display_values.active then
                card.joker_display_values.count = faces and 0 or 1
                card.joker_display_values.active_text_pool_table = " " .. planet_card

                -- If no cards selected, display no planets gained
                if #scoring_hand == 0 then
                    card.joker_display_values.count = 0
                    card.joker_display_values.active_text_pool_table = " Planet"
                end
            -- Otherwise, if inactive, do not display count or gained planet card
            else
                card.joker_display_values.count = ""
                card.joker_display_values.active_text_pool_table = ""
            end
        end,

        -- Sets the color of the description to be inactive text when ability not active
        style_function = function(card, line_1, line_2)
            if line_1 then
                line_1.children[1].config.colour = card.joker_display_values.active and G.C.UI.TEXT_LIGHT or G.C.UI.TEXT_INACTIVE
            end
            return false
        end
    }
end