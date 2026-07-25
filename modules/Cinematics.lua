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
-- SKIP CEEN CINEMATICS --
--------------------------

function app:SkipSeenCinematics()
	local function registerMovie(movieID, mapID)
		app.Settings.cinematics[movieID] = app.Settings.cinematics[movieID] or {}
		local date = C_DateAndTime.GetCurrentCalendarTime()
		table.insert(app.Settings.cinematics[movieID], { dateTime = string.format("%d-%02d-%02d %02d:%02d", date.year, date.month, date.monthDay, date.hour, date.minute), map = C_Map.GetMapInfo(mapID).name, mapID = mapID })
	end

	local function handleMovie(movieID, source)
		local mapID = C_Map.GetBestMapForUnit("player")
		app:Debug(source)
		if not movieID then
			app:Debug("No movieID found")
		elseif app.Settings.cinematics[movieID] then
			local seenMap = false
			for _, seen in ipairs(app.Settings.cinematics[movieID]) do
				if seen.mapID == mapID then
					app:Debug("Skipped movieID", movieID)
					MovieFrame:Hide()
					StopCinematic()
					CancelScene()
					seenMap = true
					break
				end
			end
			if not seenMap then
				app:Debug("Registering movieID (new map)", movieID)
				C_Timer.After(2, function() registerMovie(movieID, mapID) end)
			end
		else
			app:Debug("Registering movieID", movieID)
			C_Timer.After(2, function() registerMovie(movieID, mapID) end)
		end
	end

	EventRegistry:RegisterCallback("CinematicFrame.CinematicStarting", function(movieID)
		handleMovie(movieID, "CinematicFrame.CinematicStarting")
	end)

	hooksecurefunc("CinematicStarted", function(movieType, movieID, canCancel)
		handleMovie(movieID, "CinematicStarted")
	end)

	hooksecurefunc("MovieFrame_PlayMovie", function(self, movieID) -- unconfirmed
		handleMovie(movieID, "MovieFrame_PlayMovie")
	end)
end
