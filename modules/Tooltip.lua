---------------------------------------
-- Tag's Trivial Tweaks: Tooltip.lua --
---------------------------------------

-- Initialisation
local appName, app = ...

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app.TokenPrice()
	end
end)

-----------------
-- Token price --
-----------------

function app.TokenPrice()
	local function OnTooltipSetItem(tooltip)
		local _, _, itemID = TooltipUtil.GetDisplayedItem(tooltip)

		if TagsTrivialTweaks_Settings["showTokenPrice"] then
			if itemID and itemID == 122270 and C_WowTokenPublic.GetCurrentMarketPrice() then
				tooltip:AddLine(" ")
				tooltip:AddDoubleLine(TOKEN_CURRENT_MARKET_PRICE, GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
			end
		end
	end
	TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetItem)
end
