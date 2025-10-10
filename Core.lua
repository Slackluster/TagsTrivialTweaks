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
