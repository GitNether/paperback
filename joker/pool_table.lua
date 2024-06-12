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
    cost = 10,
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
