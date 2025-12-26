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

-- Tooltip
-- L.REGION =								"Region"	-- Preceded by an abbreviated region name such as "EU" or "US"

-- Settings
L.SETTINGS_SUPPORT_TEXTLONG =			"Le développement de cette extension demande beaucoup de temps et d’efforts.\nVeuillez envisager de soutenir financièrement le développeur."
L.SETTINGS_SUPPORT_TEXT =				"Soutien"
L.SETTINGS_SUPPORT_BUTTON =				"Buy Me a Coffee"	-- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_SUPPORT_DESC =				"Merci !"
L.SETTINGS_HELP_TEXT =					"Commentaires et aide"
L.SETTINGS_HELP_BUTTON =				"Discord"	-- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_HELP_DESC =					"Rejoignez le serveur Discord."
L.SETTINGS_ISSUES_TEXT =				"Suivi des problèmes"
L.SETTINGS_ISSUES_BUTTON =				"GitHub"	-- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_ISSUES_DESC =				"Consultez le système de suivi des problèmes (« Issues ») sur GitHub."
L.SETTINGS_URL_COPY =					"Ctrl + C pour copier :"
L.SETTINGS_URL_COPIED =					"Lien copié dans le presse-papiers"

-- L.SETTINGS_CURSORGUIDE_TITLE =			"Cursor Guide"
-- L.SETTINGS_CURSORGUIDE_TOOLTIP =		"Show a guide around the cursor to help you keep track of it."
-- L.SETTINGS_CURSORGUIDE_COMBAT_TITLE =	"Only In Combat"
-- L.SETTINGS_CURSORGUIDE_COMBAT_TOOLTIP =	"Only show the cursor guide in combat."
-- L.SETTINGS_COMPARE_TITLE =				"Disable Always Compare"
-- L.SETTINGS_COMPARE_TOOLTIP =			"Disable the always compare items behavior added in 11.2.7."
L.SETTINGS_SPLITBAG_TITLE =				"Nombre de composants dans les sacs"
L.SETTINGS_SPLITBAG_TOOLTIP =			"Affiche les emplacements libres de vos sacs et sac de composants séparément au-dessus de l’icône du sac à dos."
L.SETTINGS_QUEUESOUND_TITLE =			"Jouer un son pour la file d’attente"
-- L.SETTINGS_QUEUESOUND_TOOLTIP =			"Play the queue sound on the Master channel when any queue pops, including battlegrounds and pet battles."
L.SETTINGS_SHOWTOKENPRICE_TITLE =		"Afficher le prix du jeton WoW"
L.SETTINGS_SHOWTOKENPRICE_TOOLTIP =		"Afficher le prix actuel du jeton WoW dans l'infobulle de l'objet « Jeton WoW »."
L.SETTINGS_TOKYODRIFT_TITLE = 			"Tokyo Drift"
L.SETTINGS_TOKYODRIFT_TOOLTIP = 		"Vroom vroom."
-- L.ADDONS = 								ADDONS
L.SETTINGS_HANDYNOTESFIX_TITLE =		"Désactiver HandyNotes Alt " .. app.IconRMB
L.SETTINGS_HANDYNOTESFIX_TOOLTIP =		"Permettre à " .. app.NameShort .. " de désactiver le raccourci clavier d’HandyNotes sur la carte, en le réactivant pour les points de passages TomTom à la place.\n\n" .. L.REQUIRES_RELOAD
L.SETTINGS_ORIBOSEXCHANGEFIX_TITLE =	"Corriger l’info-bulle de l’échange d’Oribos"
L.SETTINGS_ORIBOSEXCHANGEFIX_TOOLTIP =	app.NameShort .. " simplifie et corrige l’info-bulle fournie par l’addon Oribos Exchange :\n" ..
										"- Arrondir à l’or le plus proche\n" ..
										"- Corrige les prix des recettes\n" ..
										"- Corrige les prix dans la fenêtre des professions\n" ..
										"- Affiche les prix des mascottes de combat dans l’info-bulle existante"
-- L.HOLIDAYS =							CALENDAR_FILTER_HOLIDAYS
-- L.SETTINGS_HALLOWSIT_TITLE =			"[Hallow's End] No Trick"
-- L.SETTINGS_HALLOWSIT_TOOLTIP =			"Sit down before completing a Candy Bucket quest, preventing getting tricked and pacified."
