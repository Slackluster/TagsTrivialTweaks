-------------------------------------
-- Slacker's Tweak Suite: ruRU.lua --
-------------------------------------
-- Russian (Russia) localisation
-- Translator(s): ZamestoTV

if GetLocale() ~= "ruRU" then return end
local appName, app = ...
local L = app.locales

-- General
L.REQUIRES_RELOAD =                      "|cffFF0000" .. REQUIRES_RELOAD .. ".|r Используйте |cffFFFFFF/reload|r или перезайдите." -- "Requires Reload"

-- Slash commands
L.INVALID_COMMAND =                      "Неверная команда."
L.DEBUG_ENABLED =                        "Режим отладки включен."
L.DEBUG_DISABLED =                       "Режим отладки выключен."

-- Version comms
L.NEW_VERSION_AVAILABLE =                "Доступна более новая версия " .. app.NameLong .. " аддона:"

-- UI
L.REGION =                               "%s Регион" -- %s becomes an abbreviated region name such as "EU" or "US"
L.INSTANT_BUTTON =                       "Получить сейчас!"
L.INSTANT_TOOLTIP =                      "Удерживайте Shift, чтобы мгновенно получить предмет, пропуская 5-секундный таймер."

-- Settings
L.SETTINGS_VERSION =                     GAME_VERSION_LABEL .. ":" -- "Version"
L.SETTINGS_SUPPORT_TEXTLONG =            "Разработка этого аддона требует значительного времени и усилий.\nПожалуйста, рассмотрите возможность финансовой поддержки разработчика."
L.SETTINGS_SUPPORT_TEXT =                "Поддержать"
L.SETTINGS_SUPPORT_BUTTON =              "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_SUPPORT_DESC =                "Спасибо!"
L.SETTINGS_HELP_TEXT =                   "Обратная связь и помощь"
L.SETTINGS_HELP_BUTTON =                 "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_HELP_DESC =                   "Присоединиться к серверу Discord."
L.SETTINGS_URL_COPY =                    "Ctrl+C — скопировать:"
L.SETTINGS_URL_COPIED =                  "Ссылка скопирована в буфер обмена"

L.SETTINGS_KEYSLASH_TITLE =              SETTINGS_KEYBINDINGS_LABEL .. " & Слэш-команды" -- "Keybindings"
L.SLASH_OPEN_SETTINGS =                  "Откройте настройки"

L.GENERAL =                              GENERAL -- "General"
L.SETTINGS_CURSORGUIDE_TITLE =           "Направляющая курсора"
L.SETTINGS_CURSORGUIDE_DESC =            "Чтобы вам было легче следить за курсором, отобразите вокруг него направляющую."
L.SETTINGS_CURSORGUIDE_COMBAT_TITLE =    "Только в бою"
L.SETTINGS_CURSORGUIDE_COMBAT_DESC =     "Отображайте курсор только в бою."
L.SETTINGS_SKIPCINEMATICS_TITLE =        "Пропуск просмотренных роликов"
L.SETTINGS_SKIPCINEMATICS_TITLE_DESC =   "Автоматически пропускать внутриигровые ролики, которые вы уже видели."

L.INVENTORY =                            INVENTORY_TOOLTIP -- "Inventory"
L.SETTINGS_COMPARE_TITLE =               "Отключить постоянное сравнение"
L.SETTINGS_COMPARE_DESC =                "Отключить поведение постоянного сравнения предметов, добавленное в патче 11.2.7."
L.SETTINGS_SPLITBAG_TITLE =              "Разделение количества мешков с реагентами"
L.SETTINGS_SPLITBAG_DESC =               "Показывает свободные слоты ваших обычных сумок и сумки с реагентами отдельно над значком рюкзака."

L.LOOT =                                 LOOT -- "Loot"
L.SETTINGS_CATALYST =                    "Мгновенная катализация"
L.SETTINGS_CATALYST_DESC =               "Удерживайте Shift, чтобы мгновенно катализировать предмет, пропуская 5-секундный таймер."
L.SETTINGS_VAULT =                       "Мгновенное Великое Хранилище"
L.SETTINGS_VAULT_DESC =                  "Удерживайте Shift, чтобы мгновенно получить награду из Великого Хранилища, пропуская 5-секундный таймер."
L.SETTINGS_INSTANT_TOOLTIP =             "Показывать подсказку"
L.SETTINGS_INSTANT_TOOLTIP_DESC =        "Показывать подсказку, объясняющую, как работает эта функция. Текст кнопки все равно меняется, если это отключено."
L.SETTINGS_VENDOR_ALL =                  "Отключить фильтр торговца"
L.SETTINGS_VENDOR_ALL_DESC =             "Автоматически устанавливать все фильтры торговца на |cffFFFFFFВсе|r, чтобы отображать предметы, обычно не показываемые для вашего класса."

L.SOUND =                                SOUND -- "Sound"
L.SETTINGS_HIDE_LOOT_ROLL_WINDOW =       "Скрыть окно бросков лута"
L.SETTINGS_HIDE_LOOT_ROLL_WINDOW_DESC =  "Скрыть окно, показывающее броски лута и их результаты. Вы можете снова показать окно с помощью |cff00ccff/loot|r."
L.SETTINGS_QUEUESOUND_TITLE =            "Воспроизвести звук очереди"
L.SETTINGS_QUEUESOUND_DESC =             "Воспроизводить звук готовности очереди на главном канале, когда срабатывает любая очередь, включая поля боя и битвы питомцев."
L.SETTINGS_READYCHECKSOUND_TITLE =       "Звук проверки готовности"
L.SETTINGS_READYCHECKSOUND_DESC =        "Воспроизводить звук проверки готовности на главном звуковом канале, когда она запускается."
L.SETTINGS_COUNTDOWNSOUND_TITLE =        "Звук отсчета времени"
L.SETTINGS_COUNTDOWNSOUND_DESC =         "Воспроизводить звук отсчета времени на главном звуковом канале, когда запускается таймер до пулла или любой другой отсчет."
L.SETTINGS_SHOWTOKENPRICE_TITLE =        "Показать цену жетона WoW"
L.SETTINGS_SHOWTOKENPRICE_DESC =         "Отображать текущую цену жетона WoW в подсказке к предмету Жетон WoW."

L.ADDONS =                               "Аддоны"
L.SETTINGS_HANDYNOTESFIX_TITLE =         "Отключить HandyNotes Alt " .. app.IconRMB
L.SETTINGS_HANDYNOTESFIX_DESC =          "Отключить привязку клавиш HandyNotes на карте, вместо этого включив ее для точек маршрута TomTom.\n\n" .. L.REQUIRES_RELOAD
L.SETTINGS_AHPRICETOOLTIP_TITLE =        "Подсказка с ценой аукциона"
L.SETTINGS_AHPRICETOOLTIP_DESC =         "Показывать самую свежую информацию о ценах из Auctionator, Oribos Exchange или TradeSkillMaster.\n" ..
                                          "Также округляет значения и исправляет отображение цен в окне профессий, рецептах и ценах на питомцев."

L.HOLIDAYS =                             CALENDAR_FILTER_HOLIDAYS -- "Holidays"
L.SETTINGS_HALLOWSIT_TITLE =             "[Тыквовин] Без уловок"
L.SETTINGS_HALLOWSIT_DESC =              "Сядьте, прежде чем выполнять задание «Кулек конфет», чтобы не дать себя обмануть и успокоить."
