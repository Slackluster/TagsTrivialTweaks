--------------------------------------
-- Tag's Trivial Tweaks: Cursor.lua --
--------------------------------------

-- Initialisation
local appName, app = ...

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app.CreateCursorGuide()
		app.SetCursorGuideVisibility()
	end
end)

------------------
-- Cursor Guide --
------------------
-- This feature is recreated from a WeakAura whose author I can't verify, and uses a texture taken from the WeakAuras addon: Square_AlphaGradient.tga

function app.CreateCursorGuide()
	app.CursorGuide = CreateFrame("Frame", "TagsTrivialTweaksCursorGuide", UIParent)
	app.CursorGuide:SetFrameStrata("HIGH")

	local function FollowCursor(self)
		local scale = UIParent:GetEffectiveScale()
		local x, y = GetCursorPosition()
		self:SetPoint("RIGHT", UIParent, "BOTTOMLEFT", x / scale, y / scale)
	end

	local function CreateCursorGradient(width, height, rotation)
		local frame = CreateFrame("Frame", nil, app.CursorGuide)
		frame:SetSize(width, height)

		local tex = frame:CreateTexture(nil, "OVERLAY")
		tex:SetAllPoints()
		tex:SetTexture("Interface\\AddOns\\TagsTrivialTweaks\\assets\\CursorGradient.tga")
		tex:SetAlpha(0.6)
		if rotation then tex:SetRotation(rotation.angle, rotation.pivot) end

		frame:SetScript("OnUpdate", FollowCursor)
		return frame
	end

	local pivotRight = { x = 1, y = 0.5 }
	local width = 3
	local horizontal, vertical = GetPhysicalScreenSize()
	horizontal = horizontal * 1.1
	vertical = vertical * 1.1

	CreateCursorGradient(horizontal, width)
	CreateCursorGradient(horizontal, width, { angle = math.pi, pivot = pivotRight })
	CreateCursorGradient(vertical, width, { angle = -math.pi / 2, pivot = pivotRight })
	CreateCursorGradient(vertical, width, { angle = math.pi / 2, pivot = pivotRight })
end

function app.SetCursorGuideVisibility()
	if InCombatLockdown() then return end

	RegisterAttributeDriver(app.CursorGuide, "state-visibility", "[combat] hide; hide")

	if TagsTrivialTweaks_Settings["cursorGuide"] then
		if TagsTrivialTweaks_Settings["cursorGuideCombat"] then
			RegisterAttributeDriver(app.CursorGuide, "state-visibility", "[combat] show; hide")
		else
			RegisterAttributeDriver(app.CursorGuide, "state-visibility", "[combat] show; show")
		end
	end
end
