-------------------------------------------
-- Slacker's Tweak Suite: Cinematics.lua --
-------------------------------------------

local appName, app = ...

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app.Settings.cinematics = app.Settings.cinematics or {}

		app:SkipSeenCinematics()
	end
end)

--------------------------
-- SKIP SEEN CINEMATICS --
--------------------------

function app:SkipSeenCinematics()
	local function handleCinematic(key)
		if not app.Settings.cinematics[key] then
			app.Settings.cinematics[key] = true
			app:Debug("Registering cinematic", key)
		elseif app.Settings["skipSeenCinematics"] then
			MovieFrame:Hide()
			StopCinematic()
			CancelScene()
			app:Debug("Canceling cinematic", key)
		end
	end

	EventRegistry:RegisterCallback("CinematicFrame.CinematicStarting", function()
		local map = C_Map.GetBestMapForUnit("player")
		if not map then return end
		local zone = GetZoneText() or ""
		local subzone = GetSubZoneText() or ""

		local key = "cinematic:" .. map .. ":" .. zone .. ":" .. subzone
		handleCinematic(key)
	end)

	hooksecurefunc("CinematicStarted", function(movieType, movieID, canCancel)
		if not movieID then return end

		local key = "movie:" .. movieID
		handleCinematic(key)
	end)
end
