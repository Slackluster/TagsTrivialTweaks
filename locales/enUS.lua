------------------------------------
-- Tag's Trivial Tweaks: enUS.lua --
------------------------------------
-- English (United States) localisation
-- Translator(s): N/A

-- Initialisation
-- if GetLocale() ~= "enUS" then return end
local appName, app = ...
local L = app.locales

-- General
L.REQUIRES_RELOAD =						"|cffFF0000" .. REQUIRES_RELOAD .. ".|r Use |cffFFFFFF/reload|r or relog."	-- "Requires Reload"

-- Version comms
L.NEW_VERSION_AVAILABLE =				"There is a newer version of " .. app.NameLong .. " available:"

-- Edit Mode
L.SCALE = 								"Scale"
L.VISIBLE_OUT_COMBAT = 					"Visible Out of Combat"

-- Tooltip
L.REGION =								"Region"	-- Preceded by an abbreviated region name such as "EU" or "US"

-- Remix: Artifact Button
L.ARTIFACT_FRAME =						"[TTT] Artifact Ability"
L.STYLE =								"Style"
L.STORM =								RELIC_SLOT_TYPE_WIND
L.AIR =									"Air"
L.FIRE =								DAMAGE_SCHOOL3
L.GENERIC =								"Generic"
L.WATER =								RELIC_SLOT_TYPE_WATER
L.GARRISON =							GARRISON_LOCATION_TOOLTIP

-- Settings
L.SETTINGS_SPLITBAG_TITLE =				"Split Reagent Bag Count"
L.SETTINGS_SPLITBAG_TOOLTIP =			"Shows the free slots of your regular bags and your reagent bag separately on top of the backpack icon."
L.SETTINGS_QUEUESOUND_TITLE =			"Play Queue Sound"
L.SETTINGS_QUEUESOUND_TOOLTIP =			"Play the Deadly Boss Mods style queue sound when any queue pops, including battlegrounds and pet battles."
L.SETTINGS_HANDYNOTESFIX_TITLE =		"Disable HandyNotes Alt " .. app.IconRMB
L.SETTINGS_HANDYNOTESFIX_TOOLTIP =		"Let " .. app.NameShort .. " disable HandyNotes' keybind on the map, re-enabling it for TomTom waypoints instead.\n\n" .. L.REQUIRES_RELOAD
L.SETTINGS_ORIBOSEXCHANGEFIX_TITLE =	"Fix Oribos Exchange Tooltip"
L.SETTINGS_ORIBOSEXCHANGEFIX_TOOLTIP =	"Let " .. app.NameShort .. " simplify and fix the tooltip provided by the Oribos Exchange addon:\n" ..
										"- Round to the nearest gold.\n" ..
										"- Fix recipe prices.\n" ..
										"- Fix profession window prices.\n" ..
										"- Show battle pet prices inside the existing tooltip."
L.SETTINGS_SHOWTOKENPRICE_TITLE =		"Show WoW Token Price"
L.SETTINGS_SHOWTOKENPRICE_TOOLTIP =		"Show the current WoW Token price on the WoW Token item tooltip."
L.SETTINGS_TOKYODRIFT_TITLE = 			"Tokyo Drift"
L.SETTINGS_TOKYODRIFT_TOOLTIP = 		"Vroom vroom."
L.HOLIDAYS =							CALENDAR_FILTER_HOLIDAYS
L.SETTINGS_HALLOWSIT_TITLE =			"[Hallow's End] No Trick"
L.SETTINGS_HALLOWSIT_TOOLTIP =			"Sit down before completing a Candy Bucket quest, preventing getting tricked and pacified."
L.REMIX = 								"Remix"
L.SETTINGS_ARTIFACTBUTTON_TITLE =		"[Legion] Artifact Button"
L.SETTINGS_ARTIFACTBUTTON_TOOLTIP =		"Show an extra action button for your artifact ability. Movable through Edit Mode."
