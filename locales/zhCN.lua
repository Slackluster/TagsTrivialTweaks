-------------------------------------
-- Slacker's Tweak Suite: zhCN.lua --
-------------------------------------
-- Chinese (Simplified, PRC) localisation
-- Translator(s): cikichen

-- Initialisation
if GetLocale() ~= "zhCN" then return end
local appName, app = ...
local L = app.locales

-- General
-- L.REQUIRES_RELOAD =						"|cffFF0000" .. REQUIRES_RELOAD .. ".|r Use |cffFFFFFF/reload|r or relog."	-- "Requires Reload"

-- Slash commands
-- L.INVALID_COMMAND =						"Invalid command."

-- Version comms
-- L.NEW_VERSION_AVAILABLE =				"There is a newer version of " .. app.NameLong .. " available:"

-- UI
-- L.REGION =								"Region"	-- Preceded by an abbreviated region name such as "EU" or "US"
-- L.INSTANT_BUTTON =						"Get it now!"
-- L.INSTANT_TOOLTIP =						"Hold Shift to instantly receive your item and skip the 5 second timer."

-- Settings
-- L.SETTINGS_VERSION =					GAME_VERSION_LABEL .. ":"	-- "Version"
-- L.SETTINGS_SUPPORT_TEXTLONG =			"Developing this addon takes a significant amount of time and effort.\nPlease consider financially supporting the developer."
-- L.SETTINGS_SUPPORT_TEXT =				"Support"
-- L.SETTINGS_SUPPORT_BUTTON =				"Buy Me a Coffee"	-- Brand name, if there isn't a localised version, keep it the way it is
-- L.SETTINGS_SUPPORT_DESC =				"Thank you!"
-- L.SETTINGS_HELP_TEXT =					"Feedback & Help"
-- L.SETTINGS_HELP_BUTTON =				"Discord"	-- Brand name, if there isn't a localised version, keep it the way it is
-- L.SETTINGS_HELP_DESC =					"Join the Discord server."
-- L.SETTINGS_ISSUES_TEXT =				"Issue Tracker"
-- L.SETTINGS_ISSUES_BUTTON =				"GitHub"	-- Brand name, if there isn't a localised version, keep it the way it is
-- L.SETTINGS_ISSUES_DESC =				"View the issue tracker on GitHub."
-- L.SETTINGS_URL_COPY =					"Ctrl+C to copy:"
-- L.SETTINGS_URL_COPIED =					"Link copied to clipboard"

-- L.SETTINGS_KEYSLASH_TITLE =				SETTINGS_KEYBINDINGS_LABEL .. " & Slash Commands"	-- "Keybindings"
L.SETTINGS_SLASH_SETTINGS =				"打开设置"

-- L.GENERAL =								GENERAL	-- "General"
-- L.SETTINGS_CURSORGUIDE_TITLE =			"Cursor Guide"
-- L.SETTINGS_CURSORGUIDE_TOOLTIP =		"Show a guide around the cursor to help you keep track of it."
-- L.SETTINGS_CURSORGUIDE_COMBAT_TITLE =	"Only In Combat"
-- L.SETTINGS_CURSORGUIDE_COMBAT_TOOLTIP =	"Only show the cursor guide in combat."
-- L.SETTINGS_COMPARE_TITLE =				"Disable Always Compare"
-- L.SETTINGS_COMPARE_TOOLTIP =			"Disable the always compare items behavior added in 11.2.7."
L.SETTINGS_SPLITBAG_TITLE =				"拆分材料背包计数"
L.SETTINGS_SPLITBAG_TOOLTIP =			"在背包图标上方分别显示普通背包和材料背包的空位。"
-- L.SETTINGS_CATALYST =					"Instant Catalyst"
-- L.SETTINGS_CATALYST_DESC =				"Hold Shift to instantly catalyze an item, skipping the 5 second timer."
-- L.SETTINGS_VAULT =						"Instant Great Vault"
-- L.SETTINGS_VAULT_DESC =					"Hold Shift to instantly receive your reward from the Great Vault and skip the 5 second timer."
-- L.SETTINGS_INSTANT_TOOLTIP =			"Show tooltip"
-- L.SETTINGS_INSTANT_TOOLTIP_DESC =		"Show the tooltip explaining how this feature works. The button text still changes when this is disabled."
-- L.SETTINGS_VENDOR_ALL =					"Disable Vendor Filter"
-- L.SETTINGS_VENDOR_ALL_DESC =			"Automatically set all vendor filters to |cffFFFFFFAll|r to display items normally not shown to your class."
-- L.SETTINGS_HIDE_LOOT_ROLL_WINDOW =		"Hide loot roll window"
-- L.SETTINGS_HIDE_LOOT_ROLL_WINDOW_DESC =	"Hide the window that shows loot rolls and their results. You can show the window again with |cff00ccff/loot|r."
L.SETTINGS_QUEUESOUND_TITLE =			"播放队列音效"
-- L.SETTINGS_QUEUESOUND_TOOLTIP =			"Play the queue sound on the Master channel when any queue pops, including battlegrounds and pet battles."
-- L.SETTINGS_SHOWTOKENPRICE_TITLE =		"Show WoW Token Price"
-- L.SETTINGS_SHOWTOKENPRICE_TOOLTIP =		"Show the current WoW Token price on the WoW Token item tooltip."
-- L.SETTINGS_TOKYODRIFT_TITLE = 			"Tokyo Drift"
-- L.SETTINGS_TOKYODRIFT_TOOLTIP = 		"Vroom vroom."

-- L.ADDONS = 								ADDONS
L.SETTINGS_HANDYNOTESFIX_TITLE =		"禁用HandyNotes右键"
L.SETTINGS_HANDYNOTESFIX_TOOLTIP =		"禁用HandyNotes在地图上的快捷键绑定，恢复TomTom的右键设标记功能。\n\n" .. L.REQUIRES_RELOAD
L.SETTINGS_ORIBOSEXCHANGEFIX_TITLE =	"修复Oribos Exchange提示"
L.SETTINGS_ORIBOSEXCHANGEFIX_TOOLTIP =	"简化并修复Oribos Exchange插件的提示：\n" ..
										"- 四舍五入到整数金币\n" ..
										"- 修正配方价格\n" ..
										"- 修正专业窗口价格\n" ..
										"- 在现有提示中显示战斗宠物价格"

-- L.HOLIDAYS =							CALENDAR_FILTER_HOLIDAYS
-- L.SETTINGS_HALLOWSIT_TITLE =			"[Hallow's End] No Trick"
-- L.SETTINGS_HALLOWSIT_TOOLTIP =			"Sit down before completing a Candy Bucket quest, preventing getting tricked and pacified."
