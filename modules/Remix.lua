-------------------------------------
-- Tag's Trivial Tweaks: Remix.lua --
-------------------------------------

-- Initialisation
local appName, app = ...	-- Returns the addon name and a unique table
local L = app.locales
local LEM = LibStub('LibEditMode')

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app.Queue = {}
		app.RemixArtifactButton()
	end
end)

-----------------------------
-- ARTIFACT ABILITY BUTTON --
-----------------------------

function app.RemixArtifactButton()
	if InCombatLockdown() then
		app.Queue.RemixArtifactButton = true
		return
	else
		app.ButtonSkin = {
			[L.STORM] = "stormwhite-extrabutton",
			[L.AIR] = "air-extrabutton",
			[L.FIRE] = "fire-extrabutton",
			[L.GENERIC] = "generic-extrabutton",
			[L.WATER] = "water-extrabutton",
			[L.GARRISON] = "GarrZoneAbility-Armory",
		}

		if not app.ArtifactAbility then
			app.ArtifactAbility = CreateFrame("Frame", L.ARTIFACT_FRAME, UIParent)
			app.ArtifactAbility:SetSize(256,128)
			app.ArtifactAbility:SetPoint("CENTER", UIParent)

			app.ArtifactAbility.Button = CreateFrame("Button", "ArtifactAbility", app.ArtifactAbility, "SecureActionButtonTemplate")
			app.ArtifactAbility.Button:SetWidth(50)
			app.ArtifactAbility.Button:SetHeight(50)
			app.ArtifactAbility.Button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
			app.ArtifactAbility.Button:SetPoint("CENTER", app.ArtifactAbility)
			app.ArtifactAbility.Button:RegisterForClicks("AnyDown", "AnyUp")
			app.ArtifactAbility.Button:SetScript("OnLeave", function()
				GameTooltip:Hide()
			end)

			app.ArtifactAbility.Frame = CreateFrame("Frame", nil, app.ArtifactAbility.Button)
			app.ArtifactAbility.Frame:SetSize(256,128)
			app.ArtifactAbility.Frame:SetPoint("CENTER", app.ArtifactAbility)
			app.ArtifactAbility.Texture = app.ArtifactAbility.Frame:CreateTexture(nil, "ARTWORK")
			app.ArtifactAbility.Texture:SetAllPoints(app.ArtifactAbility.Frame)
			app.ArtifactAbility.Texture:SetAtlas("stormwhite-extrabutton", true)
			app.ArtifactAbility.Texture:SetVertexColor(0.2, 1, 0.2)

			local defaultPosition = { point = "CENTER", x = 0, y = 0 }

			local function onPositionChanged(frame, layoutName, point, x, y)
				TagsTrivialTweaks_Settings.LEM[layoutName].point = point
				TagsTrivialTweaks_Settings.LEM[layoutName].x = x
				TagsTrivialTweaks_Settings.LEM[layoutName].y = y
			end

			LEM:AddFrame(app.ArtifactAbility, onPositionChanged, defaultPosition)

			LEM:RegisterCallback("enter", function()
				RegisterStateDriver(app.ArtifactAbility, "visibility", "[combat] show; show")
			end)

			LEM:RegisterCallback("exit", function()
				if not app.ArtifactSpell then
					RegisterStateDriver(app.ArtifactAbility, "visibility", "[combat] hide; hide")
				elseif TagsTrivialTweaks_Settings.LEM[LEM:GetActiveLayoutName()].showAlways == false then
					RegisterStateDriver(app.ArtifactAbility, "visibility", "[combat] show; hide")
				else
					RegisterStateDriver(app.ArtifactAbility, "visibility", "[combat] show; show")
				end
			end)

			LEM:RegisterCallback("layout", function(layoutName)
				if not TagsTrivialTweaks_Settings.LEM then
					TagsTrivialTweaks_Settings.LEM = {}
				end
				if not TagsTrivialTweaks_Settings.LEM[layoutName] then
					TagsTrivialTweaks_Settings.LEM[layoutName] = CopyTable(defaultPosition)
				end

				app.ArtifactAbility:ClearAllPoints()
				app.ArtifactAbility:SetPoint(TagsTrivialTweaks_Settings.LEM[layoutName].point, TagsTrivialTweaks_Settings.LEM[layoutName].x, TagsTrivialTweaks_Settings.LEM[layoutName].y)
				app.ArtifactAbility.Texture:SetAtlas(app.ButtonSkin[TagsTrivialTweaks_Settings.LEM[layoutName].style] or "stormwhite-extrabutton", true)
			end)

			LEM:AddFrameSettings(app.ArtifactAbility, {
				{
					name = L.SCALE,
					kind = LEM.SettingType.Slider,
					default = 1,
					get = function(layoutName)
						return TagsTrivialTweaks_Settings.LEM[layoutName].scale
					end,
					set = function(layoutName, value)
						TagsTrivialTweaks_Settings.LEM[layoutName].scale = value
						app.ArtifactAbility:SetScale(value)
					end,
					minValue = 0.1,
					maxValue = 5,
					valueStep = 0.1,
					formatter = function(value)
						return FormatPercentage(value, true)
					end,
				},
				{
					name = "Style",
					kind = LEM.SettingType.Dropdown,
					default = L.STORM,
					values = {
						[1] = { text = L.STORM },
						[2] = { text = L.AIR },
						[3] = { text = L.FIRE },
						[4] = { text = L.GENERIC},
						[5] = { text = L.WATER},
						[6] = { text = L.GARRISON },
					},
					get = function(layoutName)
						return TagsTrivialTweaks_Settings.LEM[layoutName].style
					end,
					set = function(layoutName, value)
						TagsTrivialTweaks_Settings.LEM[layoutName].style = value
						app.ArtifactAbility.Texture:SetAtlas(app.ButtonSkin[value], true)
					end,
				},
				{
					name = L.VISIBLE_OUT_COMBAT,
					kind = LEM.SettingType.Checkbox,
					default = true,
					get = function(layoutName)
						return TagsTrivialTweaks_Settings.LEM[layoutName].showAlways
					end,
					set = function(layoutName, value)
						TagsTrivialTweaks_Settings.LEM[layoutName].showAlways = value
					end,
				}
			})
		end

		if TagsTrivialTweaks_Settings["artifactButton"] then
			local spells = { 1233181, 1233577, 1233775, 1237711, 1251045 }
			app.ArtifactSpell = nil
			for i = 1, #spells do
				if C_SpellBook.IsSpellKnown(spells[i]) then
					app.ArtifactSpell = spells[i]
					break
				end
			end

			if app.ArtifactSpell then
				if LEM:GetActiveLayoutName() and TagsTrivialTweaks_Settings.LEM[LEM:GetActiveLayoutName()].showAlways == false then
					RegisterStateDriver(app.ArtifactAbility, "visibility", "[combat] show; hide")
				else
					RegisterStateDriver(app.ArtifactAbility, "visibility", "[combat] show; show")
				end

				app.ArtifactAbility.Button:SetNormalTexture(C_Spell.GetSpellTexture(app.ArtifactSpell))
				app.ArtifactAbility.Button:SetAttribute("type", "spell")
				local spellName = C_Spell.GetSpellInfo(app.ArtifactSpell).name
				app.ArtifactAbility.Button:SetAttribute("spell1", spellName)

				app.ArtifactAbility.Button:SetScript("OnEnter", function(self)
					GameTooltip:SetOwner(UIParent, "ANCHOR_NONE")
					GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
					GameTooltip:SetSpellByID(app.ArtifactSpell)
					GameTooltip:Show()
				end)

				app.ArtifactAbility.Cooldown = CreateFrame("Cooldown", "ArtifactAbilityCooldown", app.ArtifactAbility.Button, "CooldownFrameTemplate")
				app.ArtifactAbility.Cooldown:SetAllPoints(app.ArtifactAbility.Button)
				app.ArtifactAbility.Cooldown:SetSwipeColor(1, 1, 1)

				C_Timer.After(1, function()
					local startTime = C_Spell.GetSpellCooldown(app.ArtifactSpell).startTime
					local duration = C_Spell.GetSpellCooldown(app.ArtifactSpell).duration
					app.ArtifactAbility.Cooldown:SetCooldown(startTime, duration)
				end)
			else
				RegisterStateDriver(app.ArtifactAbility, "visibility", "[combat] hide; hide")
			end
		else
			RegisterStateDriver(app.ArtifactAbility, "visibility", "[combat] hide; hide")
		end
	end
end

function app.SetArtifactButtonCooldown()
	local spellName = C_Spell.GetSpellInfo(app.ArtifactSpell).name
	local startTime = C_Spell.GetSpellCooldown(spellName).startTime
	local duration = C_Spell.GetSpellCooldown(spellName).duration
	app.ArtifactAbility.Cooldown:Clear()
	app.ArtifactAbility.Cooldown:SetReverse(false)
	app.ArtifactAbility.Cooldown:SetCooldown(startTime, duration)
end

app.Event:Register("UNIT_SPELLCAST_SUCCEEDED", function(unitTarget, castGUID, spellID)
	C_Timer.After(0.1, function()	-- Delay to prevent the ArtifactBuff check from being too early
		if unitTarget == "player" and TagsTrivialTweaks_Settings["artifactButton"] and app.ArtifactSpell and not app.Queue.ArtifactBuff then
			app.SetArtifactButtonCooldown()
		end
	end)
end)

app.Event:Register("SPELL_UPDATE_ICON", function(spellID)
	if TagsTrivialTweaks_Settings["artifactButton"] and app.ArtifactSpell and spellID == app.ArtifactSpell then
		app.ArtifactAbility.Button:SetNormalTexture(C_Spell.GetSpellTexture(app.ArtifactSpell))
		local buff = {}
		for i = 1, 40 do
			if not C_UnitAuras.GetBuffDataByIndex("player", i, "HELPFUL") then
				app.Queue.ArtifactBuff = false
				break
			elseif C_UnitAuras.GetBuffDataByIndex("player", i, "HELPFUL").spellId == app.ArtifactSpell then
				app.Queue.ArtifactBuff = true
				buff = C_UnitAuras.GetBuffDataByIndex("player", i, "HELPFUL")
				break
			else
				app.Queue.ArtifactBuff = false
			end
		end

		if app.Queue.ArtifactBuff then
			local startTime = buff.expirationTime - buff.duration
			local duration = buff.duration
			app.ArtifactAbility.Cooldown:Clear()
			app.ArtifactAbility.Cooldown:SetReverse(true)
			app.ArtifactAbility.Cooldown:SetCooldown(startTime, duration)
		else
			app.SetArtifactButtonCooldown()
		end
	end
end)

app.Event:Register("SPELLS_CHANGED", function()
	app.RemixArtifactButton()
end)

app.Event:Register("PLAYER_REGEN_ENABLED", function()
	if app.Queue.RemixArtifactButton then
		app.Queue.RemixArtifactButton = nil
		app.RemixArtifactButton()
	end
end)
