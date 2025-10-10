--------------------------------------
-- Tag's Trivial Tweaks: Queue.lua --
--------------------------------------

-- Initialisation
local appName, app = ...

-----------------
-- QUEUE SOUND --
-----------------

function app.QueueSound()
	if TagsTrivialTweaks_Settings["queueSound"] then
		PlaySoundFile(567478, "Master")
	end
end

app.Event:Register("LFG_PROPOSAL_SHOW", function()
	app.QueueSound()
end)

app.Event:Register("PET_BATTLE_QUEUE_PROPOSE_MATCH", function()
	app.QueueSound()
end)

hooksecurefunc("PVPReadyDialog_Display", function()
	app.QueueSound()
end)
