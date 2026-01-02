-------------------------------------
-- Slacker's Tweak Suite: ptBR.lua --
-------------------------------------
-- Portuguese (Brazil) localisation
-- Translator(s):

-- Initialisation
if GetLocale() ~= "ptBR" then return end
local appName, app = ...
local L = app.locales

-- General
-- L.REQUIRES_RELOAD =						"|cffFF0000" .. REQUIRES_RELOAD .. ".|r Use |cffFFFFFF/reload|r or relog."	-- "Requires Reload"

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

-- L.GENERAL =								GENERAL	-- "General"
-- L.SETTINGS_CURSORGUIDE_TITLE =			"Cursor Guide"
-- L.SETTINGS_CURSORGUIDE_TOOLTIP =		"Show a guide around the cursor to help you keep track of it."
-- L.SETTINGS_CURSORGUIDE_COMBAT_TITLE =	"Only In Combat"
-- L.SETTINGS_CURSORGUIDE_COMBAT_TOOLTIP =	"Only show the cursor guide in combat."
-- L.SETTINGS_COMPARE_TITLE =				"Disable Always Compare"
-- L.SETTINGS_COMPARE_TOOLTIP =			"Disable the always compare items behavior added in 11.2.7."
-- L.SETTINGS_SPLITBAG_TITLE =				"Split Reagent Bag Count"
-- L.SETTINGS_SPLITBAG_TOOLTIP =			"Shows the free slots of your regular bags and your reagent bag separately on top of the backpack icon."
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
-- L.SETTINGS_QUEUESOUND_TITLE =			"Play Queue Sound"
-- L.SETTINGS_QUEUESOUND_TOOLTIP =			"Play the queue sound on the Master channel when any queue pops, including battlegrounds and pet battles."
-- L.SETTINGS_SHOWTOKENPRICE_TITLE =		"Show WoW Token Price"
-- L.SETTINGS_SHOWTOKENPRICE_TOOLTIP =		"Show the current WoW Token price on the WoW Token item tooltip."
-- L.SETTINGS_TOKYODRIFT_TITLE = 			"Tokyo Drift"
-- L.SETTINGS_TOKYODRIFT_TOOLTIP = 		"Vroom vroom."
-- L.ADDONS = 								ADDONS
-- L.SETTINGS_HANDYNOTESFIX_TITLE =		"Disable HandyNotes Alt " .. app.IconRMB
-- L.SETTINGS_HANDYNOTESFIX_TOOLTIP =		"Let " .. app.NameShort .. " disable HandyNotes' keybind on the map, re-enabling it for TomTom waypoints instead.\n\n" .. L.REQUIRES_RELOAD
-- L.SETTINGS_ORIBOSEXCHANGEFIX_TITLE =	"Fix Oribos Exchange Tooltip"
-- L.SETTINGS_ORIBOSEXCHANGEFIX_TOOLTIP =	"Let " .. app.NameShort .. " simplify and fix the tooltip provided by the Oribos Exchange addon:\n" ..
-- 										"- Round to the nearest gold.\n" ..
-- 										"- Fix recipe prices.\n" ..
-- 										"- Fix profession window prices.\n" ..
-- 										"- Show battle pet prices inside the existing tooltip."
-- L.HOLIDAYS =							CALENDAR_FILTER_HOLIDAYS
-- L.SETTINGS_HALLOWSIT_TITLE =			"[Hallow's End] No Trick"
-- L.SETTINGS_HALLOWSIT_TOOLTIP =			"Sit down before completing a Candy Bucket quest, preventing getting tricked and pacified."
