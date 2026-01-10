---------------------------------------------
-- Slacker's Tweak Suite: AlwaysActive.lua --
---------------------------------------------

local appName, app = ...
local api = app.api
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		--
	end
end)

----------------
-- REALM NAME --
----------------

EventRegistry:RegisterCallback("CharacterFrame.Show", function()
	if CharacterFrame and CharacterFrameTitleText then
		RunNextFrame(function()
			CharacterFrameTitleText:SetText(UnitName("player") .. " - " .. GetNormalizedRealmName())
		end)
	end
end)
