--------------------------------------
-- Slacker's Tweak Suite: Queue.lua --
--------------------------------------

-- Initialisation
local appName, app = ...
local api = app.api
local L = app.locales

-----------------
-- QUEUE SOUND --
-----------------

function app:PlayQueueSound()
	if SlackersTweakSuite_Settings["queueSound"] then
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
