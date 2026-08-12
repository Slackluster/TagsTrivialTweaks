---------------------------------------
-- Slacker's Tweak Suite: Sounds.lua --
---------------------------------------

local appName, app = ...
local api = app.api
local L = app.locales

-----------
-- QUEUE --
-----------

function app:PlayQueueSound()
	if app.Settings["queueSound"] then
		PlaySoundFile(567478, "Master")
	end
end

app.Event:Register("LFG_PROPOSAL_SHOW", function()
	app:PlayQueueSound()
end)

app.Event:Register("PET_BATTLE_QUEUE_PROPOSE_MATCH", function()
	app:PlayQueueSound()
end)

hooksecurefunc("PVPReadyDialog_Display", function()
	app:PlayQueueSound()
end)

-----------------
-- READY CHECK --
-----------------

function app:PlayReadyCheckSound()
	if app.Settings["readyCheckSound"] then
		PlaySoundFile(567478, "Master")
	end
end

app.Event:Register("LFG_READY_CHECK_SHOW", function(isRequeue)
	app:PlayReadyCheckSound()
end)

app.Event:Register("READY_CHECK", function(initiatorName, readyCheckTimeLeft)
	app:PlayReadyCheckSound()
end)

---------------
-- COUNTDOWN --
---------------

function app:PlayCountdownSound(seconds)
	local function countdown(time)
		if not app.Flag.Countdown then return end
		if time ~= 0 then
			PlaySoundFile(567474, "Master")
			time = time - 1
			C_Timer.After(1, function()
				countdown(time)
			end)
		else
			PlaySoundFile(567438, "Master")
			app.Flag.Countdown = false
		end
	end
	if app.Settings["countdownSound"] then
		countdown(seconds)
	end
end

app.Event:Register("START_PLAYER_COUNTDOWN", function(initiatedBy, timeRemaining, totalTime, informChat, initiatedByName)
	app.Flag.Countdown = true
	app:PlayCountdownSound(timeRemaining)
end)

app.Event:Register("CANCEL_PLAYER_COUNTDOWN", function(initiatedBy, informChat, initiatedByName)
	app.Flag.Countdown = false
end)
