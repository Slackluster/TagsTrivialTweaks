-----------------------------------------
-- Slacker's Tweak Suite: Backpack.lua --
-----------------------------------------

-- Initialisation
local appName, app = ...

----------------------
-- BACKPACK SORTING --
----------------------

app.Event:Register("PLAYER_ENTERING_WORLD", function(isInitialLogin, isReloadingUi)
	if SlackersTweakSuite_Settings["backpackCleanup"] == 1 then
		C_Container.SetSortBagsRightToLeft(false)
	elseif SlackersTweakSuite_Settings["backpackCleanup"] == 2 then
		C_Container.SetSortBagsRightToLeft(true)
	end

	if SlackersTweakSuite_Settings["backpackLoot"] == 1 then
		C_Container.SetInsertItemsLeftToRight(true)
	elseif SlackersTweakSuite_Settings["backpackLoot"] == 2 then
		C_Container.SetInsertItemsLeftToRight(false)
	end
end)

-----------------------------
-- SPLIT REAGENT BAG COUNT --
-----------------------------

app.Event:Register("BAG_UPDATE_DELAYED", function()
	if not InCombatLockdown() then
		if SlackersTweakSuite_Settings["backpackCount"] then
			local freeSlots1 = C_Container.GetContainerNumFreeSlots(0) + C_Container.GetContainerNumFreeSlots(1) + C_Container.GetContainerNumFreeSlots(2) + C_Container.GetContainerNumFreeSlots(3) + C_Container.GetContainerNumFreeSlots(4)
			local freeSlots2 = C_Container.GetContainerNumFreeSlots(5)

			if C_Container.GetContainerNumSlots(5) ~= 0 then
				MainMenuBarBackpackButtonCount:SetText("(" .. freeSlots1 .. "+" .. freeSlots2 .. ")")
			end
		end
	end
end)
