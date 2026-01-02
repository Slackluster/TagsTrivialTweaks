-----------------------------------------
-- Slacker's Tweak Suite: Settings.lua --
-----------------------------------------

-- Initialisation
local appName, app = ...
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		if not SlackersTweakSuite_Settings then SlackersTweakSuite_Settings = {} end

		-- Midnight cleanup
		if TagsTrivialTweaks_Settings ~= nil then TagsTrivialTweaks_Settings = nil end

		app:CreateLinkCopiedFrame()
		app:CreateSettings()
	end
end)

--------------
-- SETTINGS --
--------------

function app:OpenSettings()
	Settings.OpenToCategory(app.Settings:GetID())
end

-- Settings
function app:CreateSettings()
	local category, layout = Settings.RegisterVerticalLayoutCategory(app.Name)
	Settings.RegisterAddOnCategory(category)
	app.Settings = category

	SlackersTweakSuite_SettingsTextMixin = {}
	function SlackersTweakSuite_SettingsTextMixin:Init(initializer)
		local data = initializer:GetData()
		self.LeftText:SetTextToFit(data.leftText)
		self.MiddleText:SetTextToFit(data.middleText)
		self.RightText:SetTextToFit(data.rightText)
	end

	local data = { leftText = L.SETTINGS_VERSION .. " |cffFFFFFF" .. C_AddOns.GetAddOnMetadata(appName, "Version") }
	local text = layout:AddInitializer(Settings.CreateElementInitializer("SlackersTweakSuite_SettingsText", data))
	function text:GetExtent()
		return 14
	end

	local data = { leftText = L.SETTINGS_SUPPORT_TEXTLONG }
	local text = layout:AddInitializer(Settings.CreateElementInitializer("SlackersTweakSuite_SettingsText", data))
	function text:GetExtent()
		return 28 + select(2, string.gsub(data.leftText, "\n", "")) * 12
	end

	StaticPopupDialogs["SLACKERSTWEAKSUITE_URL"] = {
		text = L.SETTINGS_URL_COPY,
		button1 = CLOSE,
		whileDead = true,
		hasEditBox = true,
		editBoxWidth = 240,
		OnShow = function(dialog, data)
			dialog:ClearAllPoints()
			dialog:SetPoint("CENTER", UIParent)

			local editBox = dialog.GetEditBox and dialog:GetEditBox() or dialog.editBox
			editBox:SetText(data)
			editBox:SetAutoFocus(true)
			editBox:HighlightText()
			editBox:SetScript("OnEditFocusLost", function()
				editBox:SetFocus()
			end)
			editBox:SetScript("OnEscapePressed", function()
				dialog:Hide()
			end)
			editBox:SetScript("OnTextChanged", function()
				editBox:SetText(data)
				editBox:HighlightText()
			end)
			editBox:SetScript("OnKeyUp", function(self, key)
				if (IsControlKeyDown() and (key == "C" or key == "X")) then
					dialog:Hide()
					app.LinkCopiedFrame:Show()
					app.LinkCopiedFrame:SetAlpha(1)
					app.LinkCopiedFrame.animation:Play()
				end
			end)
		end,
	}
	local function onSupportButtonClick()
		StaticPopup_Show("SLACKERSTWEAKSUITE_URL", nil, nil, "https://buymeacoffee.com/Slackluster")
	end
	layout:AddInitializer(CreateSettingsButtonInitializer(L.SETTINGS_SUPPORT_TEXT, L.SETTINGS_SUPPORT_BUTTON, onSupportButtonClick, L.SETTINGS_SUPPORT_DESC, true))

	local function onHelpButtonClick()
		StaticPopup_Show("SLACKERSTWEAKSUITE_URL", nil, nil, "https://discord.gg/hGvF59hstx")
	end
	layout:AddInitializer(CreateSettingsButtonInitializer(L.SETTINGS_HELP_TEXT, L.SETTINGS_HELP_BUTTON, onHelpButtonClick, L.SETTINGS_HELP_DESC, true))

	local function onIssuesButtonClick()
		StaticPopup_Show("SLACKERSTWEAKSUITE_URL", nil, nil, "https://github.com/slackluster/SlackersTweakSuite/issues")
	end
	layout:AddInitializer(CreateSettingsButtonInitializer(L.SETTINGS_ISSUES_TEXT, L.SETTINGS_ISSUES_BUTTON, onIssuesButtonClick, L.SETTINGS_ISSUES_DESC, true))

	ProfessionShoppingList_SettingsExpandMixin = CreateFromMixins(SettingsExpandableSectionMixin)

	function ProfessionShoppingList_SettingsExpandMixin:Init(initializer)
		SettingsExpandableSectionMixin.Init(self, initializer)
		self.data = initializer.data
	end

	function ProfessionShoppingList_SettingsExpandMixin:OnExpandedChanged(expanded)
		SettingsInbound.RepairDisplay()
	end

	function ProfessionShoppingList_SettingsExpandMixin:CalculateHeight()
		return 24
	end

	function ProfessionShoppingList_SettingsExpandMixin:OnExpandedChanged(expanded)
		self:EvaluateVisibility(expanded)
        SettingsInbound.RepairDisplay()
	end

	function ProfessionShoppingList_SettingsExpandMixin:EvaluateVisibility(expanded)
		if expanded then
			self.Button.Right:SetAtlas("Options_ListExpand_Right_Expanded", TextureKitConstants.UseAtlasSize)
		else
			self.Button.Right:SetAtlas("Options_ListExpand_Right", TextureKitConstants.UseAtlasSize)
		end
	end

	local function createExpandableSection(layout, name)
		local initializer = CreateFromMixins(SettingsExpandableSectionInitializer)
		local data = { name = name, expanded = false }

		initializer:Init("ProfessionShoppingList_SettingsExpandTemplate", data)
		initializer.GetExtent = ScrollBoxFactoryInitializerMixin.GetExtent

		layout:AddInitializer(initializer)

		return initializer, function()
			return initializer.data.expanded
		end
	end

	local expandInitializer, isExpanded = createExpandableSection(layout, L.SETTINGS_KEYSLASH_TITLE)

		local data = { leftText = "|cffFFFFFF"
			.. "/sts settings",
		middleText =
			L.SETTINGS_SLASH_SETTINGS
		}
		local text = layout:AddInitializer(Settings.CreateElementInitializer("ProfessionShoppingList_SettingsText", data))
		function text:GetExtent()
			return 28 + select(2, string.gsub(data.leftText, "\n", "")) * 12
		end
		text:AddShownPredicate(isExpanded)

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L.GENERAL))

	local variable, name, tooltip = "cursorGuide", L.SETTINGS_CURSORGUIDE_TITLE, L.SETTINGS_CURSORGUIDE_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, false)
	local parentSetting = Settings.CreateCheckbox(category, setting, tooltip)
	setting:SetValueChangedCallback(function()
		app:SetCursorGuideVisibility()
	end)

	local variable, name, tooltip = "cursorGuideCombat", L.SETTINGS_CURSORGUIDE_COMBAT_TITLE, L.SETTINGS_CURSORGUIDE_COMBAT_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	local subSetting = Settings.CreateCheckbox(category, setting, tooltip)
	subSetting:SetParentInitializer(parentSetting, function() return SlackersTweakSuite_Settings["cursorGuide"] end)
	setting:SetValueChangedCallback(function()
		app:SetCursorGuideVisibility()
	end)

	local variable, name, tooltip = "disableAlwaysCompare", L.SETTINGS_COMPARE_TITLE, L.SETTINGS_COMPARE_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)
	setting:SetValueChangedCallback(function()
		app:ToggleAlwaysCompare()
	end)

	local variable, name, tooltip = "backpackCount", L.SETTINGS_SPLITBAG_TITLE, L.SETTINGS_SPLITBAG_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)
	setting:SetValueChangedCallback(function()
		local freeSlots1 = C_Container.GetContainerNumFreeSlots(0) + C_Container.GetContainerNumFreeSlots(1) + C_Container.GetContainerNumFreeSlots(2) + C_Container.GetContainerNumFreeSlots(3) + C_Container.GetContainerNumFreeSlots(4)
		local freeSlots2 = C_Container.GetContainerNumFreeSlots(5)

		if SlackersTweakSuite_Settings["backpackCount"] and C_Container.GetContainerNumSlots(5) ~= 0 then
			MainMenuBarBackpackButtonCount:SetText("(" .. freeSlots1 .. "+" .. freeSlots2 .. ")")
		else
			MainMenuBarBackpackButtonCount:SetText("(" .. freeSlots1 + freeSlots2 .. ")")
		end
	end)

	local variable, name, tooltip = "instantCatalyst", L.SETTINGS_CATALYST, L.SETTINGS_CATALYST_DESC
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	local parentSetting = Settings.CreateCheckbox(category, setting, tooltip)

	local variable, name, tooltip = "instantCatalystTooltip", L.SETTINGS_INSTANT_TOOLTIP,L.SETTINGS_INSTANT_TOOLTIP_DESC
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	local subSetting = Settings.CreateCheckbox(category, setting, tooltip)
	subSetting:SetParentInitializer(parentSetting, function() return SlackersTweakSuite_Settings["instantCatalyst"] end)

	local variable, name, tooltip = "instantVault", L.SETTINGS_VAULT, L.SETTINGS_VAULT_DESC
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	local parentSetting = Settings.CreateCheckbox(category, setting, tooltip)

	local variable, name, tooltip = "instantVaultTooltip", L.SETTINGS_INSTANT_TOOLTIP,L.SETTINGS_INSTANT_TOOLTIP_DESC
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	local subSetting = Settings.CreateCheckbox(category, setting, tooltip)
	subSetting:SetParentInitializer(parentSetting, function() return SlackersTweakSuite_Settings["instantVault"] end)

	local variable, name, tooltip = "vendorAll", L.SETTINGS_VENDOR_ALL, L.SETTINGS_VENDOR_ALL_DESC
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)

	local variable, name, tooltip = "hideGroupRolls", L.SETTINGS_HIDE_LOOT_ROLL_WINDOW, L.SETTINGS_HIDE_LOOT_ROLL_WINDOW_DESC
	local setting = Settings.RegisterAddOnSetting(category, appName.."_"..variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, false)
	local parentSetting = Settings.CreateCheckbox(category, setting, tooltip)

	local variable, name, tooltip = "queueSound", L.SETTINGS_QUEUESOUND_TITLE, L.SETTINGS_QUEUESOUND_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, false)
	Settings.CreateCheckbox(category, setting, tooltip)

	local variable, name, tooltip = "showTokenPrice", L.SETTINGS_SHOWTOKENPRICE_TITLE, L.SETTINGS_SHOWTOKENPRICE_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)

	local variable, name, tooltip = "tokyoDrift", L.SETTINGS_TOKYODRIFT_TITLE, L.SETTINGS_TOKYODRIFT_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, false)
	Settings.CreateCheckbox(category, setting, tooltip)

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L.ADDONS))

	local variable, name, tooltip = "handyNotes", L.SETTINGS_HANDYNOTESFIX_TITLE, L.SETTINGS_HANDYNOTESFIX_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)

	local variable, name, tooltip = "underminePrices", L.SETTINGS_ORIBOSEXCHANGEFIX_TITLE, L.SETTINGS_ORIBOSEXCHANGEFIX_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)
	setting:SetValueChangedCallback(function()
		app:HideOribosMessage()
	end)

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L.HOLIDAYS))

	local variable, name, tooltip = "candySit", L.SETTINGS_HALLOWSIT_TITLE, L.SETTINGS_HALLOWSIT_TOOLTIP
	local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, SlackersTweakSuite_Settings, Settings.VarType.Boolean, name, true)
	Settings.CreateCheckbox(category, setting, tooltip)
end

function app:CreateLinkCopiedFrame()
	app.LinkCopiedFrame= CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
	app.LinkCopiedFrame:SetPoint("CENTER")
	app.LinkCopiedFrame:SetFrameStrata("TOOLTIP")
	app.LinkCopiedFrame:SetHeight(1)
	app.LinkCopiedFrame:SetWidth(1)
	app.LinkCopiedFrame:Hide()

	local string = app.LinkCopiedFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	string:SetPoint("CENTER", app.LinkCopiedFrame, "CENTER", 0, 0)
	string:SetPoint("TOP", app.LinkCopiedFrame, "TOP", 0, 0)
	string:SetJustifyH("CENTER")
	string:SetText(app.IconReady .. " " .. L.SETTINGS_URL_COPIED)

	app.LinkCopiedFrame.animation = app.LinkCopiedFrame:CreateAnimationGroup()
	local fadeOut = app.LinkCopiedFrame.animation:CreateAnimation("Alpha")
	fadeOut:SetFromAlpha(1)
	fadeOut:SetToAlpha(0)
	fadeOut:SetDuration(1)
	fadeOut:SetStartDelay(1)
	fadeOut:SetSmoothing("IN_OUT")
	app.LinkCopiedFrame.animation:SetToFinalAlpha(true)
	app.LinkCopiedFrame.animation:SetScript("OnFinished", function()
		app.LinkCopiedFrame:Hide()
	end)
end
