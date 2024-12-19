SMODS.Joker {
    key = "summoning_circle",
    loc_txt = {
        name = "Summoning Circle",
        text = {
            "If played hand contains a {C:attention}Five of a Kind{},",
            "create a copy of a {C:attention}random consumeable{}",
            "{C:inactive}(Must have room)"
        }
    },
    rarity = 3,
    pos = { x = 1, y = 0 },
    atlas = "jokers_atlas",
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    calculate = function (self, card, context)
        if not card.debuff then
            if context.before then
                if context.scoring_name == "Five of a Kind" or context.scoring_name == "Flush Five" then
                    -- Check if there is room to copy a card
                    if G.consumeables.cards[1] and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        -- Add the card to G.consumeables
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local copied_card = pseudorandom_element(G.consumeables.cards, pseudoseed('summoning_circle'))
                                copied_card = copy_card(copied_card, nil, nil, nil, copied_card.edition and copied_card.edition.negative)
                                copied_card:add_to_deck()
                                G.consumeables:emplace(copied_card)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
                    end
                end
                return
            end
        end
    end
}
