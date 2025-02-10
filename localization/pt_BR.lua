return {
  descriptions = {
    Joker = {
      j_paperback_cream_liqueur = {
        name = "Licor Creme",
        text = {
          "{C:attention}Marcas{} geram {C:money}$#1#{} quando ativadas",
          "{C:green}#2# em #3#{} chance desta carta ser",
          "consumida no fim da rodada"
        }
      },
      j_paperback_coffee = {
        name = "Café",
        text = {
          "{C:attention}+#1#{} tamanho de mão,",
          "aumenta em {C:attention}#2#{} quando {C:attention}Blind{} é pulado.",
          "{C:green}#3# em #4#{} chance desta carta ser consumida quando",
          "{C:attention}Small Blind{} ou {C:attention}Big Blind{} é selecionado",
        }
      },
      j_paperback_basic_energy = {
        name = "Energia Básica de Curinga",
        text = {
          "Usar qualquer {C:attention}Consumível{} tem uma",
          "{C:green}#1# em #2#{} chance de criar uma cópia",
          "{C:inactive}(Não pode fazer cópias de uma cópia)",
          "{C:inactive}(Deve ter espaço)"
        }
      },
      j_paperback_big_misser = {
        name = "Grande Perda",
        text = {
          "{X:mult,C:white}X#1#{} Multi para cada espaço",
          "vazio de consumível",
          "{C:inactive}(No momento, {X:mult,C:white}X#2#{}{C:inactive} Multi)"
        }
      },
      j_paperback_complete_breakfast = {
        name = "Café da Manhã Completo",
        text = {
          "{C:mult}+#1#{} Multi e {C:chips}+#2#{} Fichas",
          "{C:green}#3# em #4#{} chance desta carta ser",
          "consumida após a mão jogada",
          "A chance aumenta em {C:attention}#5#{} após",
          "cada mão jogada",
        },
      },
      j_paperback_emergency_broadcast = {
        name = "Transmissão de Emergência",
        text = {
          "Pontuar {C:attention}5s{} e {C:attention}8s{} fornece",
          "{C:mult}+#1#{} Multi e {C:chips}+#2#{} Fichas",
        },
      },
      j_paperback_moribund = {
        name = "Moribundo",
        text = {
          "Este Curinga ganha {C:mult}+#1#{} Multi quando um {C:attention}blind",
          "é limpo com {C:attention}0{C:chips} mãos{} restantes.",
          "Dobra seu {C:mult}Multi{} se o blind não for limpo",
          "{C:inactive}(No momento, {C:mult}+#2#{C:inactive} Multi)",
        },
      },
      j_paperback_crispy_taco = {
        name = "Taco Crocante",
        text = {
          "{X:chips,C:white}X#1#{} Fichas. {C:green}#2# em #3#{} chance desta carta",
          "ser consumida no fim da rodada.",
        },
      },
      j_paperback_furioso = {
        name = "Furioso",
        text = {
          "Este Curinga ganha {X:mult,C:white}X#1#{} Multi para",
          "cada {C:attention}rank{} único pontuado.",
          "Reseta após derrotar um {C:attention}blind chefe",
          "{C:inactive}(No momento, {X:mult,C:white}X#2#{} {C:inactive}Multi)",
          "{C:inactive}(Ranks jogados:{C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_soft_taco = {
        name = "Taco Macio",
        text = {
          "{X:mult,C:white}X#1#{} Multi. {C:green}#2# em #3#{} chance desta carta",
          "ser consumida no fim da rodada.",
        },
      },
      j_paperback_charred_marshmallow = {
        name = "Marshmallow Torrado",
        text = {
          "Pontuar {C:spades}Espadas{} dá {C:mult}+#1#{} Multi",
          "{C:green}#2# em #3#{} chance desta carta ser",
          "consumida no fim da rodada",
        },
      },
      j_paperback_joker_cookie = {
        name = "Biscoito do Curinga",
        text = {
          "Ganha {C:money}$#1#{} no fim da rodada",
          "O pagamento aumenta em {C:money}$#2#{} ao sacar",
          "{C:green}#3# em #4#{} chance desta carta",
          "ser consumida no fim da rodada",
        },
      },
      j_paperback_pop_stick = {
        name = "Palito de Pirulito",
        text = {
          "Concede {X:mult,C:white}X#1#{} Multi para cada",
          "outro Curinga {C:attention}\"Palito\"{} que você possui...",
          "{C:inactive}(No momento, {X:mult,C:white}X#2#{C:inactive} Multi)",
        },
      },
      j_paperback_pool_table = {
        name = "Mesa de Sinuca",
        text = {
          "Se a primeira mão da rodada",
          "não pontuar {C:attention}cartas de realeza{},",
          "cria a carta de {C:planet}Planeta{} da",
          "mão de pôquer jogada",
          "{C:inactive}(Deve ter espaço)",
        },
      },
      j_paperback_bicycle = {
        name = "Bicicleta",
        text = {
          "{C:attention}Cartas Naipe Curinga{} fornecem {C:mult}Multi",
          "igual ao seu {C:chips}Bônus de Fichas{},",
          "então {X:mult,C:white}X#1#{} Multi",
        },
      },
      j_paperback_stamp = {
        name = "Selo Postal",
        text = {
          "{C:green}#1# em #2#{} chance deste",
          "Curinga ganhar {C:chips}+#3#{} Fichas quando",
          "qualquer carta com um {C:attention}selo{} for pontuado",
          "{C:inactive}(No momento, {C:chips}+#4#{C:inactive} Fichas)",
        },
      },
      j_paperback_sticky_stick = {
        name = "Palito Grudento",
        text = {
          "Concede {X:mult,C:white}X#1#{} Multi para cada",
          "outro Curinga {C:attention}\"Palito\"{} que você possui...",
          "{C:inactive}(No momento, {X:mult,C:white}X#2#{C:inactive} Multi)",
        },
      },
      j_paperback_shopping_center = {
        name = "Shopping Center",
        text = {
          "{C:money}Lojas{} têm uma",
          "{C:attention}vaga adicional para cards",
        },
      },
      j_paperback_ghost_cola = {
        name = "Cola Fantasma",
        text = {
          "Venda esta carta para criar um {C:attention}#1#{}",
          "e uma carta aleatória {C:dark_edition}Negativa{} {C:spectral}Espectral{}.",
        },
      },
      j_paperback_river = {
        name = "Rio",
        text = {
          "Se a mão jogada contiver {C:attention}5 cartas pontuando",
          "{C:attention}{} ganha o bônus de {C:chips}Fichas{} da carta",
          "de menor pontuação como {C:money}Dinheiro",
          "{C:inactive}(Máximo de {C:money}$#1#{C:inactive})",
        },
      },
      j_paperback_solemn_lament = {
        name = "Lamento Solene",
        text = {
          "Reativa a {C:attention}primeira{} carta pontuada",
          "{C:attention}uma vez{} para cada",
          "{C:chips}mão restante{} ou {C:mult}descarte}",
          "{C:inactive}(O menor dos dois valores)",
        },
      },
      j_paperback_hole_in_one = {
        name = "Hole in One",
        text = {
          "Se a {C:chips}mão{} inicial da rodada vencer o {C:attention}blind{},",
          "dobre o {C:attention}valor de venda{} de todas as {C:attention}cartas",
          "{C:inactive}(Máximo de {C:money}$#1#{C:inactive} por rodada)",
          "Quando esta carta for vendida, define o {C:attention}valor",
          "{C:attention}de venda{} de todas as {C:attention}cartas{} para {C:money}$0"
        },
      },
      j_paperback_mismatched_sock = {
        name = "Meia Descombinada",
        text = {
          "Este Curinga ganha {C:mult}+#1#{} Multi",
          "se a mão jogada não contiver {C:attention}pares{}",
          "{C:inactive}(No momento, {C:mult}+#2# {C:inactive}Multi)",
        },
      },
      j_paperback_quick_fix = {
        name = "Conserto Rápido",
        text = {
          "{C:attention}+#1#{} tamanho de mão",
          "{C:green}#2# em #3#{} chance desta",
          "carta ser destruída",
          "no final da rodada",
        },
      },
      j_paperback_skydiver = {
        name = "Paraquedista",
        text = {
          "{C:white,X:mult}X#1#{} Multi se todas as {C:attention}cartas pontuadas{}",
          "forem menores ou iguais à {C:attention}carta de menor valor",
          "pontuada nesta rodada",
          "{C:inactive}(Atualiza no final da mão jogada{C:inactive})",
          "{C:inactive}(No momento,: {C:attention}#2#{C:inactive})",
        },
      },
      j_paperback_blue_bonnets = {
        name = "Lupinos-Azuis",
        text = {
          "{C:clubs}Paus{} dão {X:mult,C:white}X#1#{} Multi quando pontuados.",
          "Aumenta em {X:mult,C:white}X#2#{} Multi para cada",
          "{C:clubs}Paus{} consecutivamente pontuado",
          "{C:inactive}(Reseta após cada mão jogada)",
        },
      },
      j_paperback_great_wave = {
        name = "Grande Onda",
        text = {
          "Reativa a {C:attention}primeira carta jogada{}",
          "usada na pontuação {C:attention}uma vez{}",
          "para cada {C:chips}mão{} restante",
        },
      },
      j_paperback_caramel_apple = {
        name = "Maçã Caramelada",
        text = {
          "{C:clubs}Paus{} pontuados dão {C:mult}+#1#{} Multi",
          "{C:green}#2# em #3#{} chance desta carta ser",
          "consumida no final da rodada",
        },
      },
      j_paperback_nachos = {
        name = "Nachos",
        text = {
          "{X:chips,C:white}X#1#{} Fichas,",
          "perde {X:chips,C:white}X#2#{} Fichas",
          "por {C:attention}carta{} descartada",
        },
      },
      j_paperback_pride_flag = {
        name = "Bandeira do Orgulho",
        text = {
          "Ganha {C:mult}+#1#{} Multi se a mão pontuada",
          "contiver {C:attention}três{} naipes únicos",
          "{C:inactive}(No momento, {C:mult}+#2#{} {C:inactive}Multi)",
        },
      },
      j_paperback_sacrificial_lamb = {
        name = "Cordeiro Sacrificial",
        text = {
          "Ganha {C:mult}+#1#{} Multi por",
          "cada carta ou Curinga {C:attention}destruído",
          "{C:inactive}(No momento, {C:mult}+#2# {C:inactive}Multi)",
        },
      },
      j_paperback_autumn_leaves = {
        name = "Folhas de Outono",
        text = {
          "{C:diamonds}Ouros{} dão {X:mult,C:white}X#1#{} Multi quando pontuados.",
          "Aumenta em {X:mult,C:white}X#2#{} Multi para cada",
          "{C:diamonds}Ouros{} consecutivamente pontuado",
          "{C:inactive}(Reseta após cada mão jogada)",
        },
      },
      j_paperback_wild_prize = {
        name = "[[PRÊMIO SELVAGEM!1!]]",
        text = {
          "{C:attention}Cartas Naipe Curinga{} têm {C:green}#1# em #2#{} chance",
          "de serem {C:attention}reativadas{} e {C:green}#1# em #3#{} chance",
          "de ganhar {C:money}$#4#{} quando pontuadas",
        },
      },
      j_paperback_wish_you_were_here = {
        name = "Wish You Were Here",
        text = {
          "Dá {C:mult}Multi{} igual a {C:mult}#1#X{} o",
          "{C:attention}valor de venda{} desta carta.",
          "Ganha {C:money}$#2#{} do {C:attention}valor de venda{} no",
          "final da rodada",
          "{C:inactive}(No momento, {C:mult}+#3# {C:inactive}Multi){}",
        },
      },
      j_paperback_calling_card = {
        name = "Cartão de Visita",
        text = {
          "Este Curinga ganha {X:red,C:white}X#1#{} Multi",
          "sempre que você derrota um {C:attention}Boss Blind{}",
          "ou ativa sua {C:attention}habilidade{}",
          "{C:inactive}(No momento, {}{X:red,C:white}X#2#{}{C:inactive} Multi){}",
        },
      },
      j_paperback_subterfuge = {
        name = "Subterfúgio",
        text = {
          "Destrua a {C:attention}primeira mão jogada{} de cada rodada",
          "Ganha {X:mult,C:white}X#1#{} Multi para cada carta abaixo de {C:attention}#2#{}",
          "{C:inactive}(No momento, {X:mult,C:white}X#3#{C:inactive} Multi)",
        },
      },
      j_paperback_triple_moon_goddess = {
        name = "Deusa da Lua Tripla",
        text = {
          "Se a mão jogada contém uma {C:attention}Trinca{},",
          "{C:green}#1# em #2#{} chance de criar uma carta de {C:planet}Planeta{} aleatória e",
          "{C:green}#3# em #4#{} chance de criar uma carta de {C:purple}Tarot{} aleatória",
        },
      },
      j_paperback_derecho = {
        name = "Derecho",
        text = {
          "Ganha {X:mult,C:white}X#1#{} Multi se a {C:attention}mão pontuada",
          "contiver apenas naipes {C:spades}escuros",
          "{C:inactive}(No momento, {X:mult,C:white}X#2#{C:inactive} Multi)",
        },
      },
      j_paperback_jestrica = {
        name = "Jestrica",
        text = {
          "{C:mult}+#1#{} Multi quando um {C:attention}8{} é pontuado",
          "Reseta se nenhum {C:attention}8{} for pontuado",
          "nesta rodada",
          "{C:inactive}(No momento, {C:mult}+#2#{C:inactive} Multi)"
        },
      },
      j_paperback_grand_strategy = {
        name = "Grande Estratégia",
        text = {
          "Este Curinga dá {X:mult,C:white}X#1#{} Multi se",
          "{C:attention}#2#{} {C:attention}melhorias{}, {C:attention}edições{},",
          "ou {C:attention}selos{} únicos estiverem no seu deck completo",
          "{C:inactive}(No momento, {C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_solar_system = {
        name = "Sistema Solar",
        text = {
          "Dá {X:mult,C:white}X#1#{} Multi para",
          "cada {C:attention}nível{} que os 9 {C:planet}Planetas{}",
          "básicos compartilham",
          "{C:inactive}(No momento, {X:mult,C:white}X#2#{} {C:inactive}Multi)",
        },
      },
      j_paperback_reference_card = {
        name = "Carta de Referência",
        text = {
          "Ganha {X:mult,C:white}X#1#{} Multi para cada vez que {C:attention}todas{} as",
          "{C:attention}mãos de poker básicas{} foram jogadas",
          "{C:inactive}(No momento, {X:mult,C:white}X#2#{} {C:inactive}Multi)",
        },
      },
      j_paperback_dreamsicle = {
        name = "Picolé dos Sonhos",
        text = {
          "Os {C:diamonds}Ouros{} pontuados dão {C:mult}+#1#{} Multi",
          "{C:green}#2# em #3#{} chance desta carta ser",
          "consumida no final da rodada",
        },
      },
      j_paperback_jimbo_adventure = {
        name = "Aventura do Jimbo",
        text = {
          "Pular um {C:attention}Blind{} cria",
          "uma {C:attention}Marca{} aleatória",
        },
      },
      j_paperback_union_card = {
        name = "Cartão Sindical",
        text = {
          "O {C:attention}valor de venda{} de todas as {C:attention}cartas{} é fixado",
          "em {C:money}$0{} até esta carta ser vendida",
          "Dá {X:mult,C:white}X{} Multi igual ao",
          "número de {C:diamonds}Ouros{} ou",
          "{C:hearts}Copas{} pontuados na mão jogada",
        },
      },
      j_paperback_cherry_blossoms = {
        name = "Flor de Cerejeira",
        text = {
          "{C:hearts}Copas{} dão {X:mult,C:white}X#1#{} Multi quando pontuadas.",
          "Aumenta em {X:mult,C:white}X#2#{} Multi para cada ",
          "{C:hearts}Copas{} consecutivamente pontuada",
          "{C:inactive}(Reseta após cada mão jogada)",
        },
      },
      j_paperback_paranoia = {
        name = "Paranoia",
        text = {
          "Após pontuar uma mão,",
          "destrua todos os {C:Dark_suit}naipes escuros{} jogados",
          "e todos os {C:Light_suit}naipes claros{} mantidos na mão",
        },
      },
      j_paperback_unholy_alliance = {
        name = "Aliança Profana",
        text = {
          "Este Curinga ganha {X:mult,C:white}X#1#{} Multi",
          "quando uma carta ou Curinga é {C:attention}destruído{}",
          "{C:inactive}(No momento, {X:mult,C:white}X#2#{C:inactive} Multi)",
        },
      },
      j_paperback_summoning_circle = {
        name = "Círculo de Invocação",
        text = {
          "Se a mão jogada contiver uma",
          "{C:attention}Quina{}, crie uma cópia",
          "de um {C:attention}consumível aleatório",
          "{C:inactive}(Deve ter espaço)",
        },
      },
      j_paperback_pointy_stick = {
        name = "Palito Pontiagudo",
        text = {
          "Dá {X:mult,C:white}X#1#{} Multi para cada",
          "outro Curinga {C:attention}\"Palito\"{} que você possui...",
          "{C:inactive}(No momento, {X:mult,C:white}X#2#{C:inactive} Multi)",
        },
      },
      j_paperback_prince_of_darkness = {
        name = "Príncipe das Trevas",
        text = {
          "Se a mão pontuada contiver um {C:hearts}#1#{} e três",
          "naipes únicos, este Curinga ganha {C:mult}+#2#{} Multi,",
          "{C:chips}+#3#{} Fichas, e {C:money}+#4#{} Valor de Venda",
          "{C:inactive}(No momento, {C:mult}+#5#{} {C:inactive}Multi, {C:chips}+#6#{} {C:inactive}Fichas)",
        },
      },
      j_paperback_popsicle_stick = {
        name = "Palito de Picolé",
        text = {
          "Dá {X:mult,C:white}X#1#{} Multi para cada",
          "outro Curinga {C:attention}\"Palito\"{} que você possui...",
          "{C:inactive}(No momento, {X:mult,C:white}X#2#{C:inactive} Multi)",
        },
      },
      j_paperback_let_it_happen = {
        name = "Let It Happen",
        text = {
          "Se a mão não foi jogada nesta Aposta,",
          "equilibre {C:mult}Multi{} e {C:chips}Fichas{}",
          "{C:inactive}(Mãos jogadas:{C:attention}#1#{C:inactive})",
        },
      },
      j_paperback_evergreens = {
        name = "Sempre-Vivas",
        text = {
          "{C:spades}Espadas{} dão {X:mult,C:white}X#1#{} Multi quando pontuadas.",
          "Aumenta em {X:mult,C:white}X#2#{} Multi para cada ",
          "{C:spades}Espadas{} consecutivamente pontuada",
          "{C:inactive}(Reseta após cada mão jogada)",
        },
      },
      j_paperback_cakepop = {
        name = "Pirulito de Bolo",
        text = {
          "{C:hearts}Copas{} pontuadas dão {C:mult}+#1#{} Multi",
          "{C:green}#2# em #3#{} chance desta carta ser",
          "consumida no final da rodada",
        },
      },
      j_paperback_black_rainbows = {
        name = "Arco-íris Negros",
        text = {
          "{C:spades}Espadas{} e {C:clubs}Paus{} pontuados",
          "têm uma {C:green}#1# em #2#{} chance de serem",
          "transformados em {C:dark_edition}Policromo",
        }
      },
      j_paperback_meeple = {
        name = "Meeple",
        text = {
          "{C:attention}Cartas de realeza{} pontuadas têm",
          "{C:green}#1# em #2#{} chance de dar",
          "{C:mult}+#3#{} Descarte(s)",
        }
      },
      j_paperback_apple = {
        name = "Maçã",
        text = {
          "{C:hearts}Copas{} pontuadas têm uma",
          "{C:green}#1# em #2#{} chance de dar",
          "um {C:dark_edition}Consumível Negativo",
          "{S:1.1,C:red,E:2}Se autodestrói",
        }
      },
    },
    Other = {
      paperback_energized = {
        name = "Energizado",
        text = {
          "Não pode ser copiado por",
          "{C:attention}Energia Básica do Curinga{}"
        }
      }
    },
  },
  misc = {
    dictionary = {
      paperback_polychrome_ex = "Policromo!",
      paperback_destroyed_ex = "Destruído!",
      paperback_doubled_ex = "Dublado!",
      paperback_too_late_ex = "TARDE DEMAIS!",
      paperback_broken_ex = "Quebrado!",
      paperback_none = "Nenhum",
      paperback_downgrade_ex = "Rebaixado!",
      paperback_copy_ex = "Cópia!",
      paperback_consumed_ex = "Consumido!",
    },
    v_dictionary = {
      paperback_a_discards_ex = "+#1# Descartes!",
      paperback_prince_of_darkness = "+#1# Multi, +#2# Fichas"
    }
  }
}
