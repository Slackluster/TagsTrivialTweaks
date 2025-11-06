-----------------------------------
-- Tag's Trivial Tweaks: Fun.lua --
-----------------------------------

-- Initialisation
local appName, app = ...

-----------------
-- Tokyo Drift --
-----------------

app.Event:Register("UNIT_POWER_UPDATE", function(unitTarget, powerType)
	if TagsTrivialTweaks_Settings["tokyoDrift"] then
		local function hasBuff(spellID)
			for i = 1, 40 do
				local aura = C_UnitAuras.GetBuffDataByIndex("player", i)
				if aura and aura.spellId == spellID then
					return true
				end
			end
			return false
		end

		-- If we're gaining or losing alternative power (turbo!) and are mounted on our DRIVE mount
		if unitTarget == "player" and powerType == "ALTERNATE" and hasBuff(460013) then
			if not app.TDHandle then
				local _
				_, app.TDHandle = PlaySoundFile("Interface\\AddOns\\TagsTrivialTweaks\\assets\\TokyoDrift.ogg", "Master")
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
