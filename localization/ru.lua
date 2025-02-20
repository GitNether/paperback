return {
  descriptions = {
    Back = {
      b_paperback_paper = {
        name = "Бумажная колода",
        text = {
          "{C:legendary}Бумажные{C:attention} Джокеры{} появляются {C:attention}в 3 раза",
          "чаще"
        }
      },
      b_paperback_proud = {
        name = "Гордая колода",
        text = {
          "Начните с полного набора",
          "{C:hearts}Червей{}, {C:diamonds}Бубен{}, {C:spades}Пик",
          "{C:clubs}Крестей{}, {C:paperback_crowns}Корон{} и {C:paperback_stars}Звезд"
        }
      }
    },
    Joker = {
      j_paperback_ice_cube = {
        name = "Кубик льда",
        text = {
          "{X:mult,C:white}X#1#{} Множитель за каждого",
          "{C:attention}Пищевого Джокера{}, который у вас есть",
          "Тает через {C:attention}#2#{} раундов",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#3#{C:inactive} Множитель)"
        }
      },
      j_paperback_champagne = {
        name = "Шампанское",
        text = {
          "Во время {C:attention}Слепого Босса{}, набранные",
          "карты приносят {C:money}$#1#{}, {C:attention}удваивается{}, если",
          "на карте есть {C:attention}печать",
          "{C:attention}Поглощается{} через {C:attention}#2#{} раундов"
        }
      },
      j_paperback_pocket_pair = {
        name = "Карманная пара",
        text = {
          "Зарабатывайте {C:money}$#1#{} за каждую {C:attention}#2#{}, вытянутую",
          "в начале раунда"
        }
      },
      j_paperback_alert = {
        name = "Тревога",
        text = {
          "Если {C:attention}сыгранная рука{} - это одиночная",
          "{C:attention}карта с лицом{}, уничтожьте ее",
          "{C:inactive}(#1#/#2#)?"
        }
      },
      j_paperback_legacy = {
        name = "Наследие",
        text = {
          "Когда не {C:attention}Улучшенная карта{} уничтожается,",
          "добавляет ее {C:chips}значение фишек",
          "как {C:mult}множ.{} к этой карте",
          "{C:inactive}(В настоящее время {C:mult}+#1#{C:inactive} Множитель)"
        }
      },
      j_paperback_backpack = {
        name = "Рюкзак",
        text = {
          "В {C:money}Магазинах{} есть дополнительный",
          "бесплатный {C:attention}Набор Скомороха"
        }
      },
      j_paperback_jester_of_nihil = {
        name = "Шут Нигила",
        text = {
          "{C:attention}Ослабляет{} масть {C:attention}последней",
          "{C:attention}набранной{} карты и дает {C:mult}+#1#{} Множитель",
          "за каждую {C:attention}ослабленную{} карту",
          "{C:inactive}(В настоящее время {V:1}#2#{C:inactive} и {C:mult}+#3#{C:inactive} Множитель)",
        }
      },
      j_paperback_forgery = {
        name = "Подделка",
        text = {
          "Копирует способность случайного {C:attention}Джокера",
          "каждую руку, если он предоставляет {X:mult,C:white}XМнож{},",
          "{C:mult}Множ{} или {C:chips}Фишки{}, умножает его значения",
          "между {X:attention,C:white}X#1#{} и {X:attention,C:white}X#2#",
          "{C:inactive}(В настоящее время {C:attention}#3#{C:inactive} на {X:attention,C:white}X#4#{C:inactive})"
        }
      },
      j_paperback_the_world = {
        name = "Мир",
        text = {
          "Все {C:chips}руки{} и {C:mult}сбросы{} считаются",
          "{C:attention}первыми{} и",
          "{C:attention}последними{} в раунде"
        }
      },
      j_paperback_epic_sauce = {
        name = "Эпический соус",
        text = {
          "{X:mult,C:white}X#1#{} Множитель",
          "Уничтожьте случайного {C:attention}Джокера{},",
          "если сыгранная рука не является",
          "{C:attention}первой рукой{} в раунде"
        }
      },
      j_paperback_find_jimbo = {
        name = "Найти Джимбо",
        text = {
          "После того, как рука набрана,",
          "каждая сыгранная {C:attention}#1#{} из",
          "{V:1}#2#{} приносит {C:money}$#3#{}",
          "{s:0.8}Карта меняется каждый раунд"
        },
      },
      j_paperback_cream_liqueur = {
        name = "Сливочный ликер",
        text = {
          "{C:attention}Метки{} приносят {C:money}$#1#{} при активации",
          "{C:green}#2# из #3#{} шанс, что эта карта будет",
          "поглощена в конце раунда"
        }
      },
      j_paperback_coffee = {
        name = "Кофе",
        text = {
          "{C:attention}+#1#{} размер руки,",
          "увеличивается на {C:attention}#2#{}, когда {C:attention}Слепой{} пропущен.",
          "{C:green}#3# из #4#{} шанс, что эта карта будет поглощена, когда",
          "выбран {C:attention}Малый Блайнд{} или {C:attention}Большой Блайнд{}",
        }
      },
      j_paperback_basic_energy = {
        name = "Базовая энергия Джокера",
        text = {
          "Использование любого {C:attention}Расходного материала{} имеет",
          "{C:green}#1# из #2#{} шанс сделать копию",
          "{C:inactive}(Нельзя сделать копию копии)",
          "{C:inactive}(Должно быть место)"
        }
      },
      j_paperback_big_misser = {
        name = "Большой промах",
        text = {
          "{X:mult,C:white}X#1#{} Множитель за каждый пустой",
          "слот для расходных материалов",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{}{C:inactive} Множитель)"
        }
      },
      j_paperback_complete_breakfast = {
        name = "Полный завтрак",
        text = {
          "{C:mult}+#1#{} Множитель и {C:chips}+#2#{} Фишек",
          "{C:green}#3# из #4#{} шанс, что эта карта будет",
          "съедена после сыгранной руки",
          "Шанс увеличивается на {C:attention}#5#{} после",
          "каждой сыгранной руки",
        },
      },
      j_paperback_emergency_broadcast = {
        name = "Экстренное вещание",
        text = {
          "Набранные {C:attention}5s{} и {C:attention}8s{} дают",
          "{C:mult}+#1#{} Множитель и {C:chips}+#2#{} Фишек",
        },
      },
      j_paperback_moribund = {
        name = "Умирающий",
        text = {
          "Этот Джокер получает {C:mult}+#1#{} Множитель, когда {C:attention}слепой",
          "очищается с {C:attention}0{C:chips} руками{} в запасе.",
          "Удваивает свой {C:mult}Множитель{}, если слепой не очищен",
          "{C:inactive}(В настоящее время {C:mult}+#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_crispy_taco = {
        name = "Хрустящее тако",
        text = {
          "{X:chips,C:white}X#1#{} Фишек. {C:green}#2# из #3#{} шанс, что эта карта",
          "будет съедена в конце раунда.",
        },
      },
      j_paperback_furioso = {
        name = "Фуриозо",
        text = {
          "Этот Джокер получает {X:mult,C:white}X#1#{} Множитель за",
          "каждый уникально набранный {C:attention}ранг{}.",
          "Сбрасывается после победы над {C:attention}боссом слепым",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{} {C:inactive}Множитель)",
          "{C:inactive}(Сыгранные ранги:{C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_soft_taco = {
        name = "Мягкое тако",
        text = {
          "{X:mult,C:white}X#1#{} Множитель. {C:green}#2# из #3#{} шанс, что эта карта",
          "будет съедена в конце раунда.",
        },
      },
      j_paperback_charred_marshmallow = {
        name = "Подгоревший зефир",
        text = {
          "Набранные {C:spades}Пики{} дают {C:mult}+#1#{} Множитель",
          "{C:green}#2# из #3#{} шанс, что эта карта будет",
          "съедена в конце раунда",
        },
      },
      j_paperback_joker_cookie = {
        name = "Печенье Джокера",
        text = {
          "Зарабатывайте {C:money}$#1#{} в конце раунда",
          "Выплата увеличивается на {C:money}$#2#{} при обналичивании",
          "{C:green}#3# из #4#{} шанс, что эта карта",
          "будет съедена в конце раунда",
        },
      },
      j_paperback_pop_stick = {
        name = "Палочка от леденца",
        text = {
          "Дает {X:mult,C:white}X#1#{} Множитель за каждого",
          "другого {C:attention}\"Стика\"{} Джокера, который у вас есть...",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_pool_table = {
        name = "Бильярдный стол",
        text = {
          "Если первая рука раунда",
          "не набирает {C:attention}карты с картинками{},",
          "создайте {C:planet}Планетную{} карту",
          "сыгранной {C:attention}покерной руки",
          "{C:inactive}(Должно быть место)",
        },
      },
      j_paperback_bicycle = {
        name = "Велосипед",
        text = {
          "{C:attention}Дикие карты{} дают {C:mult}Множитель",
          "равный их {C:chips}Бонусу фишек{},",
          "затем {X:mult,C:white}X#1#{} Множитель",
        },
      },
      j_paperback_stamp = {
        name = "Штамп",
        text = {
          "{C:green}#1# из #2#{} шанс, что этот",
          "Джокер получает {C:chips}+#3#{} Фишек, когда",
          "набрана любая карта с {C:attention}печатью{}",
          "{C:inactive}(В настоящее время {C:chips}+#4#{C:inactive} Фишек)",
        },
      },
      j_paperback_sticky_stick = {
        name = "Липкий стик",
        text = {
          "Дает {X:mult,C:white}X#1#{} Множитель за каждого",
          "другого {C:attention}\"Стика\"{} Джокера, который у вас есть...",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_shopping_center = {
        name = "Торговый центр",
        text = {
          "В {C:money}Магазинах{} есть дополнительный",
          "{C:attention}слот для карт",
        },
      },
      j_paperback_ghost_cola = {
        name = "Призрачная кола",
        text = {
          "Продайте эту карту, чтобы создать {C:attention}#1#{}",
          "и случайную {C:dark_edition}Отрицательную{} {C:spectral}Спектральную{} карту.",
        },
      },
      j_paperback_river = {
        name = "Река",
        text = {
          "Если сыгранная рука содержит {C:attention}5 набирающих очки",
          "{C:attention}карт{}, заработайте {C:chips}Бонус фишек{} самой низкой",
          "карты, набирающей очки, как {C:money}Деньги",
          "{C:inactive}(Максимум {C:money}$#1#{C:inactive})",
        },
      },
      j_paperback_solemn_lament = {
        name = "Торжественная песнь",
        text = {
          "Повторно активируйте {C:attention}первую{} набранную карту",
          "{C:attention}один раз{} за каждую оставшуюся",
          "{C:chips}руку{} или {C:mult}сброс{}",
          "{C:inactive}(Наименьшее из двух)",
        },
      },
      j_paperback_hole_in_one = {
        name = "Попадание в лунку с первого удара",
        text = {
          "Если первая {C:chips}рука{} раунда очистила",
          "{C:attention}слепого{}, удвойте {C:attention}стоимость продажи{} всех {C:attention}карт",
          "{C:inactive}(Максимум {C:money}$#1#{C:inactive} за раунд)",
          "Когда эта карта продана, установите {C:attention}стоимость",
          "{C:attention}продажи{} всех {C:attention}карт{} на {C:money}$0"
        },
      },
      j_paperback_mismatched_sock = {
        name = "Непарный носок",
        text = {
          "Этот Джокер получает {C:mult}+#1#{} Множитель",
          "если сыгранная рука не содержит {C:attention}пар{}",
          "{C:inactive}(В настоящее время {C:mult}+#2# {C:inactive}Множитель)",
        },
      },
      j_paperback_quick_fix = {
        name = "Быстрая починка",
        text = {
          "{C:attention}+#1#{} размер руки",
          "{C:green}#2# из #3#{} шанс, что эта",
          "карта будет уничтожена",
          "в конце раунда",
        },
      },
      j_paperback_skydiver = {
        name = "Парашютист",
        text = {
          "{C:white,X:mult}X#1#{} Множитель, если все {C:attention}набранные карты{} меньше",
          "или равны {C:attention}самой низкой по рангу",
          "карте, набранной в этом раунде",
          "{C:inactive}(Обновляется в конце сыгранной руки{C:inactive})",
          "{C:inactive}(В настоящее время: {C:attention}#2#{C:inactive})",
        },
      },
      j_paperback_blue_bonnets = {
        name = "Синие чепчики",
        text = {
          "{C:clubs}Крести{} дают {X:mult,C:white}X#1#{} Множитель при наборе очков.",
          "Увеличивается на {X:mult,C:white}X#2#{} Множитель за каждую",
          "последовательно набранную {C:clubs}Кресть{}",
          "{C:inactive}(Сбрасывается после каждой сыгранной руки)",
        },
      },
      j_paperback_great_wave = {
        name = "Большая волна",
        text = {
          "Повторно активируйте {C:attention}самую правую{} набранную карту",
          "{C:attention}один раз{} за каждую {C:attention}сыгранную карту{}",
        },
      },
      j_paperback_caramel_apple = {
        name = "Карамельное яблоко",
        text = {
          "Набранные {C:clubs}Крести{} дают {C:mult}+#1#{} Множитель",
          "{C:green}#2# из #3#{} шанс, что эта карта будет",
          "съедена в конце раунда",
        },
      },
      j_paperback_nachos = {
        name = "Начос",
        text = {
          "{X:chips,C:white}X#1#{} Фишек,",
          "теряет {X:chips,C:white}X#2#{} Фишек",
          "за каждую {C:attention}карту{} сброшенную",
        },
      },
      j_paperback_pride_flag_spectrums = {
        name = "Флаг гордости",
        text = {
          "Получает {C:chips}+#1#{} Фишек, если сыгранная",
          "рука содержит {C:attention}Спектр",
          "Сбрасывается, если сыгранная рука",
          "содержит {C:attention}Стрит",
          "{C:inactive}(В настоящее время {C:chips}+#2#{} {C:inactive}Фишек)"
        },
      },
      j_paperback_pride_flag_no_spectrums = {
        name = "Флаг гордости",
        text = {
          "Получает {C:mult}+#1#{} Множитель, если набранная рука",
          "содержит {C:attention}три{} уникальные масти",
          "{C:inactive}(В настоящее время {C:mult}+#2#{} {C:inactive}Множитель)",
        },
      },
      j_paperback_sacrificial_lamb = {
        name = "Жертвенный ягненок",
        text = {
          "Получает {C:mult}+#1#{} Множитель за",
          "каждую карту или Джокера {C:attention}уничтоженного",
          "{C:inactive}(В настоящее время {C:mult}+#2# {C:inactive}Множитель)",
        },
      },
      j_paperback_autumn_leaves = {
        name = "Осенние листья",
        text = {
          "{C:diamonds}Бубны{} дают {X:mult,C:white}X#1#{} Множитель при наборе очков.",
          "Увеличивается на {X:mult,C:white}X#2#{} Множитель за каждую",
          "последовательно набранную {C:diamonds}Бубну{}",
          "{C:inactive}(Сбрасывается после каждой сыгранной руки)",
        },
      },
      j_paperback_wild_prize = {
        name = "[[ДИКИЙ ПРИЗ!1!]]",
        text = {
          "{C:attention}Дикие карты{} имеют {C:green}#1# из #2#{} шанс",
          "быть {C:attention}повторно активированными{} и {C:green}#1# из #3#{} шанс",
          "заработать от {C:money}$#4#{} до {C:money}$#5#{} при наборе очков",
        },
      },
      j_paperback_wish_you_were_here = {
        name = "Жаль, что ты здесь",
        text = {
          "Дает {C:mult}Множитель{}, равный {C:mult}#1#X{} от",
          "{C:attention}стоимости продажи{} этой карты.",
          "Получает {C:money}$#2#{} от {C:attention}стоимости продажи{} в",
          "конце раунда",
          "{C:inactive}(В настоящее время {C:mult}+#3# {C:inactive}Множитель){}",
        },
      },
      j_paperback_calling_card = {
        name = "Визитная карточка",
        text = {
          "Этот Джокер получает {X:red,C:white}X#1#{} Множитель",
          "всякий раз, когда вы побеждаете {C:attention}Слепого Босса{}",
          "или активируете его {C:attention}способность{}",
          "{C:inactive}(В настоящее время {}{X:red,C:white}X#2#{}{C:inactive} Множитель){}",
        },
      },
      j_paperback_subterfuge = {
        name = "Уловка",
        text = {
          "Уничтожает {C:attention}первую сыгранную",
          "{C:attention}руку{} каждый раунд"
        },
      },
      j_paperback_triple_moon_goddess = {
        name = "Тройная лунная богиня",
        text = {
          "Если сыгранная рука содержит {C:attention}Тройку{},",
          "{C:green}#1# из #2#{} шанс создать случайную {C:planet}Планетную{} карту и",
          "{C:green}#3# из #4#{} шанс создать случайную {C:purple}Карту Таро{}",
        },
      },
      j_paperback_derecho = {
        name = "Деречо",
        text = {
          "Получает {X:mult,C:white}X#1#{} Множитель, если {C:attention}набранная рука",
          "содержит только {C:spades}темные масти",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_jestrica = {
        name = "Джестрика",
        text = {
          "{C:mult}+#1#{} Множитель, когда набрана {C:attention}8{}",
          "Сбрасывается, если в этом раунде не было набрано {C:attention}8{}",
          "{C:inactive}(В настоящее время {C:mult}+#2#{C:inactive} Множитель)"
        },
      },
      j_paperback_grand_strategy = {
        name = "Гранд Стратегия",
        text = {
          "Этот Джокер дает {X:mult,C:white}X#1#{} Множитель, если",
          "{C:attention}#2#{} уникальных {C:attention}улучшений{}, {C:attention}изданий{},",
          "или {C:attention}печатей{} есть в вашей полной колоде",
          "{C:inactive}(В настоящее время {C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_solar_system = {
        name = "Солнечная система",
        text = {
          "Дает {X:mult,C:white}X#1#{} Множитель за",
          "каждый {C:attention}уровень{}, который разделяют все 9 базовых",
          "{C:planet}Планет{}",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{} {C:inactive}Множитель)",
        },
      },
      j_paperback_reference_card = {
        name = "Справочная карта",
        text = {
          "Получает {X:mult,C:white}X#1#{} Множитель за каждый раз, когда {C:attention}все{} 9",
          "{C:attention}базовых покерных рук{} были сыграны",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{} {C:inactive}Множитель)",
        },
      },
      j_paperback_dreamsicle = {
        name = "Сливочное мороженое",
        text = {
          "Набранные {C:diamonds}Бубны{} дают {C:mult}+#1#{} Множитель",
          "{C:green}#2# из #3#{} шанс, что эта карта будет",
          "съедена в конце раунда",
        },
      },
      j_paperback_jimbo_adventure = {
        name = "Приключение Джимбо",
        text = {
          "Пропуск {C:attention}слепого{} создает",
          "случайную {C:attention}Метку{}",
        },
      },
      j_paperback_union_card = {
        name = "Профсоюзный билет",
        text = {
          "{C:attention}Стоимость продажи{} всех {C:attention}карт{} заблокирована",
          "на {C:money}$0{}, пока эта карта не будет продана",
          "Дает {X:mult,C:white}X{} Множитель, равный",
          "количеству набранных {C:paperback_light_suit}светлых мастей{}",
          "в сыгранной руке",
        },
      },
      j_paperback_cherry_blossoms = {
        name = "Цветущая вишня",
        text = {
          "{C:hearts}Черви{} дают {X:mult,C:white}X#1#{} Множитель при наборе очков.",
          "Увеличивается на {X:mult,C:white}X#2#{} Множитель за каждую",
          "последовательно набранную {C:hearts}Черву{}",
          "{C:inactive}(Сбрасывается после каждой сыгранной руки)",
        },
      },
      j_paperback_paranoia = {
        name = "Паранойя",
        text = {
          "После набора руки,",
          "уничтожьте все {C:paperback_dark_suit}темные масти{}, сыгранные",
          "и все {C:paperback_light_suit}светлые масти{}, находящиеся в руке",
        },
      },
      j_paperback_unholy_alliance = {
        name = "Нечестивый союз",
        text = {
          "Этот Джокер получает {X:mult,C:white}X#1#{} Множитель",
          "когда карта или джокер {C:attention}уничтожены{}",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_summoning_circle = {
        name = "Круг призыва",
        text = {
          "Если сыгранная рука содержит",
          "{C:attention}Пять карт одного ранга{}, создайте копию",
          "случайного {C:attention}расходного материала",
          "{C:inactive}(Должно быть место)",
        },
      },
      j_paperback_pointy_stick = {
        name = "Острая палка",
        text = {
          "Дает {X:mult,C:white}X#1#{} Множитель за каждого",
          "другого {C:attention}\"Стика\"{} Джокера, который у вас есть...",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_prince_of_darkness = {
        name = "Принц тьмы",
        text = {
          "Если рука, набирающая очки, содержит {C:hearts}Черву{}",
          "и {C:attention}#1#{} уникальные масти, этот Джокер дает",
          "{X:mult,C:white}X#2#{} Множитель для следующих {C:chips}#3#{} рук",
          "{C:inactive}(В настоящее время следующие {C:chips}#4#{C:inactive} руки)",
        },
      },
      j_paperback_popsicle_stick = {
        name = "Палочка от эскимо",
        text = {
          "Дает {X:mult,C:white}X#1#{} Множитель за каждого",
          "другого {C:attention}\"Стика\"{} Джокера, который у вас есть...",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_let_it_happen = {
        name = "Пусть случится",
        text = {
          "Если рука не была сыграна в этом Анте,",
          "сбалансируйте {C:mult}Множитель{} и {C:chips}Фишки{}",
          "{C:inactive}(Сыгранные руки:{C:attention}#1#{C:inactive})",
        },
      },
      j_paperback_evergreens = {
        name = "Вечнозеленые",
        text = {
          "{C:spades}Пики{} дают {X:mult,C:white}X#1#{} Множитель при наборе очков.",
          "Увеличивается на {X:mult,C:white}X#2#{} Множитель за каждую",
          "последовательно набранную {C:spades}Пику{}",
          "{C:inactive}(Сбрасывается после каждой сыгранной руки)",
        },
      },
      j_paperback_cakepop = {
        name = "Кейкпоп",
        text = {
          "Набранные {C:hearts}Черви{} дают {C:mult}+#1#{} Множитель",
          "{C:green}#2# из #3#{} шанс, что эта карта будет",
          "съедена в конце раунда",
        },
      },
      j_paperback_black_rainbows = {
        name = "Черные радуги",
        text = {
          "Набранные {C:spades}Пики{} и {C:clubs}Крести",
          "имеют {C:green}#1# из #2#{} шанс",
          "стать {C:dark_edition}Полихромными"
        }
      },
      j_paperback_meeple = {
        name = "Мипл",
        text = {
          "Набранные {C:attention}карты с картинками{} имеют",
          "{C:green}#1# из #2#{} шанс",
          "дать {C:mult}+#3#{} Сброс(ов)"
        }
      },
      j_paperback_apple = {
        name = "Яблоко",
        text = {
          "Набранные {C:hearts}Черви{} имеют",
          "{C:green}#1# из #2#{} шанс дать",
          "{C:dark_edition}Отрицательный {C:attention}Расходный материал",
          "{S:1.1,C:red,E:2}самоуничтожается",
        }
      },
      j_paperback_heretical_joker = {
        name = "Еретический Джокер",
        text = {
          "Сыгранные карты с",
          "{C:paperback_stars}Звездной{} мастью дают",
          "{C:mult}+#1#{} Множитель при наборе очков",
        },
      },
      j_paperback_fraudulent_joker = {
        name = "Мошеннический Джокер",
        text = {
          "Сыгранные карты с",
          "{C:paperback_crowns}Коронной{} мастью дают",
          "{C:mult}+#1#{} Множитель при наборе очков",
        },
      },
      j_paperback_rock_candy = {
        name = "Леденец",
        text = {
          "Набранные {C:paperback_stars}Звезды{} дают {C:mult}+#1#{} Множитель",
          "{C:green}#2# из #3#{} шанс, что эта карта будет",
          "съедена в конце раунда",
        },
      },
      j_paperback_rockin_stick = {
        name = "Рок-н-ролльная палочка",
        text = {
          "Дает {X:mult,C:white}X#1#{} Множитель за каждого",
          "другого {C:attention}\"Палочного\"{} Джокера...",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_tanghulu = {
        name = "Танхулу",
        text = {
          "Набранные {C:paperback_crowns}Короны{} дают {C:mult}+#1#{} Множитель",
          "{C:green}#2# из #3#{} шанс, что эта карта будет",
          "съедена в конце раунда",
        },
      },
      j_paperback_sweet_stick = {
        name = "Сладкая палочка",
        text = {
          "Дает {X:mult,C:white}X#1#{} Множитель за каждого",
          "другого {C:attention}\"Палочного\"{} Джокера...",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_quartz = {
        name = "Кварц",
        text = {
          "Набранные {C:paperback_stars}Звезды{} дают {X:chips,C:white}X#1#{} Фишек",
          "за каждую другую сыгранную {C:paperback_stars}Звезду{}"
        }
      },
      j_paperback_pyrite = {
        name = "Пирит",
        text = {
          "Набранные {C:paperback_crowns}Короны{} приносят",
          "от {C:money}$#1#{} до {C:money}$#2#{}"
        }
      }
    },
    paperback_minor_arcana = {
      c_paperback_ace_of_cups = {
        name = "Туз Кубков",
        text = {
          "Добавляет {C:chips}Синий Зажим{} к",
          "до {C:attention}#1#{} выбранных карт"
        }
      },
      c_paperback_two_of_cups = {
        name = "Двойка Кубков",
        text = {
          "Выберите {C:attention}#1#{} карты, {C:attention}средняя{} карта",
          "наследует {C:chips}масть{} {C:chips}левой{} карты",
          "и {C:mult}ранг{} {C:mult}правой{} карты, обе",
          "{C:chips}левая{} и {C:mult}правая{} карты уничтожаются",
          "{C:inactive}(Перетащите для перестановки)"
        }
      },
      c_paperback_three_of_cups = {
        name = "Тройка Кубков",
        text = {
          "Добавляет {C:paperback_black}Черный Зажим{} к",
          "до {C:attention}#1#{} выбранных карт"
        }
      },
      c_paperback_four_of_cups = {
        name = "Четверка Кубков",
        text = {
          "Удаляет {C:attention}улучшения{}, {C:attention}печати{} и",
          "{C:attention}издания{} с до {C:attention}#1#{} выбранных",
          "карт и приносит {C:money}$#2#{} за каждое",
          "удаленное"
        }
      },
      c_paperback_five_of_cups = {
        name = "Пятерка Кубков",
        text = {
          "Улучшает {C:attention}#1#{}",
          "выбранные карты до",
          "{C:attention}#2#ек{}"
        }
      },
      c_paperback_six_of_cups = {
        name = "Шестерка Кубков",
        text = {
          "Выберите карту и получите",
          "{C:attention}половину{} ее {C:chips}ценности в фишках",
          "в виде {C:money}денег{}"
        }
      },
      c_paperback_seven_of_cups = {
        name = "Семерка Кубков",
        text = {
          "Дает случайное {C:attention}улучшение",
          "до {C:attention}#1#{} выбранных карт"
        }
      },
      c_paperback_eight_of_cups = {
        name = "Восьмерка Кубков",
        text = {
          "Преобразует до {C:attention}#1#{} выбранных",
          "карт в масть, которая",
          "не {C:attention}выбрана в данный момент"
        }
      },
      c_paperback_nine_of_cups = {
        name = "Девятка Кубков",
        text = {
          "Уничтожает выбранного {C:attention}Джокера{} и",
          "создает нового {C:attention}Джокера{} той же",
          "{C:attention}редкости{}, или выше, если возможно",
          "{C:inactive}(Нельзя улучшить до {C:legendary}Легендарного{C:inactive})"
        }
      },
      c_paperback_ten_of_cups = {
        name = "Десятка Кубков",
        text = {
          "{C:green}#1# из #2#{} шанс добавить",
          "{C:dark_edition}Полихромное{} издание к",
          "выбранной карте"
        }
      },
      c_paperback_page_of_cups = {
        name = "Паж Кубков",
        text = {
          "Добавляет {C:inactive}Белый Зажим{} к",
          "до {C:attention}#1#{} выбранных карт"
        }
      },
      c_paperback_knight_of_cups = {
        name = "Рыцарь Кубков",
        text = {
          "Выберите {C:attention}#1#{} карты, {C:attention}левая{} карта",
          "копирует {C:attention}все{} с {C:attention}правой",
          "карты, кроме {C:attention}ранга{} и {C:attention}масти",
          "Уничтожает {C:attention}правую{} карту",
          "{C:inactive}(Перетащите для перестановки)"
        }
      },
      c_paperback_queen_of_cups = {
        name = "Королева Кубков",
        text = {
          "Улучшает {C:attention}#1#{} выбранную",
          "карту в",
          "{C:attention}#2#{}",
        }
      },
      c_paperback_king_of_cups = {
        name = "Король Кубков",
        text = {
          "Получите {C:money}$#1#{} за каждую масть со всеми",
          "13 {C:attention}базовыми рангами{}, которые у вас есть",
          "{C:inactive}(В настоящее время {C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_ace_of_swords = {
        name = "Туз Мечей",
        text = {
          "Преобразует до",
          "{C:attention}#1#{} выбранных карт",
          "в {V:1}#2#{}",
        }
      },
      c_paperback_ace_of_pentacles = {
        name = "Туз Пентаклей",
        text = {
          "Преобразует до",
          "{C:attention}#1#{} выбранных карт",
          "в {V:1}#2#{}",
        }
      }
    },
    Planet = {
      c_paperback_quaoar = {
        name = "Кваоар",
      },
      c_paperback_haumea = {
        name = "Хаумеа",
      },
      c_paperback_sedna = {
        name = "Седна",
      },
      c_paperback_makemake = {
        name = "Макемаке",
      },
    },
    Enhanced = {
      m_paperback_porcelain = {
        name = "Фарфоровая карта",
        text = {
          "Приносит от {C:money}$#1#{}",
          "до {C:money}$#2#{} при наборе очков",
          "{C:green}#3# из #4#{} шанс быть",
          "{C:mult}уничтоженной{}"
        }
      },
      m_paperback_soaked = {
        name = "Промокшая карта",
        text = {
          "Карты, {C:attention}удерживаемые в руке{},",
          "набирают свою {C:chips}ценность в фишках{}",
          "{C:green}#1# из #2#{} шанс быть",
          "уничтоженными при {C:mult}сбросе{}",
        }
      }
    },
    Other = {
      paperback_energized = {
        name = "Энергичный",
        text = {
          "Не может быть скопирован",
          "{C:attention}Базовой энергией Джокера{}"
        }
      },
      paperback_light_suits = {
        name = "Светлые масти",
        text = {
          "{C:diamonds}Бубны{}, {C:hearts}Червы{}"
        }
      },
      paperback_dark_suits = {
        name = "Темные масти",
        text = {
          "{C:spades}Пики{}, {C:clubs}Крести{}"
        }
      },
      paperback_requires_custom_suits = {
        name = "Требуются пользовательские масти",
        text = {
          "Удалено из пула из-за",
          "{C:attention}Пользовательских мастей{}, которые",
          "отключены в {C:legendary}Paperback",
        }
      },
      paperback_requires_enhancements = {
        name = "Требуются улучшения",
        text = {
          "Удалено из пула из-за",
          "{C:attention}Улучшений{}, которые",
          "отключены в {C:legendary}Paperback",
        }
      },
      paperback_requires_paperclips = {
        name = "Требуются скрепки",
        text = {
          "Удалено из пула из-за",
          "{C:attention}Скрепок{}, которые",
          "отключены в {C:legendary}Paperback",
        }
      },

      -- Paperclips
      paperback_blue_clip = {
        name = "Синяя скрепка",
        text = {
          "{X:chips,C:white}X#1#{} Фишек",
          "Увеличивается на {X:chips,C:white}X#2#{} за",
          "каждую {C:attention}Скрепку{} в {C:attention}удерживаемой руке"
        }
      },
      paperback_black_clip = {
        name = "Черная скрепка",
        text = {
          "Повторно активируется, если другая",
          "{C:attention}Скрепка{} находится в {C:attention}сыгранной руке",
          "и снова, если {C:attention}Скрепка{} находится",
          "в {C:attention}удерживаемой руке"
        }
      },
      paperback_white_clip = {
        name = "Белая скрепка",
        text = {
          "Если {C:attention}удерживается в руке{} в {C:attention}конце",
          "{C:attention}раунда{}, навсегда получает {C:chips}+2",
          "Фишек за каждую {C:attention}Скрепку{}, набранную",
          "в этом раунде"
        }
      },

      -- Minor Arcana
      p_paperback_minor_arcana_normal = {
        name = "Набор малых арканов",
        text = {
          "Выберите {C:attention}#1#{} из до {C:attention}#2#",
          "{C:paperback_minor_arcana}Малых арканов{},",
          "для немедленного использования"
        }
      }
    },
  },
  misc = {
    dictionary = {
      -- Badge under cards
      k_paperback_minor_arcana = "Малые арканы",
      -- Name of consumable type in collection
      b_paperback_minor_arcana_cards = "Малые арканы",
      -- Text shown at the bottom while opening booster
      paperback_minor_arcana_pack = "Набор малых арканов",

      paperback_polychrome_ex = "Полихром!",
      paperback_destroyed_ex = "Уничтожено!",
      paperback_doubled_ex = "Удвоено!",
      paperback_too_late_ex = "СЛИШКОМ ПОЗДНО!",
      paperback_broken_ex = "Сломано!",
      paperback_none = "Нет",
      paperback_downgrade_ex = "Понижение!",
      paperback_copy_ex = "Копия!",
      paperback_consumed_ex = "Поглощено!",
      paperback_too_hot_ex = "Слишком горячо!",
      paperback_inactive = "Неактивно",
      paperback_supplies_ex = "Припасы!",
      paperback_melted_ex = "Растоплено!",

      paperback_ui_requires_restart = "Требуется перезапуск",
      paperback_ui_enable_jokers = "Включить джокеров",
      paperback_ui_enable_minor_arcana = "Включить малые арканы",
      paperback_ui_enable_enhancements = "Включить улучшения",
      paperback_ui_enable_paperclips = "Включить скрепки",
      paperback_ui_custom_suits_enabled = "Включить пользовательские масти",
      paperback_ui_developers = "Разработчики",
      paperback_ui_artists = "Художники",
      paperback_ui_localization = "Локализация",
      paperback_ui_paperclips = "Скрепки",
    },
    v_dictionary = {
      paperback_a_discards_ex = "+#1# Сбросов!",
      paperback_a_hands_minus = "-#1# Рук",
      paperback_prince_of_darkness = "+#1# Множитель, +#2# Фишек",
      paperback_a_completion = "#1#/#2#",
      paperback_a_round_minus = "-#1# Раунд"
    },
    suits_singular = {
      paperback_Crowns = "Корона",
      paperback_Stars = 'Звезда'
    },
    suits_plural = {
      paperback_Crowns = "Короны",
      paperback_Stars = 'Звезды'
    },
    poker_hands = {
      ['paperback_Spectrum'] = "Спектр",
      ['paperback_Straight Spectrum'] = "Прямой спектр",
      ['paperback_Straight Spectrum (Royal)'] = "Королевский прямой спектр",
      ['paperback_Spectrum House'] = "Спектральный дом",
      ['paperback_Spectrum Five'] = "Спектральная пятерка",
    },
    poker_hand_descriptions = {
      ['paperback_Spectrum'] = {
        "5 карт с разными мастями"
      },
      ['paperback_Straight Spectrum'] = {
        "5 карт подряд (последовательные ранги),",
        "каждая с разной мастью"
      },
      ['paperback_Spectrum House'] = {
        "Тройка и пара с",
        "каждой картой, имеющей разную масть"
      },
      ['paperback_Spectrum Five'] = {
        "5 карт одного ранга,",
        "каждая с разной мастью"
      },
    },
    labels = {
      paperback_red_clip = "Красная скрепка",
      paperback_blue_clip = "Синяя скрепка",
      paperback_black_clip = "Черная скрепка",
      paperback_white_clip = "Белая скрепка",
    }
  }
}
