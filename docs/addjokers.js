let implementedJokers = [
  {
    name: "Calling Card",
    text: [
      "This Joker gains {X:red}X0.25{} Mult whenever you defeat a {C:attention}Boss Blind{} or trigger its {C:attention}ability{}",
      "{C:inactive}(Currently {}{X:red}X1{}{C:inactive} Mult){}"
    ],
    image_url: "img/j_calling_card.png",
    rarity: "Uncommon"
  },
  {
    name: "Quick Fix",
    text: [
      "{C:attention}+2{} Hand Size. {C:green}1 in 4{} chance this card is {C:attention}destroyed{} at end of round.",
    ],
    image_url: "img/j_quick_fix.png",
    rarity: "Common"
  },
  {
    name: "Sacrificial Lamb",
    text: [
      "Gains {C:mult}+5{} Mult for each card or Joker {C:attention}destroyed{}.",
      "{C:inactive}(Currently {C:mult}+0{} {C:inactive}Mult)"
    ],
    image_url: "img/j_sacrificial_lamb.png",
    rarity: "Uncommon"
  },
  {
    name: "Wish You Were Here",
    text: [
      "Gives {C:mult}Mult{} equal to {C:mult}3X{} this Joker's {C:attention}Sell Value{}.",
      "Gains {C:money}+1 {C:attention}Sell Value{} at end of round",
      "{C:inactive}(Currently {C:mult}+3 {C:inactive}Mult)"
    ],
    image_url: "img/j_wish_you_were_here.png",
    rarity: "Uncommon"
  },
  {
    name: "Stamp",
    text: [
      "{C:green}1 in 3{} chance this Joker gains {C:chips}+25{} Chips when any card with a {C:attention}seal{} is scored",
      "{C:inactive}(Currently {C:chips}+0{C:inactive} Chips)"
    ],
    image_url: "img/j_stamp.png",
    rarity: "Rare"
  },
  {
    name: "Solar System",
    text: [
      "Gives {X:mult,C:white}X2{} Mult for every {C:attention}level{} all 9 base {C:planet}planets{} share.",
      "{C:inactive}(Currently {X:mult,C:white}X2{C:inactive} Mult)"
    ],
    image_url: "img/j_solar_system.png",
    rarity: "Rare"
  },
  {
    name: "Furioso",
    text: [
      "Each uniquely scored {C:attention}rank{} adds {X:mult,C:white}0.2X{} Mult to this Joker. Resets after defeating a {C:attention}boss blind.",
      "{C:inactive}(Currently {X:mult,C:white}X1{} {C:inactive}Mult)",
      "{C:inactive}(Ranks played:{C:attention} None {C:inactive})"
    ],
    image_url: "img/j_furioso.png",
    rarity: "Uncommon"
  },
  {
    name: "Pride Flag",
    text: [
      "Gains {C:mult}+3{} Mult if scored hand contains {C:attention}four{} unique suits"
    ],
    image_url: "img/j_pride_flag.png",
    rarity: "Common"
  },
  {
    name: "Pool Table",
    text: [
      "If first hand of round scores all {C:attention}non-face cards{}, creates the {C:planet}Planet{} card of the played {C:attention}poker hand{}",
      "{C:inactive}(Must have room)"
    ],
    image_url: "img/j_pool_table.png",
    rarity: "Rare"
  },
  {
    name: "Summoning Circle",
    text: [
      "Playing a {C:attention}5 of a Kind{} creates a copy of a {C:attention}random consumeable{}",
      "{C:inactive}(Must have room)"
    ],
    image_url: "img/j_summoning_circle.png",
    rarity: "Rare"
  },
  {
    name: "Derecho",
    text: [
      "Gains {X:mult,C:white}X0.1{} Mult if {C:attention}first hand{} of round contains only {C:spades}dark suits",
      "{C:inactive}(Currently {X:mult,C:white}X1{C:inactive} Mult)"
    ],
    image_url: "img/j_derecho.png",
    rarity: "Uncommon"
  },
  {
    name: "Skydiver",
    text: [
      "{X:mult,C:white}X3{} Mult if all {C:attention}scored cards{} are less than or equal to the {C:attention}lowest ranked{} card scored this round.",
      "Lowest rank updated at end of played {C:chips}hand.",
      "{C:inactive}(Currently: {C:attention}Ace{C:inactive})"
    ],
    image_url: "img/j_skydiver.png",
    rarity: "Uncommon"
  },
  {
    name: "Solemn Lament",
    text: [
      "Retrigger {C:attention}first{} played card used in scoring {C:attention}once{} for every remaining {C:chips}hand{} or {C:mult}discard{}",
      "{C:inactive}(The lowest of the two)",
      "{C:attention}Aces{}, {C:attention}6s{}, and {C:attention}8s{} give {C:mult}+3{} Mult when scored"
    ],
    image_url: "img/j_solemn_lament.png",
    rarity: "Uncommon"
  },
  {
    name: "Ghost Cola",
    text: [
      "Sell this card to create a {C:attention}Negative Tag{} and a random {C:dark_edition}Negative{} {C:spectral}Spectral{} card."
    ],
    image_url: "img/j_ghost_cola.png",
    rarity: "Rare"
  },
  {
    name: "Shopping Center",
    text: [
      "{C:money}Shops{} have an additional {C:attention}card slot{}."
    ],
    image_url: "img/j_shopping_center.png",
    rarity: "Common"
  },
  {
    name: "Nachos",
    text: [
      "{X:chips}X2{} Chips, loses {X:chips}X0.05{} Chips per {C:attention}card{} discarded",
      "{C:inactive}(Currently {X:chips,C:white}X2{C:inactive} Chips)"
    ],
    image_url: "img/j_nachos.png",
    rarity: "Common"
  },
  {
    name: "Crispy Taco",
    text: [
      "{X:chips,C:white}X3{} Chips. {C:green}1 in 6{} chance this card is {C:attention}destroyed{} at end of round."

    ],
    image_url: "img/j_crispy_taco.png",
    rarity: "Uncommon"
  },
  {
    name: "Soft Taco",
    text: [
      "{X:mult,C:white}X3{} Mult. {C:green}1 in 6{} chance this card is {C:attention}destroyed{} at end of round."
    ],
    image_url: "img/j_soft_taco.png",
    rarity: "Uncommon"
  },
  {
    name: "Bicycle",
    text: [
      "{C:attention}Wild Cards{} give {C:mult}Mult{} equal to their {C:chips}Chip Bonus{}, then {X:mult,C:white}X1.5{} Mult"
    ],
    image_url: "img/j_bicycle.png",
    rarity: "Common"
  },
  {
    name: "Reference Card",
    text: [
      "Gains {X:mult,C:white}X1{} Mult for all times the base {C:attention}Hands{} have been played",
      "{C:inactive}(Currently {X:mult,C:white}X1{C:inactive} Mult)"
    ],
    image_url: "img/j_reference_card.png",
    rarity: "Common"
  }
]

let inProgressJokers = [
  {
    name: "Mismatched Sock",
    text: [
      "This Joker gains +3 Mult if played hand contains no pairs."
    ],
    image_url: "img/j_mismatched_sock.png",
    rarity: "Uncommon"
  },
]

let conceptJokers = [
  {
    name: "Hole in One",
    text: [
      "If first hand of round cleared the blind, double the sell value of all jokers and consumables. If sold, all Jokers and Consumables are set to a sell value of $0"
    ],
    image_url: "img/j_hole_in_one.png",
    rarity: "Rare"
  },
  {
    name: "Forgery",
    text: [
      "Copies the effect of a random joker every hand. If a joker provides Mult, X-Mult, or Chips, the provided amount is between 0.5x and 1.5x times the original copied amount"
    ],
    image_url: "img/j_forgery.png",
    rarity: "Uncommon"
  },
  {
    name: "Union Card",
    text: [
      "Sell Value of all Cards is Locked at 0 until this joker is sold. Gives xMult and xChips equal to the number of scored Red cards in played hand (Diamonds, Hearts)"
    ],
    image_url: "img/j_union_card.png",
    rarity: "Rare"
  },

  // No art below this line
  {
    name: "Jester of Nihil",
    text: [
      "All cards are considered every suit. Debuffed cards give x2 Mult"
    ],
    image_url: "img/j_joker.png",
    rarity: "Rare"
  },
  {
    name: "Complete Breakfast",
    text: [
      "Gives +20 Mult and +100 Chips. 1 in 10 chance to break after played hand. Chance increases by 1 after every played hand."
    ],
    image_url: "img/j_joker.png",
    rarity: "Common"
  },
  {
    name: "Prince of Darkness",
    text: [
      "If scored hand contains three different Suits, this card gains +3 Mult, +5 Chips, and +1 Sell Value."
    ],
    image_url: "img/j_joker.png",
    rarity: "Common"
  },
  {
    name: "Passport",
    text: [
      "Gains 0.25x Mult if played hand is not the previously played hand."
    ],
    image_url: "img/j_joker.png",
    rarity: "Uncommon"
  },
  {
    name: "Black Rainbows",
    text: [
      "Scored Spades and Clubs have a 1 in 11 chance to be made Polychrome"
    ],
    image_url: "img/j_joker.png",
    rarity: "Rare"
  },
  {
    name: "Emergency Broadcast",
    text: [
      "Scored 5s and 8s provide +5 Mult and +8 Chips"
    ],
    image_url: "img/j_joker.png",
    rarity: "Common"
  },
  {
    name: "Triple Moon Goddess",
    text: [
      "If played hand contains Three of a Kind, create a Tarot and Planet Card"
    ],
    image_url: "img/j_joker.png",
    rarity: "Uncommon"
  },
  {
    name: "Plague Doctor",
    text: [
      "If hand is High Card, covert the card into an Apostle. (Apostle - Face Card, Scores 12 Chips)"
    ],
    image_url: "img/j_joker.png",
    rarity: "Uncommon"
  },
  {
    name: "WhiteNight",
    text: [
      "Destroy all Non-Apostle Cards played after hand is scored. Apostle Cards gain +5 Mult for every card destroyed this way. Scored Apostle Cards provide 2x Mult"
    ],
    image_url: "img/j_joker.png",
    rarity: "Legendary"
  },
  {
    name: "One Sin and Hundreds of Good Deeds",
    text: [
      "Gains +3 Mult when a 3 or Rankless Card is scored"
    ],
    image_url: "img/j_joker.png",
    rarity: "Common"
  },
  {
    name: "Marksman",
    text: [
      "Last scored card in hand gains a 'Coin Seal'"
    ],
    image_url: "img/j_joker.png",
    rarity: "Rare"
  },
  {
    name: "Built to Last",
    text: [
      "Gives 0.1x Mult if played hand is the same as previous played hand. Resets when a new hand is played"
    ],
    image_url: "img/j_joker.png",
    rarity: "Uncommon"
  },
  {
    name: "Everything Must Go!",
    text: [
      "Shops have an additional Voucher for sale"
    ],
    image_url: "img/j_joker.png",
    rarity: "Uncommon"
  },
  {
    name: "[[WILD PRIZE!1!]]",
    text: [
      "Retrigger all Aces, Nines, and Sevens. Each of these earn $1 when scored"
    ],
    image_url: "img/j_joker.png",
    rarity: "Uncommon"
  },
  {
    name: "Down to Size",
    text: [
      "If scored hand had greater than 3x Chips than Mult, this Joker gains 0.5x Mult"
    ],
    image_url: "img/j_joker.png",
    rarity: "Uncommon"
  }
]

// works the same. 
let consumables = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Tarot"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Planet"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Spectral"
  // },

]

let card_modifications = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Enhancement"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Edition"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/sticker_example.png",
  //   rarity: "Seal"
  // },
  {
    name: "Coin Seal",
    text: [
      "Provides 1x Mult for each previously consecutively scored Coin Seal"
    ],
    image_url: "img/s_seal.png",
    rarity: "Seal"
  }
]

let decks = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Deck"
  // },
]

let stickers = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/sticker_example.png",
  //   rarity: "Sticker"
  // },
]

let blinds = [
  // {
  //   name: "The Wall",
  //   text: [
  //     "Extra large blind",
  //     "{C:inactive}({C:red}4x{C:inactive} Base for {C:attention}$$$$${C:inactive})",
  //     "{C:inactive}(Appears from Ante 2)"
  //   ],
  //   image_url: "img/the_wall.png",
  //   rarity: "Boss Blind"
  // },
  // {
  //   name: "Violet Vessel",
  //   text: [
  //     "Very large blind",
  //     "{C:inactive}({C:red}6x{C:inactive} Base for {C:attention}$$$$$$$${C:inactive})",
  //     "{C:inactive}(Appears from Ante 8)"
  //   ],
  //   image_url: "img/violet_vessel.png",
  //   rarity: "Showdown"
  // },
]

let shop_items = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Voucher"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Pack"
  // },
]

let cols = {

  MULT: "#FE5F55",
  CHIPS: "#009dff",
  MONEY: "#f3b958",
  XMULT: "#FE5F55",
  FILTER: "#ff9a00",
  ATTENTION: "#ff9a00",
  BLUE: "#009dff",
  RED: "#FE5F55",
  GREEN: "#4BC292",
  PALE_GREEN: "#56a887",
  ORANGE: "#fda200",
  IMPORTANT: "#ff9a00",
  GOLD: "#eac058",
  YELLOW: "#ffff00",
  CLEAR: "#00000000",
  WHITE: "#ffffff",
  PURPLE: "#8867a5",
  BLACK: "#374244",
  L_BLACK: "#4f6367",
  GREY: "#5f7377",
  CHANCE: "#4BC292",
  JOKER_GREY: "#bfc7d5",
  VOUCHER: "#cb724c",
  BOOSTER: "#646eb7",
  EDITION: "#ffffff",
  DARK_EDITION: "#5d5dff",
  ETERNAL: "#c75985",
  INACTIVE: "#ffffff99",
  HEARTS: "#f03464",
  DIAMONDS: "#f06b3f",
  SPADES: "#403995",
  CLUBS: "#235955",
  ENHANCED: "#8389DD",
  JOKER: "#708b91",
  TAROT: "#a782d1",
  PLANET: "#13afce",
  SPECTRAL: "#4584fa",
  VOUCHER: "#fd682b",
  EDITION: "#4ca893",
}

let rarities = {
  "Common": "#009dff",
  "Uncommon": "#4BC292",
  "Rare": "#fe5f55",
  "Legendary": "#b26cbb",
  "Joker": "#708b91",
  "Tarot": "#a782d1",
  "Planet": "#13afce",
  "Spectral": "#4584fa",
  "Voucher": "#fd682b",
  "Pack": "#9bb6bd",
  "Enhancement": "#8389DD",
  "Edition": "#4ca893",
  "Seal": "#4584fa",
  "Deck": "#9bb6bd",
  "Sticker": "#5d5dff",
  "Boss Blind": "#5d5dff",
  "Showdown": "#4584fa",
}

regex = /{([^}]+)}/g;

let add_cards_to_div = (jokers, jokers_div) => {
  for (let joker of jokers) {
    console.log("adding joker", joker.name);

    joker.text = joker.text.map((line) => { return line + "{}" });

    joker.text = joker.text.join("<br/>");
    joker.text = joker.text.replaceAll("{}", "</span>");
    joker.text = joker.text.replace(regex, function replacer(match, p1, offset, string, groups) {
      let classes = p1.split(",");

      let css_styling = "";

      for (let i = 0; i < classes.length; i++) {
        let parts = classes[i].split(":");
        if (parts[0] === "C") {
          css_styling += `color: ${cols[parts[1].toUpperCase()]};`;
        } else if (parts[0] === "X") {
          css_styling += `background-color: ${cols[parts[1].toUpperCase()]}; border-radius: 5px; padding: 0 5px;`;
        }
      }

      return `</span><span style='${css_styling}'>`;
    });

    let joker_div = document.createElement("div");
    joker_div.classList.add("joker");
    if (joker.rarity === "Sticker" || joker.rarity == "Seal") {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" class="hasback" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else if (joker.soul) {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <span class="soulholder">
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-bg" />
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-top" />
        </span>
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    }

    jokers_div.appendChild(joker_div);
  }
}

if (implementedJokers.length === 0) {
  document.querySelector(".implementedJokersfull").style.display = "none"
} else {
  let jokers_div = document.querySelector(".implementedJokers");
  add_cards_to_div(implementedJokers, jokers_div);
}

if (inProgressJokers.length === 0) {
  document.querySelector(".inProgressJokersfull").style.display = "none"
} else {
  let jokers_div = document.querySelector(".inProgressJokers");
  add_cards_to_div(inProgressJokers, jokers_div);
}

if (conceptJokers.length === 0) {
  document.querySelector(".conceptJokersfull").style.display = "none"
} else {
  let jokers_div = document.querySelector(".conceptJokers");
  add_cards_to_div(conceptJokers, jokers_div);
}

if (consumables.length === 0) {
  document.querySelector(".consumablesfull").style.display = "none"
} else {
  let consumables_div = document.querySelector(".consumables");
  add_cards_to_div(consumables, consumables_div);
}

if (card_modifications.length === 0) {
  document.querySelector(".cardmodsfull").style.display = "none"
} else {
  let cardmods_div = document.querySelector(".cardmods");
  add_cards_to_div(card_modifications, cardmods_div);
}

if (decks.length === 0) {
  document.querySelector(".decksfull").style.display = "none"
} else {
  let decks_div = document.querySelector(".decks");
  add_cards_to_div(decks, decks_div);
}

if (stickers.length === 0) {
  document.querySelector(".stickersfull").style.display = "none"
} else {
  let stickers_div = document.querySelector(".stickers");
  add_cards_to_div(stickers, stickers_div);
}

if (blinds.length === 0) {
  document.querySelector(".blindsfull").style.display = "none"
} else {
  let blinds_div = document.querySelector(".blinds");
  add_cards_to_div(blinds, blinds_div);
}

if (shop_items.length === 0) {
  document.querySelector(".shopitemsfull").style.display = "none"
} else {
  let shopitems_div = document.querySelector(".shopitems");
  add_cards_to_div(shop_items, shopitems_div);
}
