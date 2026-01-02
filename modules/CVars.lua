--------------------------------------
-- Slacker's Tweak Suite: CVars.lua --
--------------------------------------

-- Initialisation
local appName, app = ...

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app:ToggleAlwaysCompare()
	end
end)

-----------------
-- Token price --
-----------------

function app:ToggleAlwaysCompare()
	if SlackersTweakSuite_Settings["disableAlwaysCompare"] then
		SetCVar("alwaysCompareItems", "0")
	else
		SetCVar("alwaysCompareItems", "1")
	end
end
