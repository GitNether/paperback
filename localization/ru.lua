return {
  descriptions = {
    Joker = {
      j_paperback_champagne = {
        name = "Шампанское",
        text = {
          "Во время {C:attention}Босс Блайнда{}, полученные",
          "карты приносят {C:money}$#1#{}, {C:attention}удваивается{}, если",
          "на карте есть {C:attention}печать",
          "{C:attention}Поглощается{} через {C:attention}#2#{} раундов"
        }
      },
      j_paperback_pocket_pair = {
        name = "Карманная Пара",
        text = {
          "Зарабатывайте {C:money}$#1#{} за каждую {C:attention}#2#{}, вытянутую",
          "в начале раунда"
        }
      },
      j_paperback_alert = {
        name = "Тревога",
        text = {
          "Если {C:attention}сыгранная рука{} является одиночной",
          "{C:attention}картой с лицом{}, уничтожьте её",
          "{C:inactive}(#1#/#2#)?"
        }
      },
      j_paperback_legacy = {
        name = "Наследие",
        text = {
          "Когда {C:attention}не улучшенная карта{} уничтожается, добавляет {C:attention}удвоенное{} значение её {C:chips}фишек",
          "{C:chips}в виде {C:mult}множителя{} к этой карте",
          "{C:inactive}(Текущий {C:mult}+#2#{C:inactive} Множитель)"
        }
      },
      j_paperback_backpack = {
        name = "Рюкзак",
        text = {
          "В магазинах есть дополнительный",
          "{C:attention}Набор Шута"
        }
      },
      j_paperback_jester_of_nihil = {
        name = "Шут Нигила",
        text = {
          "{C:attention}Ослабляет{} масть {C:attention}последней",
          "{C:attention}полученной{} карты и даёт {C:mult}+#1#{} Множитель",
          "за каждую {C:attention}ослабленную{} карту",
          "{C:inactive}(В настоящее время {V:1}#2#{C:inactive} и {C:mult}+#3#{C:inactive} Множитель)",
        }
      },
      j_paperback_forgery = {
        name = "Подделка",
        text = {
          "Копирует способность случайного {C:attention}Джокера",
          "каждую руку, если он предоставляет {X:mult,C:white}XMult{},",
          "{C:mult}Множитель{} или {C:chips}Фишки{}, умножает его значения",
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
        name = "Эпический Соус",
        text = {
          "{X:mult,C:white}X#1#{} Множитель",
          "Уничтожьте случайного {C:attention}Джокера{}",
          "если сыгранная рука не является",
          "{C:attention}первой рукой{} в раунде"
        }
      },
      j_paperback_find_jimbo = {
        name = "Найти Джимбо",
        text = {
          "После получения руки,",
          "каждая сыгранная {C:attention}#1#{}",
          "{V:1}#2#{} приносит {C:money}$#3#{}",
          "{s:0.8}Карта меняется каждый раунд"
        },
      },
      j_paperback_cream_liqueur = {
        name = "Сливочный Ликёр",
        text = {
          "{C:attention}Метки{} приносят {C:money}$#1#{} при активации",
          "{C:green}#2# к #3#{} шанс, что эта карта будет",
          "поглощена в конце раунда"
        }
      },
      j_paperback_coffee = {
        name = "Кофе",
        text = {
          "{C:attention}+#1#{} размер руки,",
          "увеличивается на {C:attention}#2#{}, когда {C:attention}Блайнд{} пропущен.",
          "{C:green}#3# к #4#{} шанс, что эта карта будет поглощена, когда",
          "выбран {C:attention}Малый Блайнд{} или {C:attention}Большой Блайнд{}",
        }
      },
      j_paperback_basic_energy = {
        name = "Базовая Энергия Джокера",
        text = {
          "Использование любого {C:attention}Расходника{} имеет",
          "{C:green}#1# к #2#{} шанс создать копию",
          "{C:inactive}(Не может создать копию копии)",
          "{C:inactive}(Должно быть место)"
        }
      },
      j_paperback_big_misser = {
        name = "Большой Промах",
        text = {
          "{X:mult,C:white}X#1#{} Множитель за каждый пустой",
          "слот для расходников",
          "{C:inactive}(В настоящее время {X:mult,C:white}X#2#{}{C:inactive} Множитель)"
        }
      },
      j_paperback_complete_breakfast = {
        name = "Полный Завтрак",
        text = {
          "{C:mult}+#1#{} Множитель и {C:chips}+#2#{} Фишек",
          "{C:green}#3# к #4#{} шанс, что эта карта будет",
          "съедена после сыгранной руки",
          "Шанс увеличивается на {C:attention}#5#{} после",
          "каждой сыгранной руки",
        },
      },
      j_paperback_emergency_broadcast = {
        name = "Экстренное Вещание",
        text = {
          "Полученные {C:attention}5{} и {C:attention}8{} дают",
          "{C:mult}+#1#{} Множитель и {C:chips}+#2#{} Фишек",
        },
      },
      j_paperback_moribund = {
        name = "Умирающий",
        text = {
          "Этот Джокер получает {C:mult}+#1#{} Множитель, когда {C:attention}блайнд",
          "очищен с {C:attention}0{C:chips} руками{} в запасе.",
          "Удваивает свой {C:mult}Множитель{}, если блайнд не очищен",
          "{C:inactive}(Текущий {C:mult}+#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_crispy_taco = {
        name = "Хрустящее Тако",
        text = {
          "{X:chips,C:white}X#1#{} Фишек. {C:green}#2# к #3#{} шанс, что эта карта",
          "будет съедена в конце раунда.",
        },
      },
      j_paperback_furioso = {
        name = "Фуриозо",
        text = {
          "Этот Джокер получает {X:mult,C:white}X#1#{} Множитель за",
          "каждый уникально полученный {C:attention}ранг{}.",
          "Сбрасывается после победы над {C:attention}босс блайндом",
          "{C:inactive}(Текущий {X:mult,C:white}X#2#{} {C:inactive}Множитель)",
          "{C:inactive}(Сыгранные ранги:{C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_soft_taco = {
        name = "Мягкое Тако",
        text = {
          "{X:mult,C:white}X#1#{} Множитель. {C:green}#2# к #3#{} шанс, что эта карта",
          "будет съедена в конце раунда.",
        },
      },
      j_paperback_charred_marshmallow = {
        name = "Подгоревший Зефир",
        text = {
          "Полученные {C:spades}Пики{} дают {C:mult}+#1#{} Множитель",
          "{C:green}#2# к #3#{} шанс, что эта карта будет",
          "съедена в конце раунда",
        },
      },
      j_paperback_joker_cookie = {
        name = "Печенье Джокера",
        text = {
          "Зарабатывайте {C:money}$#1#{} в конце раунда",
          "Выплата увеличивается на {C:money}$#2#{} при обналичивании",
          "{C:green}#3# к #4#{} шанс, что эта карта",
          "будет съедена в конце раунда",
        },
      },
      j_paperback_pop_stick = {
        name = "Палочка от Чупа-Чупса",
        text = {
          "Даёт {X:mult,C:white}X#1#{} Множитель за каждую другую",
          "{C:attention}\"Палку\"{}, которая у вас есть...",
          "{C:inactive}(Текущий {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_pool_table = {
        name = "Бильярдный Стол",
        text = {
          "Если первая рука в раунде",
          "не содержит {C:attention}карт с лицами{},",
          "создайте {C:planet}Планету{} карты",
          "сыгранной {C:attention}покерной руки",
          "{C:inactive}(Должно быть место)",
        },
      },
      j_paperback_bicycle = {
        name = "Велосипед",
        text = {
          "{C:attention}Дикие Карты{} дают {C:mult}Множитель",
          "равный их {C:chips}Бонусу Фишек{},",
          "затем {X:mult,C:white}X#1#{} Множитель",
        },
      },
      j_paperback_stamp = {
        name = "Штамп",
        text = {
          "{C:green}#1# к #2#{} шанс, что этот",
          "Джокер получит {C:chips}+#3#{} Фишек, когда",
          "любая карта с {C:attention}печатью{} получена",
          "{C:inactive}(Текущий {C:chips}+#4#{C:inactive} Фишек)",
        },
      },
      j_paperback_sticky_stick = {
        name = "Липкий Стик",
        text = {
          "Даёт {X:mult,C:white}X#1#{} Множитель за каждого",
          "другого {C:attention}\"Стика\"{} Джокера, который у вас есть...",
          "{C:inactive}(Текущий {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_shopping_center = {
        name = "Торговый Центр",
        text = {
          "{C:money}В Магазинах{} есть дополнительный",
          "{C:attention}слот для карт",
        },
      },
      j_paperback_ghost_cola = {
        name = "Призрачная Кола",
        text = {
          "Продайте эту карту, чтобы создать {C:attention}#1#{}",
          "и случайную {C:dark_edition}Отрицательную{} {C:spectral}Спектральную{} карту.",
        },
      },
      j_paperback_river = {
        name = "Река",
        text = {
          "Если сыгранная рука содержит {C:attention}5 карт, приносящих очки{},",
          "заработайте {C:chips}Бонус Фишек{} самой низкой",
          "карты в виде {C:money}Денег",
          "{C:inactive}(Максимум {C:money}$#1#{C:inactive})",
        },
      },
      j_paperback_solemn_lament = {
        name = "Торжественная Скорбь",
        text = {
          "Повторно активируйте {C:attention}первую{} полученную карту",
          "{C:attention}один раз{} за каждую оставшуюся",
          "{C:chips}руку{} или {C:mult}сброс{}",
          "{C:inactive}(Наименьшее из двух)",
        },
      },
      j_paperback_hole_in_one = {
        name = "Попадание в Лунку с Первого Удара",
        text = {
          "Если первая {C:chips}рука{} в раунде очистила",
          "{C:attention}блайнд{}, удвойте {C:attention}цену продажи{} всех {C:attention}карт",
          "{C:inactive}(Максимум {C:money}$#1#{C:inactive} за раунд)",
          "Когда эта карта продана, установите {C:attention}цену",
          "{C:attention}продажи{} всех {C:attention}карт{} на {C:money}$0"
        },
      },
      j_paperback_mismatched_sock = {
        name = "Непарный Носок",
        text = {
          "Этот Джокер получает {C:mult}+#1#{} Множитель",
          "если сыгранная рука не содержит {C:attention}пар{}",
          "{C:inactive}(Текущий {C:mult}+#2# {C:inactive}Множитель)",
        },
      },
      j_paperback_quick_fix = {
        name = "Быстрая Починка",
        text = {
          "{C:attention}+#1#{} размер руки",
          "{C:green}#2# к #3#{} шанс, что эта",
          "карта будет уничтожена",
          "в конце раунда",
        },
      },
      j_paperback_skydiver = {
        name = "Парашютист",
        text = {
          "{C:white,X:mult}X#1#{} Множитель, если все {C:attention}полученные карты{} меньше",
          "или равны {C:attention}карте самого низкого ранга{},",
          "полученной в этом раунде",
          "{C:inactive}(Обновляется в конце сыгранной руки{C:inactive})",
          "{C:inactive}(В настоящее время: {C:attention}#2#{C:inactive})",
        },
      },
      j_paperback_blue_bonnets = {
        name = "Люпины",
        text = {
          "{C:clubs}Трефы{} дают {X:mult,C:white}X#1#{} Множитель при получении.",
          "Увеличивается на {X:mult,C:white}X#2#{} Множитель за каждую",
          "последовательно полученную {C:clubs}Трефу{}",
          "{C:inactive}(Сбрасывается после каждой сыгранной руки)",
        },
      },
      j_paperback_great_wave = {
        name = "Большая Волна",
        text = {
          "Повторно активируйте {C:attention}самую левую{} сыгранную",
          "карту, использованную для получения очков, {C:attention}один раз{}",
          "за каждую оставшуюся {C:chips}руку{}",
        },
      },
      j_paperback_caramel_apple = {
        name = "Карамельное Яблоко",
        text = {
          "Полученные {C:clubs}Трефы{} дают {C:mult}+#1#{} Множитель",
          "{C:green}#2# к #3#{} шанс, что эта карта будет",
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
      j_paperback_pride_flag = {
        name = "Флаг Гордости",
        text = {
          "Получает {C:mult}+#1#{} Множитель, если полученная рука",
          "содержит {C:attention}три{} уникальные масти",
          "{C:inactive}(Текущий {C:mult}+#2#{} {C:inactive}Множитель)",
        },
      },
      j_paperback_sacrificial_lamb = {
        name = "Жертвенный Ягнёнок",
        text = {
          "Получает {C:mult}+#1#{} Множитель за",
          "каждую карту или Джокера {C:attention}уничтоженного",
          "{C:inactive}(Текущий {C:mult}+#2# {C:inactive}Множитель)",
        },
      },
      j_paperback_autumn_leaves = {
        name = "Осенние Листья",
        text = {
          "{C:diamonds}Бубны{} дают {X:mult,C:white}X#1#{} Множитель при получении.",
          "Увеличивается на {X:mult,C:white}X#2#{} Множитель за каждую",
          "последовательно полученную {C:diamonds}Бубну{}",
          "{C:inactive}(Сбрасывается после каждой сыгранной руки)",
        },
      },
      j_paperback_wild_prize = {
        name = "[[ДИКИЙ ПРИЗ!1!]]",
        text = {
          "{C:attention}Дикие Карты{} имеют {C:green}#1# к #2#{} шанс",
          "быть {C:attention}повторно активированными{} и {C:green}#1# к #3#{} шанс",
          "заработать от {C:money}$#4#{} до {C:money}$#5#{} при получении",
        },
      },
      j_paperback_wish_you_were_here = {
        name = "Жаль, что Тебя Здесь Нет",
        text = {
          "Даёт {C:mult}Множитель{}, равный {C:mult}#1#X{} от",
          "{C:attention}цены продажи{} этой карты.",
          "Получает {C:money}$#2#{} от {C:attention}цены продажи{} в",
          "конце раунда",
          "{C:inactive}(Текущий {C:mult}+#3# {C:inactive}Множитель){}",
        },
      },
      j_paperback_calling_card = {
        name = "Визитная Карточка",
        text = {
          "Этот Джокер получает {X:red,C:white}X#1#{} Множитель",
          "всякий раз, когда вы побеждаете {C:attention}Босс Блайнд{}",
          "или активируете его {C:attention}способность{}",
          "{C:inactive}(Текущий {}{X:red,C:white}X#2#{}{C:inactive} Множитель){}",
        },
      },
      j_paperback_subterfuge = {
        name = "Уловка",
        text = {
          "Уничтожает {C:attention}первую сыгранную руку{} каждый раунд",
          "Получает {X:mult,C:white}X#1#{} Множитель за каждую карту ниже {C:attention}#2#{}",
          "{C:inactive}(Текущий {X:mult,C:white}X#3#{C:inactive} Множитель)",
        },
      },
      j_paperback_triple_moon_goddess = {
        name = "Тройная Лунная Богиня",
        text = {
          "Если сыгранная рука содержит {C:attention}Тройку{},",
          "{C:green}#1# к #2#{} шанс создать случайную карту {C:planet}Планеты{} и",
          "{C:green}#3# к #4#{} шанс создать случайную карту {C:purple}Таро{}",
        },
      },
      j_paperback_derecho = {
        name = "Деречо",
        text = {
          "Получает {X:mult,C:white}X#1#{} Множитель, если {C:attention}полученная рука",
          "содержит только {C:spades}тёмные масти",
          "{C:inactive}(Текущий {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_jestrica = {
        name = "Джестрика",
        text = {
          "{C:mult}+#1#{} Множитель, когда получена {C:attention}8{}",
          "Сбрасывается, если в этом раунде не было получено {C:attention}8{}",
          "{C:inactive}(Текущий {C:mult}+#2#{C:inactive} Множитель)"
        },
      },
      j_paperback_grand_strategy = {
        name = "Гранд Стратегия",
        text = {
          "Этот Джокер даёт {X:mult,C:white}X#1#{} Множитель, если",
          "{C:attention}#2#{} уникальных {C:attention}улучшений{}, {C:attention}изданий{},",
          "или {C:attention}печатей{} есть в вашей полной колоде",
          "{C:inactive}(Текущий {C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_solar_system = {
        name = "Солнечная Система",
        text = {
          "Даёт {X:mult,C:white}X#1#{} Множитель за",
          "каждый {C:attention}уровень{}, который разделяют все 9 базовых",
          "{C:planet}Планет{}",
          "{C:inactive}(Текущий {X:mult,C:white}X#2#{} {C:inactive}Множитель)",
        },
      },
      j_paperback_reference_card = {
        name = "Карта-Памятка",
        text = {
          "Получает {X:mult,C:white}X#1#{} Множитель за каждый раз, когда {C:attention}все{} 9",
          "{C:attention}базовых покерных рук{} были сыграны",
          "{C:inactive}(Текущий {X:mult,C:white}X#2#{} {C:inactive}Множитель)",
        },
      },
      j_paperback_dreamsicle = {
        name = "Апельсиновый Лёд",
        text = {
          "Полученные {C:diamonds}Бубны{} дают {C:mult}+#1#{} Множитель",
          "{C:green}#2# к #3#{} шанс, что эта карта будет",
          "съедена в конце раунда",
        },
      },
      j_paperback_jimbo_adventure = {
        name = "Приключение Джимбо",
        text = {
          "Пропуск {C:attention}блайнда{} создаёт",
          "случайную {C:attention}Метку{}",
        },
      },
      j_paperback_union_card = {
        name = "Профсоюзный Билет",
        text = {
          "{C:attention}Цена продажи{} всех {C:attention}карт{} заблокирована",
          "на {C:money}$0{}, пока эта карта не будет продана",
          "Даёт {X:mult,C:white}X{} Множитель, равный",
          "количеству полученных {C:paperback_light_suit}светлых мастей{}",
          "в сыгранной руке",
        },
      },
      j_paperback_cherry_blossoms = {
        name = "Цветущая Вишня",
        text = {
          "{C:hearts}Черви{} дают {X:mult,C:white}X#1#{} Множитель при получении.",
          "Увеличивается на {X:mult,C:white}X#2#{} Множитель за каждую",
          "последовательно полученную {C:hearts}Черву{}",
          "{C:inactive}(Сбрасывается после каждой сыгранной руки)",
        },
      },
      j_paperback_paranoia = {
        name = "Паранойя",
        text = {
          "После получения руки,",
          "уничтожает все сыгранные {C:paperback_dark_suit}тёмные масти{} ",
          "и все {C:paperback_light_suit}светлые масти{}, находящиеся в руке",
        },
      },
      j_paperback_unholy_alliance = {
        name = "Нечестивый Альянс",
        text = {
          "Этот Джокер получает {X:mult,C:white}X#1#{} Множитель",
          "когда карта или джокер {C:attention}уничтожены{}",
          "{C:inactive}(Текущий {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_summoning_circle = {
        name = "Круг Призыва",
        text = {
          "Если сыгранная рука содержит",
          "{C:attention}Пять{}, создаёт копию",
          "{C:attention}случайного расходника",
          "{C:inactive}(Должно быть место)",
        },
      },
      j_paperback_pointy_stick = {
        name = "Острая Палка",
        text = {
          "Даёт {X:mult,C:white}X#1#{} Множитель за каждого",
          "другого {C:attention}\"Стика\"{} Джокера, который у вас есть...",
          "{C:inactive}(Текущий {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_prince_of_darkness = {
        name = "Принц Тьмы",
        text = {
          "Если полученная рука содержит {C:hearts}Черву{}",
          "и {C:attention}#1#{} уникальные масти, этот Джокер даёт",
          "{X:mult,C:white}X#2#{} Множитель для следующих {C:chips}#3#{} рук",
          "{C:inactive}(Текущие следующие {C:chips}#4#{C:inactive} руки)",
        },
      },
      j_paperback_popsicle_stick = {
        name = "Палочка от Эскимо",
        text = {
          "Даёт {X:mult,C:white}X#1#{} Множитель за каждого",
          "другого {C:attention}\"Стика\"{} Джокера, который у вас есть...",
          "{C:inactive}(Текущий {X:mult,C:white}X#2#{C:inactive} Множитель)",
        },
      },
      j_paperback_let_it_happen = {
        name = "Пусть Случится",
        text = {
          "Если рука не была сыграна в этом Анте,",
          "балансирует {C:mult}Множитель{} и {C:chips}Фишки{}",
          "{C:inactive}(Сыгранные руки:{C:attention}#1#{C:inactive})",
        },
      },
      j_paperback_evergreens = {
        name = "Вечнозелёные",
        text = {
          "{C:spades}Пики{} дают {X:mult,C:white}X#1#{} Множитель при получении.",
          "Увеличивается на {X:mult,C:white}X#2#{} Множитель за каждую",
          "последовательно полученную {C:spades}Пику{}",
          "{C:inactive}(Сбрасывается после каждой сыгранной руки)",
        },
      },
      j_paperback_cakepop = {
        name = "Кейкпоп",
        text = {
          "Полученные {C:hearts}Черви{} дают {C:mult}+#1#{} Множитель",
          "{C:green}#2# к #3#{} шанс, что эта карта будет",
          "съедена в конце раунда",
        },
      },
      j_paperback_black_rainbows = {
        name = "Чёрные Радуги",
        text = {
          "Полученные {C:spades}Пики{} и {C:clubs}Трефы{}",
          "имеют {C:green}#1# к #2#{} шанс",
          "стать {C:dark_edition}Полихромными"
        }
      },
      j_paperback_meeple = {
        name = "Мипл",
        text = {
          "Полученные {C:attention}карты с лицами{} имеют",
          "{C:green}#1# к #2#{} шанс",
          "дать {C:mult}+#3#{} Сброс(ов)"
        }
      },
      j_paperback_apple = {
        name = "Яблоко",
        text = {
          "Полученные {C:hearts}Черви{} имеют",
          "{C:green}#1# к #2#{} шанс дать",
          "{C:dark_edition}Отрицательный {C:attention}Расходник",
          "{S:1.1,C:red,E:2}самоуничтожается",
        }
      },
    },
    Other = {
      paperback_energized = {
        name = "Энергичный",
        text = {
          "Не может быть скопирован",
          "{C:attention}Базовой Энергией Джокера{}"
        }
      },
      paperback_light_suits = {
        name = "Светлые Масти",
        text = {
          "{C:diamonds}Бубны{}, {C:hearts}Черви{}"
        }
      },
      paperback_dark_suits = {
        name = "Тёмные Масти",
        text = {
          "{C:spades}Пики{}, {C:clubs}Трефы{}"
        }
      }
    }
  },
  misc = {
    dictionary = {
      paperback_polychrome_ex = "Полихром!",
      paperback_destroyed_ex = "Уничтожено!",
      paperback_doubled_ex = "Удвоено!",
      paperback_too_late_ex = "СЛИШКОМ ПОЗДНО!",
      paperback_broken_ex = "Сломано!",
      paperback_none = "Нет",
      paperback_downgrade_ex = "Понижение!",
      paperback_copy_ex = "Копия!",
      paperback_consumed_ex = "Поглощено!",
      paperback_too_hot_ex = "Слишком Горячо!",
      paperback_inactive = "Неактивно",
      paperback_supplies_ex = "Припасы!",

      paperback_ui_requires_restart = "Требуется Перезапуск",
      paperback_ui_enable_jokers = "Включить Джокеров",
      paperback_ui_developers = "Разработчики",
      paperback_ui_artists = "Художники",
      paperback_ui_localization = "Локализация"
    },
    v_dictionary = {
      paperback_a_discards_ex = "+#1# Сбросов!",
      paperback_a_xchips = "X#1# Фишек",
      paperback_a_xchips_minus = "-X#1# Фишек",
      paperback_a_hands_minus = "-#1# Рук",
      paperback_prince_of_darkness = "+#1# Множитель, +#2# Фишек",
      paperback_a_completion = "#1#/#2#",
      paperback_a_round_minus = "-#1# Раунд"
    }
  }
}
