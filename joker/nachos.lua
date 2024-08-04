SMODS.Joker {
    key = 'nachos',
    loc_txt = {
        name = "Nachos",
        text = {
            "{X:chips,C:white}X#1#{} Chips,",
            "loses {X:chips,C:white}X#2#{} Chips",
            "per {C:attention}card{} discarded"
        }
    },
    config = {
        extra = {
            X_chips = 2,
            reduction_amount = 0.05,
        }
    },
    rarity = 2,
    pos = { x = 9, y = 1 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    soul_pos = nil,

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.X_chips = card.ability.extra.X_chips or 1
        card.ability.extra.reduction_amount = 0.05
    end,

    loc_vars = function(self, info_queue, center) 
            return {
                vars = {
                    center.ability.extra.X_chips,
                    center.ability.extra.reduction_amount
                }
            }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            xChips(card.ability.extra.X_chips, card)

        elseif context.discard then
            if not context.blueprint then
                if card.ability.extra.X_chips - card.ability.extra.reduction_amount <= 1 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                    return true; end}))
                            return true
                        end
                    }))
                    return {
                        message = localize('k_eaten_ex'),
                        colour = G.C.FILTER
                    }
                else
                    card.ability.extra.X_chips = card.ability.extra.X_chips - card.ability.extra.reduction_amount
                    return {
                        delay = 0.2,
                        message = localize{type='variable',key='a_xmult_minus',vars={card.ability.extra.reduction_amount}},
                        colour = G.C.CHIPS
                    }
                end
            end
        end
    end
}

-- JokerDisplay mod integration
if SMODS.Mods["JokerDisplay"] then
    jd_def = JokerDisplay.Definitions

    jd_def["j_pape_nachos"] = {
        line_1 = {
            {
                border_nodes = {
                    {
                        text = "X"
                    },
                    {
                        ref_table = "card.ability.extra",
                        ref_value = "X_chips"
                    },
                    colour = G.C.CHIPS
                },
                border_colour = G.C.CHIPS
            }
        }
    }
end


-- xChips functions from @PT_Cerlo on Discord
function xChips(amt,card)
    hand_chips = mod_chips(hand_chips * (amt or 1))
    update_hand_text(
        {delay = 0},
        {chips = hand_chips}
    )
    card_eval_status_text(card, 'x_chips', amt, percent)
end

function card_eval_status_text(card, eval_type, amt, percent, dir, extra)
    percent = percent or (0.9 + 0.2*math.random())
    if dir == 'down' then 
        percent = 1-percent
    end

    if extra and extra.focus then card = extra.focus end

    local text = ''
    local sound = nil
    local volume = 1
    local card_aligned = 'bm'
    local y_off = 0.15*G.CARD_H
    if card.area == G.jokers or card.area == G.consumeables then
        y_off = 0.05*card.T.h
    elseif card.area == G.hand then
        y_off = -0.05*G.CARD_H
        card_aligned = 'tm'
    elseif card.area == G.play then
        y_off = -0.05*G.CARD_H
        card_aligned = 'tm'
    elseif card.jimbo  then
        y_off = -0.05*G.CARD_H
        card_aligned = 'tm'
    end
    local config = {}
    local delay = 0.65
    local colour = config.colour or (extra and extra.colour) or ( G.C.FILTER )
    local extrafunc = nil

    if eval_type == 'debuff' then 
        sound = 'cancel'
        amt = 1
        colour = G.C.RED
        config.scale = 0.6
        text = localize('k_debuffed')
    elseif eval_type == 'chips' then 
        sound = 'chips1'
        amt = amt
        colour = G.C.CHIPS
        text = localize{type='variable',key='a_chips',vars={amt}}
        delay = 0.6
    elseif eval_type == 'mult' then 
        sound = 'multhit1'--'other1'
        amt = amt
        text = localize{type='variable',key='a_mult',vars={amt}}
        colour = G.C.MULT
        config.type = 'fade'
        config.scale = 0.7
    elseif (eval_type == 'x_mult') or (eval_type == 'h_x_mult') then 
        sound = 'multhit2'
        volume = 0.7
        amt = amt
        text = localize{type='variable',key='a_xmult',vars={amt}}
        colour = G.C.XMULT
        config.type = 'fade'
        config.scale = 0.7
    elseif eval_type == 'h_mult' then 
        sound = 'multhit1'
        amt = amt
        text = localize{type='variable',key='a_mult',vars={amt}}
        colour = G.C.MULT
        config.type = 'fade'
        config.scale = 0.7
    elseif eval_type == 'x_chips' then
        sound = 'chips1'
        amt = amt
        text = "X" .. amt .. " Chips"
        colour = G.C.CHIPS
        config.type = 'fade'
        config.scale = 0.7
    elseif eval_type == 'dollars' then 
        sound = 'coin3'
        amt = amt
        text = (amt <-0.01 and '-' or '')..localize("$")..tostring(math.abs(amt))
        colour = amt <-0.01 and G.C.RED or G.C.MONEY
    elseif eval_type == 'swap' then 
        sound = 'generic1'
        amt = amt
        text = localize('k_swapped_ex')
        colour = G.C.PURPLE
    elseif eval_type == 'extra' or eval_type == 'jokers' then 
        sound = extra.edition and 'foil2' or extra.mult_mod and 'multhit1' or extra.Xmult_mod and 'multhit2' or 'generic1'
        if extra.edition then 
            colour = G.C.DARK_EDITION
        end
        volume = extra.edition and 0.3 or sound == 'multhit2' and 0.7 or 1
        delay = extra.delay or 0.75
        amt = 1
        text = extra.message or text
        if not extra.edition and (extra.mult_mod or extra.Xmult_mod)  then
            colour = G.C.MULT
        end
        if extra.chip_mod then
            config.type = 'fall'
            colour = G.C.CHIPS
            config.scale = 0.7
        elseif extra.swap then
            config.type = 'fall'
            colour = G.C.PURPLE
            config.scale = 0.7
        else
            config.type = 'fall'
            config.scale = 0.7
        end
    end
    delay = delay*1.25

    if amt > 0 or amt < 0 then
        if extra and extra.instant then
            if extrafunc then extrafunc() end
            attention_text({
                text = text,
                scale = config.scale or 1, 
                hold = delay - 0.2,
                backdrop_colour = colour,
                align = card_aligned,
                major = card,
                offset = {x = 0, y = y_off}
            })
            play_sound(sound, 0.8+percent*0.2, volume)
            if not extra or not extra.no_juice then
                card:juice_up(0.6, 0.1)
                G.ROOM.jiggle = G.ROOM.jiggle + 0.7
            end
        else
            G.E_MANAGER:add_event(Event({ --Add bonus chips from this card
                    trigger = 'before',
                    delay = delay,
                    func = function()
                    if extrafunc then extrafunc() end
                    attention_text({
                        text = text,
                        scale = config.scale or 1, 
                        hold = delay - 0.2,
                        backdrop_colour = colour,
                        align = card_aligned,
                        major = card,
                        offset = {x = 0, y = y_off}
                    })
                    play_sound(sound, 0.8+percent*0.2, volume)
                    if not extra or not extra.no_juice then
                        card:juice_up(0.6, 0.1)
                        G.ROOM.jiggle = G.ROOM.jiggle + 0.7
                    end
                    return true
                    end
            }))
        end
    end
    if extra and extra.playing_cards_created then 
        playing_card_joker_effects(extra.playing_cards_created)
    end
end