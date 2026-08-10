-------------------------------------
-- Slacker's Tweak Suite: Core.lua --
-------------------------------------

local appName, app = ...
app.locales = {}
app.api = {}
SlackersTweakSuite = app.api
local api = app.api
local L = app.locales

---------------------------
-- WOW API EVENT HANDLER --
---------------------------

app.Event = CreateFrame("Frame")
app.Event.handlers = {}

function app.Event:Register(eventName, func)
	if not self.handlers[eventName] then
		self.handlers[eventName] = {}
		self:RegisterEvent(eventName)
	end
	table.insert(self.handlers[eventName], func)
end

app.Event:SetScript("OnEvent", function(self, event, ...)
	if self.handlers[event] then
		for _, handler in ipairs(self.handlers[event]) do
			handler(...)
		end
	end
end)

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app.Flag = {}

		C_ChatInfo.RegisterAddonMessagePrefix("SlackTweakSuite")
		app:CreateSlashCommands()
	end
end)

-------------------
-- VERSION COMMS --
-------------------

function app:SendAddonMessage(message)
	if IsInRaid(2) or IsInGroup(2) then
		ChatThrottleLib:SendAddonMessage("NORMAL", app.NamePrefix, message, "INSTANCE_CHAT")
	elseif IsInGroup() or IsInRaid() then
		ChatThrottleLib:SendAddonMessage("NORMAL", app.NamePrefix, message, "RAID")
	elseif IsInGuild() then
		ChatThrottleLib:SendAddonMessage("NORMAL", app.NamePrefix, message, "GUILD")
	end
end

app.Event:Register("GROUP_ROSTER_UPDATE", function(category, partyGUID)
	app:SendAddonMessage("version:" .. C_AddOns.GetAddOnMetadata(appName, "Version"))
end)

app.Event:Register("PLAYER_ENTERING_WORLD", function(isInitialLogin, isReloadingUi)
	if isInitialLogin or isReloadingUi then
		app:SendAddonMessage("version:" .. C_AddOns.GetAddOnMetadata(appName, "Version"))
	end
end)

app.Event:Register("CHAT_MSG_ADDON", function(prefix, text, channel, sender, target, zoneChannelID, localID, name, instanceID)
	if prefix == app.NamePrefix then
		local version = text:match("version:(.+)")
		if version and not app.Flag.VersionCheck then
			local expansion, major, minor, iteration = version:match("v(%d+)%.(%d+)%.(%d+)%-(%d+)")
			if expansion then
				expansion = string.format("%02d", expansion)
				major = string.format("%02d", major)
				minor = string.format("%02d", minor)
				local otherGameVersion = tonumber(expansion .. major .. minor)
				local otherAddonVersion = tonumber(iteration)

				local localVersion = C_AddOns.GetAddOnMetadata(appName, "Version")
				local expansion2, major2, minor2, iteration2 = localVersion:match("v(%d+)%.(%d+)%.(%d+)%-(%d+)")
				if expansion2 then
					expansion2 = string.format("%02d", expansion2)
					major2 = string.format("%02d", major2)
					minor2 = string.format("%02d", minor2)
					local localGameVersion = tonumber(expansion2 .. major2 .. minor2)
					local localAddonVersion = tonumber(iteration2)

					if otherGameVersion > localGameVersion or (otherGameVersion == localGameVersion and otherAddonVersion > localAddonVersion) then
						app:Print(L.NEW_VERSION_AVAILABLE, version)
						app.Flag.VersionCheck = true
					end
				end
			end
		end
	end
end)

--------------------
-- SLASH COMMANDS --
--------------------

function app:CreateSlashCommands()
	SLASH_RELOADUI1 = "/rl"
	SlashCmdList.RELOADUI = ReloadUI

	SLASH_SlackersTweakSuite1 = "/sts"
	function SlashCmdList.SlackersTweakSuite(msg, editBox)
		local command, rest = msg:match("^(%S*)%s*(.-)$")

		if command == "settings" then
			app:OpenSettings()
		elseif command == "debug" then
			if app.Settings["debug"] then
				app.Settings["debug"] = false
				app:Print(L.DEBUG_DISABLED)
			else
				app.Settings["debug"] = true
				app:Print(L.DEBUG_ENABLED)
			end
		else
			app:Print(L.INVALID_COMMAND)
		end
	end
end

----------------------
-- HELPER FUNCTIONS --
----------------------

function app:Colour(string, colour)
	return "|cff" .. (colour or "3FC7EB") .. string .. "|r"
end

function app:Debug(...)
	if app.Settings["debug"] then
		print(app.NameShort .. app:Colour(" Debug") .. ":", ...)
	end
end

function app:Print(...)
	print(app.NameShort .. ":", ...)
end

function app:GetTooltipItem(tooltip, itemData)
	local _, itemID, itemLink
	if itemData and itemData.id then
		itemID = itemData.id
		_, itemLink = C_Item.GetItemInfo(itemID)
	elseif tooltip.GetItem then
		_, itemLink, itemID = tooltip:GetItem()
	else
		_, itemLink, itemID = TooltipUtil.GetDisplayedItem(GameTooltip)
	end
	return itemID, itemLink
end

function app:RoundedItemValue(itemID, itemLink, speciesID)
	if (not itemID and not itemLink) or itemID == 0 then return 0, 0 end

	local realmPrice = {}
	local regionPrice = {}
	if not itemLink then
		if C_AddOns.IsAddOnLoaded("TradeSkillMaster") then
			table.insert(realmPrice, { price = TSM_API.GetCustomPriceValue("dbmarket", "i:" .. itemID) or 0, age = -1 })
			table.insert(regionPrice, { price = TSM_API.GetCustomPriceValue("dbregionmarketavg", "i:" .. itemID) or 0, age = -1 })
		end
		if C_AddOns.IsAddOnLoaded("Auctionator") then
			table.insert(realmPrice, { price = Auctionator.API.v1.GetAuctionPriceByItemID(app.Name, itemID) or 0, age = Auctionator.API.v1.GetAuctionAgeByItemID(app.Name, itemID) or 99 })
		end
		if C_AddOns.IsAddOnLoaded("OribosExchange") then
			local oeData = {}
			OEMarketInfo(itemID, oeData)
			table.insert(realmPrice, { price = oeData.market or 0, age = (oeData.age and oeData.age / 60 / 60 / 24) or 99 })
			table.insert(regionPrice, { price = oeData.region or 0, age = (oeData.age and oeData.age / 60 / 60 / 24) or 99 })
		end
	else
		if C_AddOns.IsAddOnLoaded("TradeSkillMaster") then
			table.insert(realmPrice, { price = TSM_API.GetCustomPriceValue("dbmarket", "p:" .. speciesID) or 0, age = -1 })
			table.insert(regionPrice, { price = TSM_API.GetCustomPriceValue("dbregionmarketavg", "p:" .. speciesID) or 0, age = -1 })
		end
		if C_AddOns.IsAddOnLoaded("Auctionator") then
			table.insert(realmPrice, { price = Auctionator.API.v1.GetAuctionPriceByItemLink(app.Name, itemLink) or 0, age = Auctionator.API.v1.GetAuctionAgeByItemLink(app.Name, itemLink) or 99 })
		end
		if C_AddOns.IsAddOnLoaded("OribosExchange") then
			local oeData = {}
			OEMarketInfo(itemLink, oeData)
			table.insert(realmPrice, { price = oeData.market or 0, age = (oeData.age and oeData.age / 60 / 60 / 24) or 99 })
			table.insert(regionPrice, { price = oeData.region or 0, age = (oeData.age and oeData.age / 60 / 60 / 24) or 99 })
		end
	end

	table.sort(realmPrice, function(a, b) return a.age < b.age end)
	table.sort(regionPrice, function(a, b) return a.age < b.age end)
	local function getPrice(table)
		for _, value in ipairs(table) do
			if value.price > 0 then
				if value.price >= 10000 then
					value.price = math.floor(value.price / 10000) * 10000
				elseif value.price >= 100 then
					value.price = math.floor(value.price / 100) * 100
				end
				return value.price
			end
		end
		return 0
	end

	return getPrice(realmPrice), getPrice(regionPrice)
end
