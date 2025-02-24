return {
  descriptions = {
    Back = {
      b_paperback_paper = {
        name = "Paper Deck",
        text = {
          "{C:legendary}Paperback{C:attention} Jokers{} are {C:attention}3x",
          "more likely to appear"
        }
      },
      b_paperback_proud = {
        name = "Proud Deck",
        text = {
          "Start with a full set of",
          "{C:hearts}Hearts{}, {C:diamonds}Diamonds{}, {C:spades}Spades",
          "{C:clubs}Clubs{}, {C:paperback_crowns}Crowns{} and {C:paperback_stars}Stars"
        }
      },
      b_paperback_silver = {
        name = "Silver Deck",
        text = {
          "Start run with the",
          "{C:paperback_minor_arcana,T:v_paperback_celtic_cross}#1#{} voucher",
          "and a {C:paperback_minor_arcana,T:c_paperback_nine_of_cups}#2#"
        }
      }
    },
    Joker = {
      j_paperback_b_soda = {
        name = "B-Soda",
        text = {
          "When {C:attention}Blind{} is selected,",
          "gain {C:chips}+#1#{} Hand",
          "Consumed if {C:attention}Blind{} is",
          "cleared with {C:chips}0{} hands",
          "remaining",
        }
      },
      j_paperback_angel_investor = {
        name = "Angel Investor",
        text = {
          "Skipping a {C:attention}blind{} gives",
          "an {C:attention}Angel Investment Tag"
        }
      },
      j_paperback_ice_cube = {
        name = "Ice Cube",
        text = {
          "{X:mult,C:white}X#1#{} Mult for every",
          "{C:attention}Food Joker{} you have",
          "Melts in {C:attention}#2#{} rounds",
          "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
        }
      },
      j_paperback_champagne = {
        name = "Champagne",
        text = {
          "During a {C:attention}Boss Blind{}, scored",
          "cards earn {C:money}$#1#{}, {C:attention}doubled{} if",
          "the card has a {C:attention}seal",
          "{C:attention}Consumed{} in {C:attention}#2#{} rounds"
        }
      },
      j_paperback_pocket_pair = {
        name = "Pocket Pair",
        text = {
          "Earn {C:money}$#1#{} per {C:attention}#2#{} drawn",
          "at the start of round"
        }
      },
      j_paperback_alert = {
        name = "Alert",
        text = {
          "If {C:attention}played hand{} is a single",
          "{C:attention}face card{}, destroy it",
          "{C:inactive}(#1#/#2#)?"
        }
      },
      j_paperback_legacy = {
        name = "Legacy",
        text = {
          "When a non {C:attention}Enhanced card{} is",
          "destroyed, adds its {C:chips}chip value",
          "as {C:mult}mult{} to this card",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
        }
      },
      j_paperback_backpack = {
        name = "Backpack",
        text = {
          "{C:money}Shops{} have an additional",
          "free {C:attention}Buffoon Pack"
        }
      },
      j_paperback_jester_of_nihil = {
        name = "Jester of Nihil",
        text = {
          "{C:attention}Debuffs{} the suit of the {C:attention}last",
          "{C:attention}scored{} card and gives {C:mult}+#1#{} Mult",
          "for every {C:attention}debuffed{} card",
          "{C:inactive}(Currently {V:1}#2#{C:inactive} and {C:mult}+#3#{C:inactive} Mult)",
        }
      },
      j_paperback_forgery = {
        name = "Forgery",
        text = {
          "Copies ability of a random {C:attention}Joker",
          "every hand, if it provides {X:mult,C:white}XMult{},",
          "{C:mult}Mult{} or {C:chips}Chips{}, multiply its values",
          "between {X:attention,C:white}X#1#{} and {X:attention,C:white}X#2#",
          "{C:inactive}(Currently {C:attention}#3#{C:inactive} at {X:attention,C:white}X#4#{C:inactive})"
        }
      },
      j_paperback_the_world = {
        name = "The World",
        text = {
          "All {C:chips}hands{} and {C:mult}discards{} are",
          "considered the {C:attention}first{} and",
          "{C:attention}last{} of round"
        }
      },
      j_paperback_epic_sauce = {
        name = "Epic Sauce",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "Destroy a random {C:attention}Joker{}",
          "if played hand is not",
          "the {C:attention}first hand{} of round"
        }
      },
      j_paperback_find_jimbo = {
        name = "Find Jimbo",
        text = {
          "After a hand is scored,",
          "each played {C:attention}#1#{} of",
          "{V:1}#2#{} earns {C:money}$#3#{}",
          "{s:0.8}Card changes every round"
        },
      },
      j_paperback_cream_liqueur = {
        name = "Cream Liqueur",
        text = {
          "{C:attention}Tags{} earn {C:money}$#1#{} when activated",
          "{C:green}#2# in #3#{} chance this card is",
          "consumed at end of round"
        }
      },
      j_paperback_coffee = {
        name = "Coffee",
        text = {
          "{C:attention}+#1#{} hand size,",
          "increases by {C:attention}#2#{} when {C:attention}Blind{} is skipped.",
          "{C:green}#3# in #4#{} chance this card is consumed when",
          "{C:attention}Small Blind{} or {C:attention}Big Blind{} is selected",
        }
      },
      j_paperback_basic_energy = {
        name = "Basic Joker Energy",
        text = {
          "Using any {C:attention}Consumable{} has a",
          "{C:green}#1# in #2#{} chance to make a copy",
          "{C:inactive}(Cannot make copy of a copy)",
          "{C:inactive}(Must have room)"
        }
      },
      j_paperback_big_misser = {
        name = "Big Misser",
        text = {
          "{X:mult,C:white}X#1#{} Mult for each empty",
          "consumable slot",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)"
        }
      },
      j_paperback_complete_breakfast = {
        name = "Complete Breakfast",
        text = {
          "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
          "{C:green}#3# in #4#{} chance this card is",
          "eaten after played hand",
          "Chance increases by {C:attention}#5#{} after",
          "every played hand",
        },
      },
      j_paperback_emergency_broadcast = {
        name = "Emergency Broadcast",
        text = {
          "Scored {C:attention}5s{} and {C:attention}8s{} provide",
          "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
        },
      },
      j_paperback_moribund = {
        name = "Moribund",
        text = {
          "This Joker gains {C:mult}+#1#{} Mult when a {C:attention}blind",
          "is cleared with {C:attention}0{C:chips} hands{} remaining.",
          "Doubles its {C:mult}Mult{} if blind is not cleared",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
        },
      },
      j_paperback_crispy_taco = {
        name = "Crispy Taco",
        text = {
          "{X:chips,C:white}X#1#{} Chips. {C:green}#2# in #3#{} chance this card",
          "is eaten at end of round.",
        },
      },
      j_paperback_furioso = {
        name = "Furioso",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult for",
          "each uniquely scored {C:attention}rank{}.",
          "Resets after defeating a {C:attention}boss blind",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)",
          "{C:inactive}(Ranks played:{C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_soft_taco = {
        name = "Soft Taco",
        text = {
          "{X:mult,C:white}X#1#{} Mult. {C:green}#2# in #3#{} chance this card",
          "is eaten at end of round.",
        },
      },
      j_paperback_charred_marshmallow = {
        name = "Charred Marshmallow",
        text = {
          "Scored {C:spades}Spades{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_joker_cookie = {
        name = "Joker Cookie",
        text = {
          "Earn {C:money}$#1#{} at end of round",
          "Payout increases by {C:money}$#2#{} when cashing out",
          "{C:green}#3# in #4#{} chance this card",
          "is eaten at end of round",
        },
      },
      j_paperback_pop_stick = {
        name = "Pop-Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "other {C:attention}\"Stick\"{} Joker you have...",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_pool_table = {
        name = "Pool Table",
        text = {
          "If first hand of round",
          "scores no {C:attention}face cards{},",
          "create the {C:planet}Planet{} card of",
          "the played {C:attention}poker hand",
          "{C:inactive}(Must have room)",
        },
      },
      j_paperback_bicycle = {
        name = "Bicycle",
        text = {
          "{C:attention}Wild Cards{} give {C:mult}Mult",
          "equal to their {C:chips}Chip Bonus{},",
          "then {X:mult,C:white}X#1#{} Mult",
        },
      },
      j_paperback_stamp = {
        name = "Stamp",
        text = {
          "{C:green}#1# in #2#{} chance this",
          "Joker gains {C:chips}+#3#{} Chips when",
          "any card with a {C:attention}seal{} is scored",
          "{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips)",
        },
      },
      j_paperback_sticky_stick = {
        name = "Sticky Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "other {C:attention}\"Stick\"{} Joker you have...",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_shopping_center = {
        name = "Shopping Center",
        text = {
          "{C:money}Shops{} have an additional",
          "{C:attention}card slot",
        },
      },
      j_paperback_ghost_cola = {
        name = "Ghost Cola",
        text = {
          "Sell this card to create a {C:attention}#1#{}",
          "and a random {C:dark_edition}Negative{} {C:spectral}Spectral{} card.",
        },
      },
      j_paperback_river = {
        name = "River",
        text = {
          "If played hand contains {C:attention}5 scoring",
          "{C:attention}cards{} earn the lowest scoring",
          "card's {C:chips}Chip Bonus{} as {C:money}Money",
          "{C:inactive}(Max of {C:money}$#1#{C:inactive})",
        },
      },
      j_paperback_solemn_lament = {
        name = "Solemn Lament",
        text = {
          "Retrigger {C:attention}first{} scored card",
          "{C:attention}once{} for every remaining",
          "{C:chips}hand{} or {C:mult}discard{}",
          "{C:inactive}(The lowest of the two)",
        },
      },
      j_paperback_hole_in_one = {
        name = "Hole in One",
        text = {
          "If first {C:chips}hand{} of round cleared the",
          "{C:attention}blind{}, double the {C:attention}sell value{} of all {C:attention}cards",
          "{C:inactive}(Max of {C:money}$#1#{C:inactive} per round)",
          "When this card is sold, set the {C:attention}sell",
          "{C:attention}value{} of all {C:attention}cards{} to {C:money}$0"
        },
      },
      j_paperback_mismatched_sock = {
        name = "Mismatched Sock",
        text = {
          "This Joker gains {C:mult}+#1#{} Mult",
          "if played hand contains no {C:attention}pairs{}",
          "{C:inactive}(Currently {C:mult}+#2# {C:inactive}Mult)",
        },
      },
      j_paperback_quick_fix = {
        name = "Quick Fix",
        text = {
          "{C:attention}+#1#{} hand size",
          "{C:green}#2# in #3#{} chance this",
          "card is destroyed",
          "at end of round",
        },
        unlock = {
          "Have a hand size",
          "of {C:attention}10{} or more cards"
        }
      },
      j_paperback_skydiver = {
        name = "Skydiver",
        text = {
          "{C:white,X:mult}X#1#{} Mult if all {C:attention}scored cards{} are less",
          "than or equal to the {C:attention}lowest ranked",
          "card scored this round",
          "{C:inactive}(Updates at end of played hand{C:inactive})",
          "{C:inactive}(Currently: {C:attention}#2#{C:inactive})",
        },
      },
      j_paperback_blue_bonnets = {
        name = "Blue Bonnets",
        text = {
          "{C:clubs}Clubs{} give {X:mult,C:white}X#1#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#2#{} Mult for each ",
          "consecutively scored {C:clubs}Club{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_great_wave = {
        name = "Great Wave",
        text = {
          "Retrigger {C:attention}rightmost{} scored card",
          "{C:attention}once{} for every {C:attention}played card{}",
        },
      },
      j_paperback_caramel_apple = {
        name = "Caramel Apple",
        text = {
          "Scored {C:clubs}Clubs{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_nachos = {
        name = "Nachos",
        text = {
          "{X:chips,C:white}X#1#{} Chips,",
          "loses {X:chips,C:white}X#2#{} Chips",
          "per {C:attention}card{} discarded",
        },
      },
      j_paperback_pride_flag_spectrums = {
        name = "Pride Flag",
        text = {
          "Gains {C:chips}+#1#{} Chips if the played",
          "hand contains a {C:attention}Spectrum",
          "Resets if the played hand",
          "contains a {C:attention}Straight",
          "{C:inactive}(Currently {C:chips}+#2#{} {C:inactive}Chips)"
        },
      },
      j_paperback_pride_flag_no_spectrums = {
        name = "Pride Flag",
        text = {
          "Gains {C:mult}+#1#{} Mult if scored hand",
          "contains {C:attention}three{} unique suits",
          "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult)",
        },
      },
      j_paperback_sacrificial_lamb = {
        name = "Sacrificial Lamb",
        text = {
          "Gains {C:mult}+#1#{} Mult for",
          "each card or Joker {C:attention}destroyed",
          "{C:inactive}(Currently {C:mult}+#2# {C:inactive}Mult)",
        },
      },
      j_paperback_autumn_leaves = {
        name = "Autumn Leaves",
        text = {
          "{C:diamonds}Diamonds{} give {X:mult,C:white}X#1#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#2#{} Mult for each ",
          "consecutively scored {C:diamonds}Diamond{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_wild_prize = {
        name = "[[WILD PRIZE!1!]]",
        text = {
          "{C:attention}Wild Cards{} have a {C:green}#1# in #2#{} chance",
          "to be {C:attention}retriggered{} and a {C:green}#1# in #3#{} chance",
          "to earn between {C:money}$#4#{} and {C:money}$#5#{} when scored",
        },
      },
      j_paperback_wish_you_were_here = {
        name = "Wish You Were Here",
        text = {
          "Gives {C:mult}Mult{} equal to {C:mult}#1#X{} the",
          "{C:attention}sell value{} of this card.",
          "Gains {C:money}$#2#{} of {C:attention}sell value{} at",
          "end of round",
          "{C:inactive}(Currently {C:mult}+#3# {C:inactive}Mult){}",
        },
      },
      j_paperback_calling_card = {
        name = "Calling Card",
        text = {
          "This Joker gains {X:red,C:white}X#1#{} Mult",
          "whenever you defeat a {C:attention}Boss Blind{}",
          "or trigger its {C:attention}ability{}",
          "{C:inactive}(Currently {}{X:red,C:white}X#2#{}{C:inactive} Mult){}",
        },
        unlock = {
          "Disable the",
          "{C:attention}Crimson Heart",
          "boss blind"
        }
      },
      j_paperback_subterfuge = {
        name = "Subterfuge",
        text = {
          "Destroys the {C:attention}first played",
          "{C:attention}hand{} every round"
        },
      },
      j_paperback_triple_moon_goddess = {
        name = "Triple Moon Goddess",
        text = {
          "If played hand contains a {C:attention}Three of a Kind{},",
          "{C:green}#1# in #2#{} chance to create a random {C:planet}Planet{} card and",
          "{C:green}#1# in #3#{} chance to create a random {C:purple}Tarot{} card",
        },
      },
      j_paperback_triple_moon_goddess_minor_arcana = {
        name = "Triple Moon Goddess",
        text = {
          "If played hand contains a {C:attention}Three of a Kind{},",
          "{C:green}#1# in #2#{} chance to create a random {C:tarot}Tarot{} card, and",
          "{C:green}#1# in #3#{} chance to create a random {C:paperback_minor_arcana}Minor Arcana{} card"
        },
      },
      j_paperback_derecho = {
        name = "Derecho",
        text = {
          "Gains {X:mult,C:white}X#1#{} Mult if {C:attention}scored hand",
          "contains only {C:paperback_dark_suit}dark suits",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_jestrica = {
        name = "Jestrica",
        text = {
          "{C:mult}+#1#{} Mult when an {C:attention}8{} is scored",
          "Resets if no {C:attention}8s{} were scored",
          "this round",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        },
      },
      j_paperback_grand_strategy = {
        name = "Grand Strategy",
        text = {
          "This Joker gives {X:mult,C:white}X#1#{} Mult if",
          "{C:attention}#2#{} unique {C:attention}enahncements{}, {C:attention}editions{},",
          "or {C:attention}seals{} are in your full deck",
          "{C:inactive}(Currently {C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_solar_system = {
        name = "Solar System",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for",
          "every {C:attention}level{} all 9 base",
          "{C:planet}Planets{} share",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)",
        },
      },
      j_paperback_reference_card = {
        name = "Reference Card",
        text = {
          "Gains {X:mult,C:white}X#1#{} Mult for every time {C:attention}all{} 9",
          "{C:attention}base poker hands{} have been played",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)",
        },
      },
      j_paperback_dreamsicle = {
        name = "Dreamsicle",
        text = {
          "Scored {C:diamonds}Diamonds{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_jimbo_adventure = {
        name = "Jimbo Adventure",
        text = {
          "Skipping a {C:attention}blind{} creates",
          "a random {C:attention}Tag{}",
        },
      },
      j_paperback_union_card = {
        name = "Union Card",
        text = {
          "{C:attention}Sell value{} of all {C:attention}cards{} is locked",
          "at {C:money}$0{} until this card is sold",
          "Gives {X:mult,C:white}X{} Mult equal to the",
          "number of scored {C:paperback_light_suit}light suits{}",
          "in played hand",
        },
      },
      j_paperback_cherry_blossoms = {
        name = "Cherry Blossoms",
        text = {
          "{C:hearts}Hearts{} give {X:mult,C:white}X#1#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#2#{} Mult for each ",
          "consecutively scored {C:hearts}Heart{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_paranoia = {
        name = "Paranoia",
        text = {
          "After scoring a hand,",
          "destroy all {C:paperback_dark_suit}dark suits{} played",
          "and all {C:paperback_light_suit}light suits{} held in hand",
        },
      },
      j_paperback_unholy_alliance = {
        name = "Unholy Alliance",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult",
          "when a card or joker is {C:attention}destroyed{}",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_summoning_circle = {
        name = "Summoning Circle",
        text = {
          "If played hand contains a",
          "{C:attention}Five of a Kind{}, create a copy",
          "of a {C:attention}random consumable",
          "{C:inactive}(Must have room)",
        },
      },
      j_paperback_pointy_stick = {
        name = "Pointy Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "other {C:attention}\"Stick\"{} Joker you have...",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_prince_of_darkness = {
        name = "Prince of Darkness",
        text = {
          "If scoring hand contains a {C:hearts}Heart{}",
          "and {C:attention}#1#{} unique suits, this Joker gives",
          "{X:mult,C:white}X#2#{} Mult for the next {C:chips}#3#{} hands",
          "{C:inactive}(Currently next {C:chips}#4#{C:inactive} hands)",
        },
      },
      j_paperback_popsicle_stick = {
        name = "Popsicle Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "other {C:attention}\"Stick\"{} Joker you have...",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_let_it_happen = {
        name = "Let it Happen",
        text = {
          "If hand has not been played this Ante,",
          "balance {C:mult}Mult{} and {C:chips}Chips{}",
          "{C:inactive}(Hands played:{C:attention}#1#{C:inactive})",
        },
      },
      j_paperback_evergreens = {
        name = "Evergreens",
        text = {
          "{C:spades}Spades{} give {X:mult,C:white}X#1#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#2#{} Mult for each ",
          "consecutively scored {C:spades}Spade{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_cakepop = {
        name = "Cakepop",
        text = {
          "Scored {C:hearts}Hearts{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_black_rainbows = {
        name = "Black Rainbows",
        text = {
          "Scored {C:spades}Spades{} and {C:clubs}Clubs",
          "have a {C:green}#1# in #2#{} chance to",
          "be made {C:dark_edition}Polychrome"
        }
      },
      j_paperback_meeple = {
        name = "Meeple",
        text = {
          "Scored {C:attention}face cards{} have a",
          "{C:green}#1# in #2#{} chance to",
          "give {C:mult}+#3#{} Discard(s)"
        }
      },
      j_paperback_apple = {
        name = "Apple",
        text = {
          "Scored {C:hearts}Hearts{} have a",
          "{C:green}#1# in #2#{} chance to give",
          "a {C:dark_edition}Negative {C:attention}Consumable",
          "{S:1.1,C:red,E:2}self destructs",
        }
      },
      j_paperback_heretical_joker = {
        name = "Heretical Joker",
        text = {
          "Played cards with",
          "{C:paperback_stars}Star{} suit give",
          "{C:mult}+#1#{} Mult when scored",
        },
      },
      j_paperback_fraudulent_joker = {
        name = "Fraudulent Joker",
        text = {
          "Played cards with",
          "{C:paperback_crowns}Crown{} suit give",
          "{C:mult}+#1#{} Mult when scored",
        },
      },
      j_paperback_rock_candy = {
        name = "Rock Candy",
        text = {
          "Scored {C:paperback_stars}Stars{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_rockin_stick = {
        name = "Rockin' Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "other {C:attention}\"Stick\"{} Joker you have...",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_tanghulu = {
        name = "Tanghulu",
        text = {
          "Scored {C:paperback_crowns}Crowns{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_sweet_stick = {
        name = "Sweet Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "other {C:attention}\"Stick\"{} Joker you have...",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_quartz = {
        name = "Quartz",
        text = {
          "Scored {C:paperback_stars}Stars{} give {X:chips,C:white}X#1#{} Chips",
          "for every other played {C:paperback_stars}Star"
        }
      },
      j_paperback_pyrite = {
        name = "Pyrite",
        text = {
          "Scored {C:paperback_crowns}Crowns{} earn",
          "between {C:money}$#1#{} and {C:money}$#2#"
        }
      },
      j_paperback_wheat_field = {
        name = "Wheat Field",
        text = {
          "{C:paperback_crowns}Crowns{} give {X:mult,C:white}X#1#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#2#{} Mult for each ",
          "consecutively scored {C:paperback_crowns}Crown{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_birches = {
        name = "Birches",
        text = {
          "{C:paperback_stars}Stars{} give {X:mult,C:white}X#1#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#2#{} Mult for each ",
          "consecutively scored {C:paperback_stars}Stars{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
    },
    paperback_minor_arcana = {
      c_paperback_ace_of_cups = {
        name = "Ace of Cups",
        text = {
          "Add a {C:chips}Blue Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_two_of_cups = {
        name = "Two of Cups",
        text = {
          "Gives a {C:dark_edition}Polychrome{},",
          "{C:dark_edition}Holographic{}, {C:dark_edition}Foil{},",
          "{C:mult}Rare{} or {C:green}Uncommon{C:attention} Tag"
        }
      },
      c_paperback_three_of_cups = {
        name = "Three of Cups",
        text = {
          "Add a {C:paperback_black}Black Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_four_of_cups = {
        name = "Four of Cups",
        text = {
          "Remove {C:attention}enhancements{}, {C:attention}seals{} and",
          "{C:attention}editions{} from up to {C:attention}#1#{} selected",
          "cards and earn {C:money}$#2#{} for each",
          "one removed"
        }
      },
      c_paperback_five_of_cups = {
        name = "Five of Cups",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected cards to",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_six_of_cups = {
        name = "Six of Cups",
        text = {
          "Earn {C:attention}half{} the {C:chips}chip",
          "{C:chips}value{} of {C:attention}#1#{} selected",
          "card as {C:money}money",
          "{C:inactive}(Max of {C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_seven_of_cups = {
        name = "Seven of Cups",
        text = {
          "Give a random {C:attention}enhancement",
          "to up to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_eight_of_cups = {
        name = "Eight of Cups",
        text = {
          "Converts up to {C:attention}#1#{} selected",
          "cards into a suit that is",
          "not {C:attention}currently selected"
        }
      },
      c_paperback_nine_of_cups = {
        name = "Nine of Cups",
        text = {
          "Destroy a selected {C:attention}Joker{} and",
          "create a new {C:attention}Joker{} of the same",
          "{C:attention}rarity{}, or higher if possible",
          "{C:inactive}(Cannot upgrade into a {C:legendary}Legendary{C:inactive})"
        }
      },
      c_paperback_ten_of_cups = {
        name = "Ten of Cups",
        text = {
          "{C:green}#1# in #2#{} chance to add",
          "{C:dark_edition}Polychrome{} edition to",
          "a selected card"
        }
      },
      c_paperback_page_of_cups = {
        name = "Page of Cups",
        text = {
          "Add a {C:inactive}White Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_knight_of_cups = {
        name = "Knight of Cups",
        text = {
          "Select {C:attention}#1#{} cards, the {C:attention}left{} card",
          "copies {C:attention}everything{} from the {C:attention}right",
          "card except {C:attention}rank{} and {C:attention}suit",
          "Destroys the {C:attention}right{} card",
          "{C:inactive}(Drag to rearrange)"
        }
      },
      c_paperback_queen_of_cups = {
        name = "Queen of Cups",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected cards to",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_king_of_cups = {
        name = "King of Cups",
        text = {
          "Earn {C:money}$#1#{} for each suit with all",
          "13 {C:attention}base ranks{} that you have",
          "{C:inactive}(Currently {C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_ace_of_wands = {
        name = "Ace of Wands",
        text = {
          "Add a {C:mult}Red Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_two_of_wands = {
        name = "Two of Wands",
        text = {
          "Create the {C:planet}Planet{} card",
          "for your {C:attention}most{} and {C:attention}least",
          "played {C:attention}poker hands",
          "{C:inactive}(Must have room)"
        }
      },
      c_paperback_three_of_wands = {
        name = "Three of Wands",
        text = {
          "Create a copy of {C:attention}#1#",
          "selected card in",
          "your hand"
        }
      },
      c_paperback_four_of_wands = {
        name = "Four of Wands",
        text = {
          "Add a {C:paperback_pink}Pink Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_five_of_wands = {
        name = "Five of Wands",
        text = {
          "Destroys all cards",
          "{C:attention}held in hand{}, and",
          "sets money to {C:money}$0"
        }
      },
      c_paperback_six_of_wands = {
        name = "Six of Wands",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected cards to",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_seven_of_wands = {
        name = "Seven of Wands",
        text = {
          "Gives a {C:attention}Breaking Tag"
        }
      },
      c_paperback_eight_of_wands = {
        name = "Eight of Wands",
        text = {
          "Create a {C:dark_edition}Negative",
          "{C:attention}Tag{} and lose {C:money}$#1#"
        }
      },
      c_paperback_nine_of_wands = {
        name = "Nine of Wands",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected cards to",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_ten_of_wands = {
        name = "Ten of Wands",
        text = {
          "Select {C:attention}#1#{} cards, destroy the",
          "{C:attention}rightmost two{} and give their",
          "{C:chips}chip value{} to the {C:attention}leftmost",
          "{C:inactive}(Drag to rearrange)"
        }
      },
      c_paperback_page_of_wands = {
        name = "Page of Wands",
        text = {
          "Add an {C:attention}Orange Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_knight_of_wands = {
        name = "Knight of Wands",
        text = {
          "Gives a {C:mult}High Risk{C:attention} Tag"
        }
      },
      c_paperback_queen_of_wands = {
        name = "Queen of Wands",
        text = {
          "{C:green}#1# in #2#{} chance to",
          "add {C:dark_edition}Dichrome{} edition",
          "to a random {C:attention}Joker"
        }
      },
      c_paperback_king_of_wands = {
        name = "King of Wands",
        text = {
          "Creates a random",
          "non {C:chips}Common{C:attention} Joker",
          "{C:inactive}(Except {C:legendary}Legendary{C:inactive})"
        }
      },
      c_paperback_ace_of_swords = {
        name = "Ace of Swords",
        text = {
          "Converts up to",
          "{C:attention}#1#{} selected cards",
          "to {V:1}#2#{}",
        }
      },
      c_paperback_ace_of_pentacles = {
        name = "Ace of Pentacles",
        text = {
          "Converts up to",
          "{C:attention}#1#{} selected cards",
          "to {V:1}#2#{}",
        }
      }
    },
    Voucher = {
      v_paperback_celtic_cross = {
        name = "Celtic Cross",
        text = {
          "{C:paperback_minor_arcana}Minor Arcana{} cards may",
          "appear in the {C:money}Shop"
        }
      },
      v_paperback_soothsay = {
        name = "Soothsay",
        text = {
          "Gain a {C:paperback_minor_arcana}Divination Tag{} when",
          "clearing a {C:attention}Boss Blind"
        }
      },
    },
    Tag = {
      tag_paperback_angel_investment = {
        name = "Angel Investment Tag",
        text = {
          "Earn {C:money}$#1#{} per {C:money}$#2#{} you have",
          "{C:inactive}(Will give {C:money}$#3#{C:inactive})"
        }
      },
      tag_paperback_divination = {
        name = "Divination Tag",
        text = {
          "Gives a free",
          "{C:paperback_minor_arcana}Mega Minor Arcana Pack"
        }
      },
      tag_paperback_dichrome = {
        name = "Dichrome Tag",
        text = {
          "Next base edition shop",
          "Joker is free and",
          "becomes {C:dark_edition}Dichrome"
        }
      },
      tag_paperback_high_risk = {
        name = "High Risk Tag",
        text = {
          "When selecting {C:attention}Boss",
          "{C:attention}Blind{}, {C:attention}double{} its",
          "score requirement",
          "and gain {C:money}$#1#"
        }
      },
      tag_paperback_breaking = {
        name = "Breaking Tag",
        text = {
          "Disables the",
          "{C:attention}Boss Blind"
        }
      }
    },
    Planet = {
      c_paperback_quaoar = {
        name = "Quaoar",
      },
      c_paperback_haumea = {
        name = "Haumea",
      },
      c_paperback_sedna = {
        name = "Sedna",
      },
      c_paperback_makemake = {
        name = "Makemake",
      },
    },
    Enhanced = {
      m_paperback_ceramic = {
        name = "Ceramic Card",
        text = {
          "Earns between {C:money}$#1#{}",
          "and {C:money}$#2#{} when scored",
          "{C:green}#3# in #4#{} chance to",
          "be {C:mult}destroyed{}"
        }
      },
      m_paperback_soaked = {
        name = "Soaked Card",
        text = {
          "Cards {C:attention}held in hand{}",
          "score their {C:chips}chip value{}",
          "{C:green}#1# in #2#{} chance to be",
          "destroyed on {C:mult}discard",
        }
      },
      m_paperback_wrapped = {
        name = "Wrapped Card",
        text = {
          "Earn {C:money}$#1#{} when scored",
          "no rank or suit"
        }
      },
      m_paperback_bandaged = {
        name = "Bandaged Card",
        text = {
          "Retrigger {C:attention}adjacent{} cards",
          "{C:green}#1# in #2#{} chance to break",
          "when scored"
        }
      }
    },
    Edition = {
      e_paperback_dichrome = {
        name = "Dichrome",
        text = {
          "When {C:attention}Blind{} is selected",
          "gain {C:attention}+#1#{C:chips} Hand{} or {C:mult}Discard",
          "{C:inactive}(Whichever is lower)"
        }
      }
    },
    Other = {
      paperback_energized = {
        name = "Energized",
        text = {
          "Cannot be copied by",
          "{C:attention}Basic Joker Energy{}"
        }
      },
      paperback_light_suits = {
        name = "Light Suits",
        text = {
          "{C:diamonds}Diamonds{}, {C:hearts}Hearts{}"
        }
      },
      paperback_dark_suits = {
        name = "Dark Suits",
        text = {
          "{C:spades}Spades{}, {C:clubs}Clubs{}"
        }
      },
      paperback_requires_custom_suits = {
        name = "Requires Custom Suits",
        text = {
          "Removed from pool due",
          "to {C:attention}Custom Suits{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_enhancements = {
        name = "Requires Enhancements",
        text = {
          "Removed from pool due",
          "to {C:attention}Enhancements{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_paperclips = {
        name = "Requires Paperclips",
        text = {
          "Removed from pool due",
          "to {C:attention}Paperclips{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_minor_arcana = {
        name = "Requires Minor Arcana",
        text = {
          "Removed from pool due",
          "to {C:paperback_minor_arcana}Minor Arcana{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_tags = {
        name = "Requires Tags",
        text = {
          "Removed from pool",
          "due to {C:attention}Tags{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_editions = {
        name = "Requires Editions",
        text = {
          "Removed from pool",
          "due to {C:dark_edition}Editions{} being",
          "disabled in {C:legendary}Paperback",
        }
      },

      -- Paperclips
      paperback_blue_clip = {
        name = "Blue Clip",
        text = {
          "{X:chips,C:white}X#1#{} Chips for each",
          "{C:attention}Clip{} in {C:attention}held hand",
          "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive})"
        }
      },
      paperback_red_clip = {
        name = "Red Clip",
        text = {
          "{C:mult}+#1#{} Mult for each",
          "{C:attention}Clip{} in {C:attention}held hand",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        }
      },
      paperback_orange_clip = {
        name = "Orange Clip",
        text = {
          "Earn {C:money}$#1#{} for every {C:attention}#2#",
          "{C:attention}Clips{} in {C:attention}held hand",
          "{C:inactive}(Currently {C:money}$#3#{C:inactive})"
        }
      },
      paperback_black_clip = {
        name = "Black Clip",
        text = {
          "Retriggers if another",
          "{C:attention}Clip{} is in {C:attention}played hand",
          "and again if a {C:attention}Clip{} is",
          "{C:attention}held in hand"
        }
      },
      paperback_white_clip = {
        name = "White Clip",
        text = {
          "If {C:attention}held in hand{} at {C:attention}end of",
          "{C:attention}round{}, gain {C:chips}+#1#{} Chips for",
          "each {C:attention}Clip{} scored this round",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
        }
      },
      paperback_pink_clip = {
        name = "Pink Clip",
        text = {
          "{X:mult,C:white}X#1#{} Mult when {C:attention}held in",
          "{C:attention}hand{}, increases by {X:mult,C:white}X#2#",
          "for each scored {C:attention}Clip",
          "{C:inactive}(Resets after played hand)"
        }
      },

      -- Minor Arcana
      p_paperback_minor_arcana_normal = {
        name = "Minor Arcana Pack",
        text = {
          "Choose {C:attention}#1#{} of up to {C:attention}#2#",
          "{C:paperback_minor_arcana}Minor Arcana{} cards",
          "to be used immediately"
        }
      },
      p_paperback_minor_arcana_mega = {
        name = "Mega Minor Arcana Pack",
        text = {
          "Choose {C:attention}#1#{} of up to {C:attention}#2#",
          "{C:paperback_minor_arcana}Minor Arcana{} cards",
          "to be used immediately"
        }
      },
    },
  },
  misc = {
    dictionary = {
      -- Badge under cards
      k_paperback_minor_arcana = "Minor Arcana",
      -- Name of consumable type in collection
      b_paperback_minor_arcana_cards = "Minor Arcana",
      -- Text shown at the bottom while opening booster
      paperback_minor_arcana_pack = "Minor Arcana Pack",

      paperback_polychrome_ex = "Polychrome!",
      paperback_destroyed_ex = "Destroyed!",
      paperback_doubled_ex = "Doubled!",
      paperback_too_late_ex = "TOO LATE!",
      paperback_broken_ex = "Broken!",
      paperback_none = "None",
      paperback_downgrade_ex = "Downgrade!",
      paperback_copy_ex = "Copy!",
      paperback_consumed_ex = "Consumed!",
      paperback_too_hot_ex = "Too Hot!",
      paperback_inactive = "Inactive",
      paperback_supplies_ex = "Supplies!",
      paperback_melted_ex = "Melted!",
      paperback_investment_ex = "Investment!",
      paperback_plus_minor_arcana = "+1 M. Arcana",

      paperback_ui_requires_restart = "Requires Restart",
      paperback_ui_enable_jokers = "Enable Jokers",
      paperback_ui_enable_minor_arcana = "Enable Minor Arcana",
      paperback_ui_enable_enhancements = "Enable Enhancements",
      paperback_ui_enable_editions = "Enable Editions",
      paperback_ui_enable_paperclips = "Enable Paperclips",
      paperback_ui_custom_suits_enabled = "Enable Custom Suits",
      paperback_ui_enable_vouchers = "Enable Vouchers",
      paperback_ui_enable_tags = "Enable Tags",
      paperback_ui_developers = "Developers",
      paperback_ui_artists = "Artists",
      paperback_ui_localization = "Localization",
      paperback_ui_paperclips = "Paperclips",
    },
    v_dictionary = {
      paperback_a_discards = "+#1# Discards",
      paperback_a_discards_minus = "-#1# Discards",
      paperback_a_hands_minus = "-#1# Hands",
      paperback_prince_of_darkness = "+#1# Mult, +#2# Chips",
      paperback_a_completion = "#1#/#2#",
      paperback_a_round_minus = "-#1# Round"
    },
    suits_singular = {
      paperback_Crowns = "Crown",
      paperback_Stars = 'Star'
    },
    suits_plural = {
      paperback_Crowns = "Crowns",
      paperback_Stars = 'Stars'
    },
    poker_hands = {
      ['paperback_Spectrum'] = "Spectrum",
      ['paperback_Straight Spectrum'] = "Straight Spectrum",
      ['paperback_Straight Spectrum (Royal)'] = "Royal Spectrum",
      ['paperback_Spectrum House'] = "Spectrum House",
      ['paperback_Spectrum Five'] = "Spectrum Five",
    },
    poker_hand_descriptions = {
      ['paperback_Spectrum'] = {
        "5 cards with different suits"
      },
      ['paperback_Straight Spectrum'] = {
        "5 cards in a row (consecutive ranks),",
        "each with a different suit"
      },
      ['paperback_Spectrum House'] = {
        "A Three of a Kind and a Pair with",
        "each card having a different suit"
      },
      ['paperback_Spectrum Five'] = {
        "5 cards with the same rank,",
        "each with a different suit"
      },
    },
    labels = {
      paperback_blue_clip = "Blue Clip",
      paperback_red_clip = "Red Clip",
      paperback_orange_clip = "Orange Clip",
      paperback_pink_clip = "Pink Clip",
      paperback_black_clip = "Black Clip",
      paperback_white_clip = "White Clip",
      paperback_dichrome = "Dichrome",
    }
  }
}
