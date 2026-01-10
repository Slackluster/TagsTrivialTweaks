------------------------------------
-- Slacker's Tweak Suite: Fun.lua --
------------------------------------

-- Initialisation
local appName, app = ...
local api = app.api
local L = app.locales

-----------------
-- Tokyo Drift --
-----------------

app.Event:Register("UNIT_POWER_UPDATE", function(unitTarget, powerType)
	if SlackersTweakSuite_Settings["tokyoDrift"] then
		local function hasBuff(spellID)
			for i = 1, 40 do
				local aura = C_UnitAuras.GetBuffDataByIndex("player", i)
				if aura and aura.spellId == spellID then
					return true
				end
			end
			return false
		end

		local secretAura = C_UnitAuras.GetBuffDataByIndex("player", 1)
		if secretAura and secretAura.spellId and issecretvalue and issecretvalue(secretAura.spellId) then return end

		-- If we're gaining or losing alternative power (turbo!) and are mounted on our DRIVE mount
		if unitTarget == "player" and powerType == "ALTERNATE" and hasBuff(460013) then
			if not app.TDHandle then
				local _
				_, app.TDHandle = PlaySoundFile("Interface\\AddOns\\SlackersTweakSuite\\assets\\TokyoDrift.ogg", "Master")
			end

			app.TDLastPlayTime = GetTime()

			-- Check every 2.5 seconds if we're not stagnant
			local function checkStop()
				if app.TDHandle and GetTime() >= app.TDLastPlayTime + 2.5 and not hasBuff(471755) then
					StopSound(app.TDHandle)
					app.TDHandle = nil
				else
					C_Timer.After(2.5, checkStop)
				end
			end
			checkStop()
		end
	end
end)
