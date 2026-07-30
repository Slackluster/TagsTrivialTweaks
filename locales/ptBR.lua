-------------------------------------
-- Slacker's Tweak Suite: ptBR.lua --
-------------------------------------
-- Portuguese (Brazil) localisation
-- Translator(s):

if GetLocale() ~= "ptBR" then return end
local appName, app = ...
local L = app.locales

-- General
-- L.REQUIRES_RELOAD =                      "|cffFF0000" .. REQUIRES_RELOAD .. ".|r Use |cffFFFFFF/reload|r or relog." -- "Requires Reload"

-- Slash commands
-- L.INVALID_COMMAND =                      "Invalid command."
-- L.DEBUG_ENABLED =                        "Debug mode enabled."
-- L.DEBUG_DISABLED =                       "Debug mode disabled."

-- Version comms
-- L.NEW_VERSION_AVAILABLE =                "There is a newer version of " .. app.NameLong .. " available:"

-- UI
-- L.REGION =                               "Region" -- Preceded by an abbreviated region name such as "EU" or "US"
-- L.INSTANT_BUTTON =                       "Get it now!"
-- L.INSTANT_TOOLTIP =                      "Hold Shift to instantly receive your item and skip the 5 second timer."

-- Settings
-- L.SETTINGS_VERSION =                     GAME_VERSION_LABEL .. ":" -- "Version"
-- L.SETTINGS_SUPPORT_TEXTLONG =            "Developing this addon takes a significant amount of time and effort.\nPlease consider financially supporting the developer."
-- L.SETTINGS_SUPPORT_TEXT =                "Support"
-- L.SETTINGS_SUPPORT_BUTTON =              "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
-- L.SETTINGS_SUPPORT_DESC =                "Thank you!"
-- L.SETTINGS_HELP_TEXT =                   "Feedback & Help"
-- L.SETTINGS_HELP_BUTTON =                 "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
-- L.SETTINGS_HELP_DESC =                   "Join the Discord server."
-- L.SETTINGS_URL_COPY =                    "Ctrl+C to copy:"
-- L.SETTINGS_URL_COPIED =                  "Link copied to clipboard"

-- L.SETTINGS_KEYSLASH_TITLE =              SETTINGS_KEYBINDINGS_LABEL .. " & Slash Commands" -- "Keybindings"
-- L.SLASH_OPEN_SETTINGS =                  "Open the settings"

-- L.GENERAL =                              GENERAL -- "General"
-- L.SETTINGS_CURSORGUIDE_TITLE =           "Cursor Guide"
-- L.SETTINGS_CURSORGUIDE_DESC =            "Show a guide around the cursor to help you keep track of it."
-- L.SETTINGS_CURSORGUIDE_COMBAT_TITLE =    "Only In Combat"
-- L.SETTINGS_CURSORGUIDE_COMBAT_DESC =     "Only show the cursor guide in combat."
-- L.SETTINGS_COMPARE_TITLE =               "Disable Always Compare"
-- L.SETTINGS_COMPARE_DESC =                "Disable the always compare items behavior added in 11.2.7."
-- L.SETTINGS_SPLITBAG_TITLE =              "Split Reagent Bag Count"
-- L.SETTINGS_SPLITBAG_DESC =               "Shows the free slots of your regular bags and your reagent bag separately on top of the backpack icon."
-- L.SETTINGS_CATALYST =                    "Instant Catalyst"
-- L.SETTINGS_CATALYST_DESC =               "Hold Shift to instantly catalyze an item, skipping the 5 second timer."
-- L.SETTINGS_VAULT =                       "Instant Great Vault"
-- L.SETTINGS_VAULT_DESC =                  "Hold Shift to instantly receive your reward from the Great Vault and skip the 5 second timer."
-- L.SETTINGS_INSTANT_TOOLTIP =             "Show Tooltip"
-- L.SETTINGS_INSTANT_TOOLTIP_DESC =        "Show the tooltip explaining how this feature works. The button text still changes when this is disabled."
-- L.SETTINGS_VENDOR_ALL =                  "Disable Vendor Filter"
-- L.SETTINGS_VENDOR_ALL_DESC =             "Automatically set all vendor filters to |cffFFFFFFAll|r to display items normally not shown to your class."

-- L.SOUND =                                SOUND -- "Sound"
-- L.SETTINGS_HIDE_LOOT_ROLL_WINDOW =       "Hide Loot Roll Window"
-- L.SETTINGS_HIDE_LOOT_ROLL_WINDOW_DESC =  "Hide the window that shows loot rolls and their results. You can show the window again with |cff00ccff/loot|r."
-- L.SETTINGS_QUEUESOUND_TITLE =            "Play Queue Sound"
-- L.SETTINGS_QUEUESOUND_DESC =             "Play the queue sound on the Master channel when any queue pops, including battlegrounds and pet battles."
-- L.SETTINGS_READYCHECKSOUND_TITLE =       "Play Ready Check Sound"
-- L.SETTINGS_READYCHECKSOUND_DESC =        "Play the ready check sound on the Master channel when a ready check is initiated."
-- L.SETTINGS_COUNTDOWNSOUND_TITLE =        "Play Countdown Sound"
-- L.SETTINGS_COUNTDOWNSOUND_DESC =         "Play the countdown sound on the Master channel when any countdown / pull timer is initiated."
-- L.SETTINGS_SHOWTOKENPRICE_TITLE =        "Show WoW Token Price"
-- L.SETTINGS_SHOWTOKENPRICE_DESC =         "Show the current WoW Token price on the WoW Token item tooltip."
-- L.SETTINGS_TOKYODRIFT_TITLE =            "Tokyo Drift"
-- L.SETTINGS_TOKYODRIFT_DESC =             "Vroom vroom."

-- L.ADDONS =                               "Addons"
-- L.SETTINGS_HANDYNOTESFIX_TITLE =         "Disable HandyNotes Alt " .. app.IconRMB
-- L.SETTINGS_HANDYNOTESFIX_DESC =          "Let " .. app.NameShort .. " disable HandyNotes' keybind on the map, re-enabling it for TomTom waypoints instead.\n\n" .. L.REQUIRES_RELOAD
-- L.SETTINGS_ORIBOSEXCHANGEFIX_TITLE =     "Fix Oribos Exchange Tooltip"
-- L.SETTINGS_ORIBOSEXCHANGEFIX_DESC =      "Let " .. app.NameShort .. " simplify and fix the tooltip provided by the Oribos Exchange addon:\n" ..
--                                          "- Round to the nearest gold.\n" ..
--                                          "- Fix recipe prices.\n" ..
--                                          "- Fix profession window prices.\n" ..
--                                          "- Show battle pet prices inside the existing tooltip."

-- L.HOLIDAYS =                             CALENDAR_FILTER_HOLIDAYS -- "Holidays"
-- L.SETTINGS_HALLOWSIT_TITLE =             "[Hallow's End] No Trick"
-- L.SETTINGS_HALLOWSIT_DESC =              "Sit down before completing a Candy Bucket quest, preventing getting tricked and pacified."
