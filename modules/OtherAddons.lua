-------------------------------------------
-- Tag's Trivial Tweaks: OtherAddons.lua --
-------------------------------------------

-- Initialisation
local appName, app = ...
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app.DisableHandyNotesAltRMB()
		app.UnderminePrices()
		app.HideOribos()
	end
end)

----------------------------
-- HANDYNOTES ALT+RMB FIX --
----------------------------

function app.DisableHandyNotesAltRMB()
	if TagsTrivialTweaks_Settings["handyNotes"] then
		-- Thank you for this code, Numy, this saves me a lot of frustration
		if C_AddOns.IsAddOnLoaded("HandyNotes") and LibStub("AceAddon-3.0"):GetAddon("HandyNotes") then
			local f = LibStub("AceAddon-3.0"):GetAddon("HandyNotes"):GetModule("HandyNotes").ClickHandlerFrame
			local f2 = CreateFrame("Frame")
			f:SetParent(f2)
			f2:Hide()
		end
	end
end

----------------------
-- UNDERMINE PRICES --
----------------------

function app.UnderminePrices()
	local function OnTooltipSetItem(tooltip)
		local itemLink, itemID, secondaryItemLink, secondaryItemID
		local _, primaryItemLink, primaryItemID = TooltipUtil.GetDisplayedItem(GameTooltip)
		if tooltip.GetItem then _, secondaryItemLink, secondaryItemID = tooltip:GetItem() end

		-- Get our most accurate itemLink and itemID
		itemID = primaryItemID or secondaryItemID
		if itemID then
			local _, _, _, _, _, _, _, _, _, _, _, classID, subclassID = C_Item.GetItemInfo(itemID)
			if classID == 9 and subclassID ~= 0 then
				_, itemLink = C_Item.GetItemInfo(itemID)
			else
				itemLink = primaryItemLink or secondaryItemLink
			end
		end

		-- Return if no link or BoP item
		if not itemLink or select(14, C_Item.GetItemInfo(itemLink)) == 1 then return end

		if TagsTrivialTweaks_Settings["underminePrices"] then
			if C_AddOns.IsAddOnLoaded("OribosExchange") then
				local marketPrice = 0
				local regionPrice = 0

				local oeData = {}
				OEMarketInfo(itemLink,oeData)
				if oeData["market"] ~= nil then
					marketPrice = oeData["market"]
				end
				if oeData["region"] ~= nil then
					regionPrice = oeData["region"]
				end

				-- Prefer Auctionator data if available
				if C_AddOns.IsAddOnLoaded("Auctionator") then
					local price = Auctionator.API.v1.GetAuctionPriceByItemID(app.Name, itemID)

					if marketPrice > 0 and regionPrice > 0 and price then
						marketPrice = price
					elseif marketPrice == 0 and regionPrice > 0 and price then
						regionPrice = price
					end
				end

				if marketPrice + regionPrice > 0 then
					-- Round our number up to only show full gold, silver or copper values
					if marketPrice >= 10000 then
						marketPrice = math.ceil(marketPrice / 10000) * 10000
					elseif marketPrice >= 100 then
						marketPrice = math.ceil(marketPrice / 100) * 100
					end
					if regionPrice >= 10000 then
						regionPrice = math.ceil(regionPrice / 10000) * 10000
					elseif regionPrice >= 100 then
						regionPrice = math.ceil(regionPrice / 100) * 100
					end

					tooltip:AddLine(" ")
					if marketPrice > 0 then
						tooltip:AddDoubleLine(GetNormalizedRealmName(),GetMoneyString(marketPrice, true))
					end
					if regionPrice > 0 then
						tooltip:AddDoubleLine(GetCurrentRegionName() .. " " .. L.REGION,GetMoneyString(regionPrice, true))
					end
				end
			end
		end
	end
	TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetItem)
end

local LibBattlePetTooltipLine = LibStub("LibBattlePetTooltipLine-1-0")
hooksecurefunc("BattlePetToolTip_Show", function(...)
	if TagsTrivialTweaks_Settings["underminePrices"] then
		if C_AddOns.IsAddOnLoaded("OribosExchange") then
			local speciesID1, level, breedQuality, maxHealth, power, speed, bracketName = ...
			local itemLink = "|cff0070dd|Hbattlepet:" .. speciesID1 .. ":" .. level .. ":" .. breedQuality .. ":" .. maxHealth .. ":" .. power .. ":" .. speed .. "|h" .. bracketName .. "|h|r"

			if itemLink == nil then return end

			local oeData = {}
			OEMarketInfo(itemLink,oeData)
			local marketPrice = 0
			local regionPrice = 0

			if oeData["market"] ~= nil then
				marketPrice = oeData["market"]
			end
			if oeData["region"] ~= nil then
				regionPrice = oeData["region"]
			end

			-- Prefer Auctionator data if available
				if C_AddOns.IsAddOnLoaded("Auctionator") then
					local price = Auctionator.API.v1.GetAuctionPriceByItemLink(app.Name, itemLink)

					if marketPrice > 0 and regionPrice > 0 and price then
						marketPrice = price
					elseif marketPrice == 0 and regionPrice > 0 and price then
						regionPrice = price
					end
				end

			if marketPrice + regionPrice > 0 then
				-- Round our number up to only show full gold, silver or copper values
					if marketPrice >= 10000 then
						marketPrice = math.ceil(marketPrice / 10000) * 10000
					elseif marketPrice >= 100 then
						marketPrice = math.ceil(marketPrice / 100) * 100
					end
					if regionPrice >= 10000 then
						regionPrice = math.ceil(regionPrice / 10000) * 10000
					elseif regionPrice >= 100 then
						regionPrice = math.ceil(regionPrice / 100) * 100
					end

				LibBattlePetTooltipLine:AddDoubleLine(BattlePetTooltip, " ", " ")
				if marketPrice > 0 then
					LibBattlePetTooltipLine:AddDoubleLine(BattlePetTooltip, GetNormalizedRealmName(), GetMoneyString(marketPrice, true))
				end
				if regionPrice > 0 then
					LibBattlePetTooltipLine:AddDoubleLine(BattlePetTooltip, GetCurrentRegionName() .. " " .. L.REGION, GetMoneyString(regionPrice, true))
				end
			end
		end
	end
end)

function app.HideOribos()
	if TagsTrivialTweaks_Settings["underminePrices"] then
		if C_AddOns.IsAddOnLoaded("OribosExchange") then
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
						-- We're probably too fast, so mark removed as +1
						if m:find(message) ~= nil then removed = removed + 1 end
						return m:find(message) ~= nil
					end)

					-- Try again if we failed, but only 10 times max
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
end
