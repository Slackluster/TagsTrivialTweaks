------------------------------------
-- Tag's Trivial Tweaks: zhCN.lua --
------------------------------------
-- Chinese (Simplified, PRC) localisation
-- Translator(s): cikichen

-- Initialisation
if GetLocale() ~= "zhCN" then return end
local appName, app = ...
local L = app.locales

-- General
-- L.REQUIRES_RELOAD =						"|cffFF0000" .. REQUIRES_RELOAD .. ".|r Use |cffFFFFFF/reload|r or relog."	-- "Requires Reload"

-- Version comms
-- L.NEW_VERSION_AVAILABLE =				"There is a newer version of " .. app.NameLong .. " available:"

-- Edit Mode
-- L.SCALE = 								"Scale"
-- L.VISIBLE_OUT_COMBAT = 					"Visible Out of Combat"

-- Tooltip
-- L.REGION =								"Region"	-- Preceded by an abbreviated region name such as "EU" or "US"

-- Remix: Artifact Button
-- L.ARTIFACT_FRAME =						"[TTT] Artifact Ability"
-- L.STYLE =								"Style"
-- L.STORM =								RELIC_SLOT_TYPE_WIND
-- L.AIR =									"Air"
-- L.FIRE =								DAMAGE_SCHOOL3
-- L.GENERIC =								"Generic"
-- L.WATER =								RELIC_SLOT_TYPE_WATER
-- L.GARRISON =							GARRISON_LOCATION_TOOLTIP

-- Settings
L.SETTINGS_SPLITBAG_TITLE =				"拆分材料背包计数"
L.SETTINGS_SPLITBAG_TOOLTIP =			"在背包图标上方分别显示普通背包和材料背包的空位。"
L.SETTINGS_QUEUESOUND_TITLE =			"播放队列音效"
L.SETTINGS_QUEUESOUND_TOOLTIP =			"当任何队列就绪时（包括战场和宠物对战）播放Deadly Boss Mods风格音效。"
L.SETTINGS_HANDYNOTESFIX_TITLE =		"禁用HandyNotes右键"
L.SETTINGS_HANDYNOTESFIX_TOOLTIP =		"禁用HandyNotes在地图上的快捷键绑定，恢复TomTom的右键设标记功能。\n\n" .. L.REQUIRES_RELOAD
L.SETTINGS_ORIBOSEXCHANGEFIX_TITLE =	"修复Oribos Exchange提示"
L.SETTINGS_ORIBOSEXCHANGEFIX_TOOLTIP =	"简化并修复Oribos Exchange插件的提示：\n" ..
										"- 四舍五入到整数金币\n" ..
										"- 修正配方价格\n" ..
										"- 修正专业窗口价格\n" ..
										"- 在现有提示中显示战斗宠物价格"
-- L.SETTINGS_SHOWTOKENPRICE_TITLE =		"Show WoW Token Price"
-- L.SETTINGS_SHOWTOKENPRICE_TOOLTIP =		"Show the current WoW Token price on the WoW Token item tooltip."
-- L.SETTINGS_TOKYODRIFT_TITLE = 			"Tokyo Drift"
-- L.SETTINGS_TOKYODRIFT_TOOLTIP = 		"Vroom vroom."
-- L.HOLIDAYS =							CALENDAR_FILTER_HOLIDAYS
-- L.SETTINGS_HALLOWSIT_TITLE =			"[Hallow's End] No Trick"
-- L.SETTINGS_HALLOWSIT_TOOLTIP =			"Sit down before completing a Candy Bucket quest, preventing getting tricked and pacified."
-- L.REMIX = 								"Remix"
-- L.SETTINGS_ARTIFACTBUTTON_TITLE =		"Artifact Button"
-- L.SETTINGS_ARTIFACTBUTTON_TOOLTIP =		"Show an extra action button for your artifact ability. Movable through Edit Mode."
