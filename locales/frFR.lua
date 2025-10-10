------------------------------------
-- Tag's Trivial Tweaks: frFR.lua --
------------------------------------
-- French (France) localisation
-- Translator(s): Machou

-- Initialisation
if GetLocale() ~= "frFR" then return end
local appName, app = ...
local L = app.locales

-- General
-- L.REQUIRES_RELOAD =						"|cffFF0000" .. REQUIRES_RELOAD .. ".|r Use |cffFFFFFF/reload|r or relog."	-- "Requires Reload"

-- Edit Mode
-- L.SCALE = 								"Scale"
-- L.VISIBLE_OUT_COMBAT = 					"Visible Out of combat"

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
L.SETTINGS_SPLITBAG_TITLE =				"Nombre de composants dans les sacs"
L.SETTINGS_SPLITBAG_TOOLTIP =			"Affiche les emplacements libres de vos sacs et sac de composants séparément au-dessus de l’icône du sac à dos."
L.SETTINGS_QUEUESOUND_TITLE =			"Jouer un son pour la file d’attente"
L.SETTINGS_QUEUESOUND_TOOLTIP =			"Joue le son de la file d’attente comme celui de « Deadly Boss Mods » lorsque n’importe quelle file d’attente s’ouvre, y compris les champs de bataille et les combats de mascottes."
L.SETTINGS_HANDYNOTESFIX_TITLE =		"Désactiver HandyNotes Alt " .. app.IconRMB
L.SETTINGS_HANDYNOTESFIX_TOOLTIP =		"Permettre à " .. app.NameShort .. " de désactiver le raccourci clavier d’HandyNotes sur la carte, en le réactivant pour les points de passages TomTom à la place.\n\n" .. L.REQUIRES_RELOAD
L.SETTINGS_ORIBOSEXCHANGEFIX_TITLE =	"Corriger l’info-bulle de l’échange d’Oribos"
L.SETTINGS_ORIBOSEXCHANGEFIX_TOOLTIP =	app.NameShort .. " simplifie et corrige l’info-bulle fournie par l’addon Oribos Exchange :\n" ..
										"- Arrondir à l’or le plus proche\n" ..
										"- Corrige les prix des recettes\n" ..
										"- Corrige les prix dans la fenêtre des professions\n" ..
										"- Affiche les prix des mascottes de combat dans l’info-bulle existante"
L.SETTINGS_SHOWTOKENPRICE_TITLE =		"Afficher le prix du jeton WoW"
L.SETTINGS_SHOWTOKENPRICE_TOOLTIP =		"Afficher le prix actuel du jeton WoW dans l'infobulle de l'objet « Jeton WoW »."
L.SETTINGS_TOKYODRIFT_TITLE = 			"Tokyo Drift"
L.SETTINGS_TOKYODRIFT_TOOLTIP = 		"Vroom vroom."
-- L.REMIX = 								"Remix"
-- L.SETTINGS_ARTIFACTBUTTON_TITLE =		"Artifact Button"
-- L.SETTINGS_ARTIFACTBUTTON_TOOLTIP =		"Show an extra action button for your artifact ability. Movable through Edit Mode."
