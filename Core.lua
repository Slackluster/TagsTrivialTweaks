------------------------------------
-- Tag's Trivial Tweaks: Core.lua --
------------------------------------

-- Initialisation
local appName, app = ...	-- Returns the addon name and a unique table
app.locales = {}
app.api = {}
TagsTrivialTweaks = app.api

---------------------------
-- WOW API EVENT HANDLER --
---------------------------

app.Event = CreateFrame("Frame")
app.Event.handlers = {}

-- Register the event and add it to the handlers table
function app.Event:Register(eventName, func)
	if not self.handlers[eventName] then
		self.handlers[eventName] = {}
		self:RegisterEvent(eventName)
	end
	table.insert(self.handlers[eventName], func)
end

-- Run all handlers for a given event, when it fires
app.Event:SetScript("OnEvent", function(self, event, ...)
	if self.handlers[event] then
		for _, handler in ipairs(self.handlers[event]) do
			handler(...)
		end
	end
end)

----------------------
-- HELPER FUNCTIONS --
----------------------

function app.Colour(string)
	return "|cffC69B6D" .. string .. "|r"
end

-------------------
-- VERSION COMMS --
-------------------

function app.SendAddonMessage(message)
	if IsInRaid(2) or IsInGroup(2) then
		ChatThrottleLib:SendAddonMessage("NORMAL", "TagsTrivTweaks", message, "INSTANCE_CHAT")
	elseif IsInRaid() then
		ChatThrottleLib:SendAddonMessage("NORMAL", "TagsTrivTweaks", message, "RAID")
	elseif IsInGroup() then
		ChatThrottleLib:SendAddonMessage("NORMAL", "TagsTrivTweaks", message, "PARTY")
	end
end

app.Event:Register("GROUP_ROSTER_UPDATE", function(category, partyGUID)
	local message = "version:" .. C_AddOns.GetAddOnMetadata("TagsTrivialTweaks", "Version")
	app.SendAddonMessage(message)
end)

app.Event:Register("CHAT_MSG_ADDON", function(prefix, text, channel, sender, target, zoneChannelID, localID, name, instanceID)
	if prefix == "TagsTrivTweaks" then
		local version = text:match("version:(.+)")
		if version then
			if version ~= "@project-version@" then
				local expansion, major, minor, iteration = version:match("v(%d+)%.(%d+)%.(%d+)%-(%d%d%d)")
				expansion = string.format("%02d", expansion)
				major = string.format("%02d", major)
				minor = string.format("%02d", minor)
				local otherGameVersion = tonumber(expansion .. major .. minor)
				local otherAddonVersion = tonumber(iteration)

				local localVersion = C_AddOns.GetAddOnMetadata("TagsTrivialTweaks", "Version")
				if localVersion ~= "@project-version@" then
					expansion, major, minor, iteration = localVersion:match("v(%d+)%.(%d+)%.(%d+)%-(%d%d%d)")
					expansion = string.format("%02d", expansion)
					major = string.format("%02d", major)
					minor = string.format("%02d", minor)
					local localGameVersion = tonumber(expansion .. major .. minor)
					local localAddonVersion = tonumber(iteration)

					if otherGameVersion > localGameVersion or (otherGameVersion == localGameVersion and otherAddonVersion > localAddonVersion) then
						if GetServerTime() - app.Flag.VersionCheck > 600 then
							app.Print(L.NEW_VERSION_AVAILABLE, version)
							app.Flag.VersionCheck = GetServerTime()
						end
					end
				end
			end
		end
	end
end)
