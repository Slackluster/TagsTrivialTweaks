------------------------------------
-- Tag's Trivial Tweaks: frFR.lua --
------------------------------------
-- French (France) localisation
-- Translator(s): Klep-Ysondre

-- Initialisation
if GetLocale() ~= "frFR" then return end
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
L.SETTINGS_SUPPORT_TEXTLONG =			"Le développement de cette extension demande beaucoup de temps et d’efforts.\nVeuillez envisager de soutenir financièrement le développeur."
L.SETTINGS_SUPPORT_TEXT =				"Soutien"
L.SETTINGS_SUPPORT_BUTTON =				"Lien"
L.SETTINGS_SUPPORT_DESC =				"Merci !"
L.SETTINGS_SUPPORT_COPY =				"Ctrl+C pour copier :"
L.SETTINGS_SUPPORT_COPIED =				"Lien copié dans le presse-papiers"

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
-- L.HOLIDAYS =							CALENDAR_FILTER_HOLIDAYS
-- L.SETTINGS_HALLOWSIT_TITLE =			"[Hallow's End] No Trick"
-- L.SETTINGS_HALLOWSIT_TOOLTIP =			"Sit down before completing a Candy Bucket quest, preventing getting tricked and pacified."
-- L.REMIX = 								"Remix"
-- L.SETTINGS_ARTIFACTBUTTON_TITLE =		"Artifact Button"
-- L.SETTINGS_ARTIFACTBUTTON_TOOLTIP =		"Show an extra action button for your artifact ability. Movable through Edit Mode."
