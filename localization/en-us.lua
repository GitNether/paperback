return {
  descriptions = {
    Joker = {
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
          "destroyed, adds {C:attention}double{} its {C:chips}chip",
          "{C:chips}value{} as {C:mult}mult{} to this card",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        }
      },
      j_paperback_backpack = {
        name = "Backpack",
        text = {
          "Shops have an additional",
          "{C:attention}Buffoon Pack"
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
          "Retrigger {C:attention}leftmost{} played",
          "card used in scoring {C:attention}once{}",
          "for every {C:chips}hand{} remaining",
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
      j_paperback_pride_flag = {
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
          "{C:green}#3# in #4#{} chance to create a random {C:purple}Tarot{} card",
        },
      },
      j_paperback_derecho = {
        name = "Derecho",
        text = {
          "Gains {X:mult,C:white}X#1#{} Mult if {C:attention}scored hand",
          "contains only {C:spades}dark suits",
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
    },
    paperback_minor_arcana = {
      c_paperback_two_of_cups = {
        name = "Two of Cups",
        text = {
          "Select {C:attention}#1#{} cards, the {C:attention}middle{} card",
          "inherits the {C:chips}suit{} of the {C:chips}left{} card",
          "and {C:mult}rank{} of the {C:mult}right{} card, both",
          "{C:chips}left{} and {C:mult}right{} cards are destroyed",
          "{C:inactive}(Drag to rearrange)"
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
      c_paperback_six_of_cups = {
        name = "Six of Cups",
        text = {
          "Select a card and earn",
          "{C:attention}half{} its {C:chips}chip value",
          "as {C:money}money{}"
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
          "{C:inactive}(Cannot make {C:legendary}Legendary{C:inactive})"
        }
      },
      c_paperback_ten_of_cups = {
        name = "Ten of Cups",
        text = {
          "Add {C:dark_edition}Polychrome{} to",
          "a selected card"
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
      }
    }
  },
  misc = {
    dictionary = {
      -- Badge under cards
      k_paperback_minor_arcana = "Minor Arcana",
      -- Name of consumable type in collection
      b_paperback_minor_arcana_cards = "Minor Arcana",

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

      paperback_ui_requires_restart = "Requires Restart",
      paperback_ui_enable_jokers = "Enable Jokers",
      paperback_ui_enable_minor_arcana = "Enable Minor Arcana",
      paperback_ui_custom_suits_enabled = "Enable Custom Suits"
    },
    v_dictionary = {
      paperback_a_discards_ex = "+#1# Discards!",
      paperback_a_xchips = "X#1# Chips",
      paperback_a_xchips_minus = "-X#1# Chips",
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
    }
  }
}
