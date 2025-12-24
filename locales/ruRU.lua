------------------------------------
-- Tag's Trivial Tweaks: ruRU.lua --
------------------------------------
-- Russian (Russia) localisation
-- Translator(s): ZamestoTV

-- Initialisation
if GetLocale() ~= "ruRU" then return end
local appName, app = ...
local L = app.locales

-- General
L.REQUIRES_RELOAD =						"|cffFF0000" .. REQUIRES_RELOAD .. ".|r Используйте |cffFFFFFF/reload|r или перезайдите."	-- "Requires Reload"

-- Version comms
L.NEW_VERSION_AVAILABLE =				"Доступна более новая версия " .. app.NameLong .. " аддона:"

-- Edit Mode
L.SCALE = 								"Масштаб"
L.VISIBLE_OUT_COMBAT = 					"Видимость вне боя"

-- Tooltip
L.REGION =								"Регион"	-- Preceded by an abbreviated region name such as "EU" or "US"

-- Remix: Artifact Button
L.ARTIFACT_FRAME =						"[TTT] Способность артефакта"
L.STYLE =								"Стиль"
L.STORM =								RELIC_SLOT_TYPE_WIND
L.AIR =									"Воздух"
L.FIRE =								DAMAGE_SCHOOL3
L.GENERIC =								"Общий"
L.WATER =								RELIC_SLOT_TYPE_WATER
L.GARRISON =							GARRISON_LOCATION_TOOLTIP

-- Settings
L.SETTINGS_SUPPORT_TEXTLONG =			"Разработка этого аддона требует значительного времени и усилий.\nПожалуйста, рассмотрите возможность финансовой поддержки разработчика."
L.SETTINGS_SUPPORT_TEXT =				"Поддержать"
L.SETTINGS_SUPPORT_BUTTON =				"Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_SUPPORT_DESC =				"Спасибо!"
L.SETTINGS_HELP_TEXT =					"Обратная связь и помощь"
L.SETTINGS_HELP_BUTTON =				"Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_HELP_DESC =					"Присоединиться к серверу Discord."
L.SETTINGS_ISSUES_TEXT =				"Отслеживание ошибок"
L.SETTINGS_ISSUES_BUTTON =				"GitHub" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_ISSUES_DESC =				"Просмотреть трекер ошибок на GitHub."
L.SETTINGS_URL_COPY =					"Ctrl+C — скопировать:"
L.SETTINGS_URL_COPIED =					"Ссылка скопирована в буфер обмена"

-- L.SETTINGS_CURSORGUIDE_TITLE =			"Cursor Guide"
-- L.SETTINGS_CURSORGUIDE_TOOLTIP =		"Show a guide around the cursor to help you keep track of it."
-- L.SETTINGS_CURSORGUIDE_COMBAT_TITLE =	"Only In Combat"
-- L.SETTINGS_CURSORGUIDE_COMBAT_TOOLTIP =	"Only show the cursor guide in combat."
L.SETTINGS_COMPARE_TITLE =				"Отключить постоянное сравнение"
L.SETTINGS_COMPARE_TOOLTIP =			"Отключить поведение постоянного сравнения предметов, добавленное в патче 11.2.7."
L.SETTINGS_SPLITBAG_TITLE =				"Разделение количества мешков с реагентами"
L.SETTINGS_SPLITBAG_TOOLTIP =			"Показывает свободные слоты ваших обычных сумок и сумки с реагентами отдельно над значком рюкзака."
L.SETTINGS_QUEUESOUND_TITLE =			"Воспроизвести звук очереди"
L.SETTINGS_QUEUESOUND_TOOLTIP =			"Воспроизводить звук готовности очереди на главном канале, когда срабатывает любая очередь, включая поля боя и битвы питомцев."
L.SETTINGS_SHOWTOKENPRICE_TITLE =		"Показать цену жетона WoW"
L.SETTINGS_SHOWTOKENPRICE_TOOLTIP =		"Отображать текущую цену жетона WoW в подсказке к предмету Жетон WoW."
L.SETTINGS_TOKYODRIFT_TITLE = 			"Токийский Дрифт"
L.SETTINGS_TOKYODRIFT_TOOLTIP = 		"Врум врум."
-- L.ADDONS = 								ADDONS
L.SETTINGS_HANDYNOTESFIX_TITLE =		"Отключить HandyNotes Alt " .. app.IconRMB
L.SETTINGS_HANDYNOTESFIX_TOOLTIP =		"Позвольте " .. app.NameShort .. " отключить привязку клавиш HandyNotes на карте, вместо этого включив ее для точек маршрута TomTom.\n\n" .. L.REQUIRES_RELOAD
L.SETTINGS_ORIBOSEXCHANGEFIX_TITLE =	"Исправлена подсказка Oribos Exchange"
L.SETTINGS_ORIBOSEXCHANGEFIX_TOOLTIP =	"Позвольте " .. app.NameShort .. " упростить и исправить подсказку, предоставляемую аддоном Oribos Exchange:\n" ..
										"- Округлить до золотого.\n" ..
										"- Исправление цен на рецепты.\n" ..
										"- Исправление цен на окне профессии.\n" ..
										"- Показывать цены на питомцев внутри существующей подсказки."
L.HOLIDAYS =							CALENDAR_FILTER_HOLIDAYS
L.SETTINGS_HALLOWSIT_TITLE =			"[Тыквовин] Без уловок"
L.SETTINGS_HALLOWSIT_TOOLTIP =			"Сядьте, прежде чем выполнять задание «Кулек конфет», чтобы не дать себя обмануть и успокоить."
L.REMIX = 								"Remix"
L.SETTINGS_ARTIFACTBUTTON_TITLE =		"Кнопка артефакта"
L.SETTINGS_ARTIFACTBUTTON_TOOLTIP =		"Показывать дополнительную кнопку действия для способности вашего артефакта. Перемещаема через режим редактирования."
