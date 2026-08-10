-----------------------------------------
-- Slacker's Tweak Suite: Settings.lua --
-----------------------------------------

local appName, app = ...
local api = app.api
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		SlackersTweakSuite_Settings = SlackersTweakSuite_Settings or {}
		app.Settings = SlackersTweakSuite_Settings

		app:CreateSettings()
	end
end)

--------------
-- SETTINGS --
--------------

function app:OpenSettings()
	if InCombatLockdown() then
		app:Print(ERR_AFFECTING_COMBAT..".")
	else
		Settings.OpenToCategory(app.SettingsCategory:GetID())
	end
end

function app:CreateSettings()
	-- Helper functions
	app.LinkCopiedFrame = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
	app.LinkCopiedFrame:SetPoint("CENTER")
	app.LinkCopiedFrame:SetFrameStrata("TOOLTIP")
	app.LinkCopiedFrame:SetHeight(1)
	app.LinkCopiedFrame:SetWidth(1)
	app.LinkCopiedFrame:Hide()

	local text = app.LinkCopiedFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	text:SetPoint("CENTER", app.LinkCopiedFrame, "CENTER")
	text:SetPoint("TOP", app.LinkCopiedFrame, "TOP")
	text:SetJustifyH("CENTER")
	text:SetText(app.IconReady .. " " .. L.SETTINGS_URL_COPIED)

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
		OnHide = function(dialog)
			local editBox = dialog.GetEditBox and dialog:GetEditBox() or dialog.editBox
			editBox:SetScript("OnEditFocusLost", nil)
			editBox:SetScript("OnEscapePressed", nil)
			editBox:SetScript("OnTextChanged", nil)
			editBox:SetScript("OnKeyUp", nil)
			editBox:SetText("")
		end,
	}

	SlackersTweakSuite_SettingsTextMixin = {}
	function SlackersTweakSuite_SettingsTextMixin:Init(initializer)
		local data = initializer:GetData()
		self.LeftText:SetTextToFit(data.leftText)
		self.MiddleText:SetTextToFit(data.middleText)
		self.RightText:SetTextToFit(data.rightText)

		SettingsPanel.Container.SettingsList.Header.Title:SetText(CreateSimpleTextureMarkup(app.Icon, 16, 16) .. " " .. app.NameLong)
	end

	SlackersTweakSuite_SettingsExpandMixin = CreateFromMixins(SettingsExpandableSectionMixin)

	function SlackersTweakSuite_SettingsExpandMixin:Init(initializer)
		SettingsExpandableSectionMixin.Init(self, initializer)
		self.data = initializer.data
	end

	function SlackersTweakSuite_SettingsExpandMixin:OnExpandedChanged(expanded)
		SettingsInbound.RepairDisplay()
	end

	function SlackersTweakSuite_SettingsExpandMixin:CalculateHeight()
		return 24
	end

	function SlackersTweakSuite_SettingsExpandMixin:OnExpandedChanged(expanded)
		self:EvaluateVisibility(expanded)
		SettingsInbound.RepairDisplay()
	end

	function SlackersTweakSuite_SettingsExpandMixin:EvaluateVisibility(expanded)
		if expanded then
			self.Button.Right:SetAtlas("Options_ListExpand_Right_Expanded", TextureKitConstants.UseAtlasSize)
		else
			self.Button.Right:SetAtlas("Options_ListExpand_Right", TextureKitConstants.UseAtlasSize)
		end
	end

	local category, layout

	local function button(name, buttonName, description, func)
		layout:AddInitializer(CreateSettingsButtonInitializer(name, buttonName, func, description, true))
	end

	local function checkbox(variable, name, description, default, callback, parentSetting, parentCheckbox)
		local setting = Settings.RegisterAddOnSetting(category, appName .. "_" .. variable, variable, app.Settings, type(default), name, default)
		local checkbox = Settings.CreateCheckbox(category, setting, description)

		if parentSetting and parentCheckbox then
			checkbox:SetParentInitializer(parentCheckbox, function() return parentSetting:GetValue() end)
			if callback then
				parentSetting:SetValueChangedCallback(callback)
			end
		elseif callback then
			setting:SetValueChangedCallback(callback)
		end

		return setting, checkbox
	end

	local function checkboxDropdown(cbVariable, cbName, description, cbDefaultValue, ddVariable, ddDefaultValue, options, callback)
		local cbSetting = Settings.RegisterAddOnSetting(category, appName.."_"..cbVariable, cbVariable, app.Settings, type(cbDefaultValue), cbName, cbDefaultValue)
		local ddSetting = Settings.RegisterAddOnSetting(category, appName.."_"..ddVariable, ddVariable, app.Settings, type(ddDefaultValue), "", ddDefaultValue)
		local function GetOptions()
			local container = Settings.CreateControlTextContainer()
			for _, option in ipairs(options) do
				container:Add(option.value, option.name, option.description)
			end
			return container:GetData()
		end

		local initializer = CreateSettingsCheckboxDropdownInitializer(cbSetting, cbName, description, ddSetting, GetOptions, "")
		layout:AddInitializer(initializer)

		if callback then
			cbSetting:SetValueChangedCallback(callback)
			ddSetting:SetValueChangedCallback(callback)
		end
	end

	local function dropdown(variable, name, description, default, options, callback)
		local setting = Settings.RegisterAddOnSetting(category, appName.."_"..variable, variable, app.Settings, type(default), name, default)
		local function GetOptions()
			local container = Settings.CreateControlTextContainer()
			for _, option in ipairs(options) do
				container:Add(option.value, option.name, option.description)
			end
			return container:GetData()
		end
		Settings.CreateDropdown(category, setting, GetOptions, description)
		if callback then
			setting:SetValueChangedCallback(callback)
		end
	end

	local function expandableHeader(name)
		local initializer = CreateFromMixins(SettingsExpandableSectionInitializer)
		local data = { name = name, expanded = false }

		initializer:Init("SlackersTweakSuite_SettingsExpandTemplate", data)
		initializer.GetExtent = ScrollBoxFactoryInitializerMixin.GetExtent

		layout:AddInitializer(initializer)

		return initializer, function()
			return initializer.data.expanded
		end
	end

	local function header(name)
		layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(name))
	end

	local function keybind(name, isExpanded)
		local action = name
		local bindingIndex = C_KeyBindings.GetBindingIndex(action)
		local initializer = CreateKeybindingEntryInitializer(bindingIndex, true)
		local keybind = layout:AddInitializer(initializer)
		if isExpanded ~= nil then keybind:AddShownPredicate(isExpanded) end
	end

	local function text(leftText, middleText, rightText, customExtent, isExpanded)
		local data = { leftText = leftText, middleText = middleText, rightText = rightText }
		local text = layout:AddInitializer(Settings.CreateElementInitializer("SlackersTweakSuite_SettingsText", data))
		function text:GetExtent()
			if customExtent then return customExtent end
			return 28 + select(2, string.gsub(data.leftText, "\n", "")) * 12
		end
		if isExpanded ~= nil then text:AddShownPredicate(isExpanded) end
	end

	-- Settings
	category, layout = Settings.RegisterVerticalLayoutCategory(app.Name)
	Settings.RegisterAddOnCategory(category)
	app.SettingsCategory = category

	text(L.SETTINGS_VERSION .. " |cffFFFFFF" .. C_AddOns.GetAddOnMetadata(appName, "Version"), nil, nil, 14)
	text(L.SETTINGS_SUPPORT_TEXTLONG)
	button(L.SETTINGS_SUPPORT_TEXT, L.SETTINGS_SUPPORT_BUTTON, L.SETTINGS_SUPPORT_DESC, function() StaticPopup_Show("SLACKERSTWEAKSUITE_URL", nil, nil, "https://buymeacoffee.com/Slackluster") end)
	button(L.SETTINGS_HELP_TEXT, L.SETTINGS_HELP_BUTTON, L.SETTINGS_HELP_DESC, function() StaticPopup_Show("SLACKERSTWEAKSUITE_URL", nil, nil, "https://discord.gg/hGvF59hstx") end)

	local _, isExpanded = expandableHeader(L.SETTINGS_KEYSLASH_TITLE)

		local leftText = { "|cffFFFFFF" ..
			"/sts settings" }
		local middleText = {
			L.SLASH_OPEN_SETTINGS }
		leftText = table.concat(leftText, "\n\n")
		middleText = table.concat(middleText, "\n\n")
		text(leftText, middleText, nil, nil, isExpanded)

	header(L.GENERAL)

	local parentSetting, parentCheckbox = checkbox("cursorGuide", L.SETTINGS_CURSORGUIDE_TITLE, L.SETTINGS_CURSORGUIDE_DESC, false, function() app:SetCursorGuideVisibility() end)

	checkbox("cursorGuideCombat", L.SETTINGS_CURSORGUIDE_COMBAT_TITLE, L.SETTINGS_CURSORGUIDE_COMBAT_DESC, true, function() app:SetCursorGuideVisibility() end, parentSetting, parentCheckbox)

	checkbox("skipSeenCinematics", L.SETTINGS_SKIPCINEMATICS_TITLE .. app.IconNew, L.SETTINGS_SKIPCINEMATICS_TITLE_DESC, false)

	header(L.INVENTORY)

	checkbox("disableAlwaysCompare", L.SETTINGS_COMPARE_TITLE, L.SETTINGS_COMPARE_DESC, true, function() app:ToggleAlwaysCompare() end)

	checkbox("showTokenPrice", L.SETTINGS_SHOWTOKENPRICE_TITLE, L.SETTINGS_SHOWTOKENPRICE_DESC, true)

	checkbox("backpackCount", L.SETTINGS_SPLITBAG_TITLE, L.SETTINGS_SPLITBAG_DESC, true, function() app:SplitBackpackCount() end)

	header(L.LOOT)

	local parentSetting, parentCheckbox = checkbox("instantCatalyst", L.SETTINGS_CATALYST, L.SETTINGS_CATALYST_DESC, true)

	checkbox("instantCatalystTooltip", L.SETTINGS_INSTANT_TOOLTIP, L.SETTINGS_INSTANT_TOOLTIP_DESC, true, nil, parentSetting, parentCheckbox)

	local parentSetting, parentCheckbox = checkbox("instantVault", L.SETTINGS_VAULT, L.SETTINGS_VAULT_DESC, true)

	checkbox("instantVaultTooltip", L.SETTINGS_INSTANT_TOOLTIP,L.SETTINGS_INSTANT_TOOLTIP_DESC, true, nil, parentSetting, parentCheckbox)

	checkbox("vendorAll", L.SETTINGS_VENDOR_ALL, L.SETTINGS_VENDOR_ALL_DESC, true)

	checkbox("hideGroupRolls", L.SETTINGS_HIDE_LOOT_ROLL_WINDOW, L.SETTINGS_HIDE_LOOT_ROLL_WINDOW_DESC, false)

	header(L.SOUND)

	checkbox("queueSound", L.SETTINGS_QUEUESOUND_TITLE, L.SETTINGS_QUEUESOUND_DESC, false)

	checkbox("readyCheckSound", L.SETTINGS_READYCHECKSOUND_TITLE .. app.IconNew, L.SETTINGS_READYCHECKSOUND_DESC, false)

	checkbox("countdownSound", L.SETTINGS_COUNTDOWNSOUND_TITLE .. app.IconNew, L.SETTINGS_COUNTDOWNSOUND_DESC, false)

	checkbox("tokyoDrift", L.SETTINGS_TOKYODRIFT_TITLE, L.SETTINGS_TOKYODRIFT_DESC, false)

	header(L.ADDONS)

	checkbox("handyNotes", L.SETTINGS_HANDYNOTESFIX_TITLE, L.SETTINGS_HANDYNOTESFIX_DESC, true)

	checkbox("ahPriceTooltip", L.SETTINGS_AHPRICETOOLTIP_TITLE .. app.IconNew, L.SETTINGS_AHPRICETOOLTIP_DESC, true, function() app:HideOribosMessage() end)

	header(L.HOLIDAYS)

	checkbox("candySit", L.SETTINGS_HALLOWSIT_TITLE, L.SETTINGS_HALLOWSIT_DESC, true)
end
