-----------------------------------------
-- Slacker's Tweak Suite: Holidays.lua --
-----------------------------------------

-- Initialisation
local appName, app = ...
local api = app.api
local L = app.locales

------------------
-- Hallow's End --
------------------

app.Event:Register("PLAYER_SOFT_INTERACT_CHANGED", function(oldTarget, newTarget)
	if SlackersTweakSuite_Settings["candySit"] then
		local candyBucket = {
			"Candy Bucket",
			"Eimer mit Süßigkeiten",
			"Cubo de caramelos",
			"Un seau de bonbons",
			"Secchio delle Caramelle",
			"Balde de balas",
			"Кулек конфет",
			"사탕 바구니",
			"糖罐",
			"糖果桶",
		}
		if newTarget then
			for _, name in pairs(candyBucket) do
				if UnitName("softinteract") == name then
					app.SoftTarget = "Candy Bucket"
					return
				end
			end
			app.SoftTarget = nil
		end
	end
end)

app.Event:Register("QUEST_COMPLETE", function()
	if SlackersTweakSuite_Settings["candySit"] and app.SoftTarget and app.SoftTarget == "Candy Bucket" then
		DoEmote("SIT", "player", true)
	end
end)
