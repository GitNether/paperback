SMODS.Atlas {  
    key = 'callingcardimg',
    px = 71,
    py = 95,
    path = 'CallingCard.png'
}

SMODS.Joker {
    key = 'callingcard',
    loc_txt = {
        name = "Calling Card",                                --name used by the joker
        text = {
            "Whenever you defeat a {C:attention}Boss Blind{} or activate its {C:attention}effect{}, this Joker gains {X:red,C:white}0.25X{}",             --description text.		
            "{C:inactive}(currently gives {}{X:red,C:white}#2#X{}{C:inactive} Mult){}"                       --more than 5 lines look odd
        }
    },
    config = { extra = { mult = 0, x_mult = 1 } }, --variables used for abilities and effects.
    rarity = 2,                                         --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    pos = { x = 0, y = 0 },                             --pos in spirtesheet 0,0 for single sprites or the first sprite in the spritesheet
    atlas = 'callingcardimg',                                        --defines the atlas that you want to use for the sprite sheet. atlas=nil if you want to use single sprites
    cost = 6,                                           --cost to buy the joker in shops
    unlocked = true,                                    --joker is unlocked by default
    discovered = true,                                  --joker is discovered by default
    blueprint_compat = true,                            --does joker work with blueprint
    eternal_compat = true,                              --can joker be eternal
    soul_pos = nil,                            --pos of a soul sprite.

    calculate = function(self, context)                 --define calculate functions here
        if G.GAME.blind.triggered and not context.blueprint then 
            card.ability.extra.x_mult = card.ability.extra.x_mult + 0.25
        end
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and G.GAME.blind.boss and not self.gone then
            card.ability.extra.x_mult = card.ability.extra.x_mult + 0.25
        end
        if SMODS.end_calculate_context(context) then
            return {
                Xmult_mod = card.ability.extra.x_mult,
                card = self,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } }
            }
        end
    end,

    loc_vars = function(self,info_queue,center) --defines variables to use in the UI. you can use #1# for example to show the mult variable, and #2# for x_mult
        return { vars = {center.ability.extra.mult, center.ability.extra.x_mult} }
    end,
}
