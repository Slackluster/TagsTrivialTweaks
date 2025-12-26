-------------------------------------
-- Slacker's Tweak Suite: esES.lua --
-------------------------------------
-- Spanish (Spain) localisation
-- Translator(s):

-- Initialisation
if GetLocale() ~= "esES" then return end
local appName, app = ...
local L = app.locales

-- General
-- L.REQUIRES_RELOAD =						"|cffFF0000" .. REQUIRES_RELOAD .. ".|r Use |cffFFFFFF/reload|r or relog."	-- "Requires Reload"

-- Version comms
-- L.NEW_VERSION_AVAILABLE =				"There is a newer version of " .. app.NameLong .. " available:"

-- Tooltip
-- L.REGION =								"Region"	-- Preceded by an abbreviated region name such as "EU" or "US"

-- Settings
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

-- L.SETTINGS_CURSORGUIDE_TITLE =			"Cursor Guide"
-- L.SETTINGS_CURSORGUIDE_TOOLTIP =		"Show a guide around the cursor to help you keep track of it."
-- L.SETTINGS_CURSORGUIDE_COMBAT_TITLE =	"Only In Combat"
-- L.SETTINGS_CURSORGUIDE_COMBAT_TOOLTIP =	"Only show the cursor guide in combat."
-- L.SETTINGS_COMPARE_TITLE =				"Disable Always Compare"
-- L.SETTINGS_COMPARE_TOOLTIP =			"Disable the always compare items behavior added in 11.2.7."
-- L.SETTINGS_SPLITBAG_TITLE =				"Split Reagent Bag Count"
-- L.SETTINGS_SPLITBAG_TOOLTIP =			"Shows the free slots of your regular bags and your reagent bag separately on top of the backpack icon."
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
