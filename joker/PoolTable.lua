-- SMODS.Atlas {  
--     key = 'jokers_atlas',
--     px = 71,
--     py = 95,
--     path = 'Jokers.png'
-- }

SMODS.Joker {
    key = 'pooltable',
    loc_txt = {
        name = "Pool Table",                                --name used by the joker
        text = {
            "If first hand of round scores all {C:attention}non-face cards{},",
            "creates the {C:planet}Planet{} card of the played {C:attention}poker hand{}",
            "{C:inactive}(Must have room)"
        }
    },
    config = {}, --variables used for abilities and effects.
    rarity = 2,                                         --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    pos = { x = 9, y = 0 },                             --pos in spirtesheet 0,0 for single sprites or the first sprite in the spritesheet
    atlas = 'jokers_atlas',                                        --defines the atlas that you want to use for the sprite sheet. atlas=nil if you want to use single sprites
    cost = 6,                                           --cost to buy the joker in shops
    unlocked = true,                                    --joker is unlocked by default
    discovered = true,                                  --joker is discovered by default
    blueprint_compat = true,                            --does joker work with blueprint
    eternal_compat = true,                              --can joker be eternal
    soul_pos = nil,                            --pos of a soul sprite.

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
                        end}))
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
                end
            end
        end
    end
}
