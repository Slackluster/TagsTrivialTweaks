-----------------------------------------
-- Slacker's Tweak Suite: Database.lua --
-----------------------------------------

local appName, app = ...

-- Strings
app.Name = "Slacker's Tweak Suite"
app.NameLong = app:Colour("Slacker's Tweak Suite")
app.NameShort = app:Colour("STS")
app.NamePrefix = "SlackTweakSuite"

-- Textures
app.Icon = "Interface\\Icons\\inv_10_engineering_manufacturedparts_gear_frost"
app.IconReady = CreateSimpleTextureMarkup("Interface\\RaidFrame\\ReadyCheck-Ready")
app.IconNotReady = CreateSimpleTextureMarkup("Interface\\RaidFrame\\ReadyCheck-NotReady")
app.IconLMB = CreateAtlasMarkup("housing-hotkey-icon-leftclick")
app.IconRMB = CreateAtlasMarkup("housing-hotkey-icon-rightclick")
app.IconNew = CreateAtlasMarkup("UI-Journeys-GreatVault-Tag-new", 40, 30)
