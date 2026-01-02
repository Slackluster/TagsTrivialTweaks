----------------------------------------
-- Slacker's Tweak Suite: Tooltip.lua --
----------------------------------------

-- Initialisation
local appName, app = ...

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app:ShowTokenPrice()
	end
end)

-----------------
-- TOKEN PRICE --
-----------------

function app:ShowTokenPrice()
	local function OnTooltipSetItem(tooltip, data)
		local _, _, itemID = TooltipUtil.GetDisplayedItem(tooltip)

		if SlackersTweakSuite_Settings["showTokenPrice"] then
			if itemID and itemID == 122270 and C_WowTokenPublic.GetCurrentMarketPrice() then
				tooltip:AddLine(" ")
				tooltip:AddDoubleLine(TOKEN_CURRENT_MARKET_PRICE, GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
			end
		end
	end
	TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetItem)
end
