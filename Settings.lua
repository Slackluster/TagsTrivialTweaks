----------------------------------------
-- Tag's Trivial Tweaks: Settings.lua --
----------------------------------------

-- Initialisation
local appName, app = ...
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		if not TagsTrivialTweaks_Settings then TagsTrivialTweaks_Settings = {} end

		app.Settings()
	end
end)

--------------
-- SETTINGS --
--------------

-- Settings
function app.Settings()
	local category, layout = Settings.RegisterVerticalLayoutCategory(app.NameLong)
	Settings.RegisterAddOnCategory(category)
	app.Category = category

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(C_AddOns.GetAddOnMetadata(appName, "Version")))

	local variable, name, tooltip = "backpackCount", L.SETTINGS_SPLITBAG_TITLE, L.SETTINGS_SPLITBAG_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, TagsTrivialTweaks_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)
	setting:SetValueChangedCallback(function()
		local freeSlots1 = C_Container.GetContainerNumFreeSlots(0) + C_Container.GetContainerNumFreeSlots(1) + C_Container.GetContainerNumFreeSlots(2) + C_Container.GetContainerNumFreeSlots(3) + C_Container.GetContainerNumFreeSlots(4)
		local freeSlots2 = C_Container.GetContainerNumFreeSlots(5)

		if TagsTrivialTweaks_Settings["backpackCount"] and C_Container.GetContainerNumSlots(5) ~= 0 then
			MainMenuBarBackpackButtonCount:SetText("(" .. freeSlots1 .. "+" .. freeSlots2 .. ")")
		else
			MainMenuBarBackpackButtonCount:SetText("(" .. freeSlots1 + freeSlots2 .. ")")
		end
	end)

	local variable, name, tooltip = "queueSound", L.SETTINGS_QUEUESOUND_TITLE, L.SETTINGS_QUEUESOUND_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, TagsTrivialTweaks_Settings, Settings.VarType.Boolean, name, false)
	Settings.CreateCheckbox(category, setting, tooltip)

	local variable, name, tooltip = "handyNotes", L.SETTINGS_HANDYNOTESFIX_TITLE, L.SETTINGS_HANDYNOTESFIX_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, TagsTrivialTweaks_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)

	local variable, name, tooltip = "underminePrices", L.SETTINGS_ORIBOSEXCHANGEFIX_TITLE, L.SETTINGS_ORIBOSEXCHANGEFIX_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, TagsTrivialTweaks_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)
	setting:SetValueChangedCallback(function()
		app.HideOribos()
	end)

	local variable, name, tooltip = "showTokenPrice", L.SETTINGS_SHOWTOKENPRICE_TITLE, L.SETTINGS_SHOWTOKENPRICE_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, TagsTrivialTweaks_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)

	local variable, name, tooltip = "tokyoDrift", L.SETTINGS_TOKYODRIFT_TITLE, L.SETTINGS_TOKYODRIFT_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, TagsTrivialTweaks_Settings, Settings.VarType.Boolean, name, false)
	Settings.CreateCheckbox(category, setting, tooltip)

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L.REMIX))

	local variable, name, tooltip = "artifactButton", L.SETTINGS_ARTIFACTBUTTON_TITLE, L.SETTINGS_ARTIFACTBUTTON_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, TagsTrivialTweaks_Settings, Settings.VarType.Boolean, name, false)
	Settings.CreateCheckbox(category, setting, tooltip)
	setting:SetValueChangedCallback(function()
		app.RemixArtifactButton()
	end)
end
