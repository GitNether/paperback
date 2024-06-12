SMODS.Joker {
    key = 'calling_card',
    loc_txt = {
        name = "Calling Card",
        text = {
            "This Joker gains {X:red,C:white}#1#X{} Mult",
            "whenever you defeat a {C:attention}Boss Blind{}",
            "or trigger its {C:attention}ability{}",
            "{C:inactive}(Currently {}{X:red,C:white}#2#X{}{C:inactive} Mult){}"
        }
    },
    config = { extra = { Xmult_mod = 0.25, x_mult = 1 } },
    rarity = 2,
    pos = { x = 0, y = 0 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.x_mult = card.ability.extra.x_mult or 1
        card.ability.extra.Xmult_mod = 0.25
    end,

    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.Xmult_mod, center.ability.extra.x_mult} }
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and G.GAME.blind.boss and not self.gone then
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.Xmult_mod
        end
        if context.joker_main then
            if G.GAME.blind.triggered and not context.blueprint and not context.individual and not context.repetition then 
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.Xmult_mod
            end
            if card.ability.extra.x_mult > 1 then
                return {
                    Xmult_mod = card.ability.extra.x_mult,
                    card = self,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } }
                }
            end
        end
    end,
}