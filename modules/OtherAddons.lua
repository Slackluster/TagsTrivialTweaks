--------------------------------------------
-- Slacker's Tweak Suite: OtherAddons.lua --
--------------------------------------------

local appName, app = ...
local api = app.api
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app:DisableHandyNotesAltRMB()
		app:ShowRecentAHPrice()
		app:HideOribosMessage()
	end
end)

app.Event:Register("PLAYER_ENTERING_WORLD", function(isInitialLogin, isReloadingUi)
	if isInitialLogin or isReloadingUi then
		if C_AddOns.IsAddOnLoaded("Auctionator") or C_AddOns.IsAddOnLoaded("OribosExchange") or C_AddOns.IsAddOnLoaded("TradeSkillMaster") then
			app.Flag.IsAuctionAddonLoaded = true
		else
			app.Flag.IsAuctionAddonLoaded = false
		end
	end
end)

----------------------------
-- HANDYNOTES ALT+RMB FIX --
----------------------------

function app:DisableHandyNotesAltRMB()
	if app.Settings["handyNotes"] then
		-- Thank you Numy!
		if C_AddOns.IsAddOnLoaded("HandyNotes") and LibStub("AceAddon-3.0"):GetAddon("HandyNotes") then
			local f = LibStub("AceAddon-3.0"):GetAddon("HandyNotes"):GetModule("HandyNotes").ClickHandlerFrame
			local f2 = CreateFrame("Frame")
			f:SetParent(f2)
			f2:Hide()
		end
	end
end

---------------------
-- RECENT AH PRICE --
---------------------

function app:ShowRecentAHPrice()
	local function OnTooltipSetItem(tooltip, itemData)
		if app.Settings["ahPriceTooltip"] and app.Flag.IsAuctionAddonLoaded then
			local itemID = app:GetTooltipItem(tooltip, itemData)
			if not itemID or select(14, C_Item.GetItemInfo(itemID)) == 1 then return end

			local realmPrice, regionPrice = app:RoundedItemValue(itemID)
			if realmPrice + regionPrice > 0 then
				tooltip:AddLine(" ")
				if realmPrice > 0 then
					tooltip:AddDoubleLine(GetNormalizedRealmName(), GetMoneyString(realmPrice, true))
				end
				if regionPrice > 0 then
					tooltip:AddDoubleLine(GetCurrentRegionName() .. " " .. L.REGION, GetMoneyString(regionPrice, true))
				end
			end
		end
	end
	TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetItem)
end

local LibBattlePetTooltipLine = LibStub("LibBattlePetTooltipLine-1-0")
hooksecurefunc("BattlePetToolTip_Show", function(...)
	if app.Settings["ahPriceTooltip"] and app.Flag.IsAuctionAddonLoaded then
		local speciesID, level, breedQuality, maxHealth, power, speed, bracketName = ...
		local itemLink = "|cff0070dd|Hbattlepet:" .. speciesID .. ":" .. level .. ":" .. breedQuality .. ":" .. maxHealth .. ":" .. power .. ":" .. speed .. "|h" .. bracketName .. "|h|r"

		local realmPrice, regionPrice = app:RoundedItemValue(_, itemLink, speciesID)
		if realmPrice + regionPrice > 0 then
			LibBattlePetTooltipLine:AddDoubleLine(BattlePetTooltip, " ", " ")
			if realmPrice > 0 then
				LibBattlePetTooltipLine:AddDoubleLine(BattlePetTooltip, GetNormalizedRealmName(), GetMoneyString(realmPrice, true))
			end
			if regionPrice > 0 then
				LibBattlePetTooltipLine:AddDoubleLine(BattlePetTooltip, GetCurrentRegionName() .. " " .. L.REGION, GetMoneyString(regionPrice, true))
			end
		end
	end
end)

function app:HideOribosMessage()
	if app.Settings["ahPriceTooltip"] and C_AddOns.IsAddOnLoaded("OribosExchange") then
		OETooltip(false)

		if C_AddOns.IsAddOnLoaded("Chattynator") then
			Chattynator.API.AddFilter(function(data)
				return data.typeInfo.type ~= "ADDON" or data.typeInfo.source ~= "OribosExchange" or not data.text:match("Tooltip prices disabled")
			end, 1, 1)
		else
			local function removeMessage()
				local message = "Tooltip prices disabled. Run |cFFFFFF78/oetooltip on|r to enable."
				local removed = 0

				ChatFrame1:RemoveMessagesByPredicate(function(m)
					if issecretvalue(m) then return end
					if m:find(message) ~= nil then removed = removed + 1 end
					return m:find(message) ~= nil
				end)

				if removed < 10 then
					C_Timer.After(1, function()
						RunNextFrame(removeMessage)
					end)
				end
			end
			removeMessage()
		end
	end
end
