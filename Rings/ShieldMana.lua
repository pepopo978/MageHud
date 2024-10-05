local module = MageHUD:NewModule("ShieldMana")
local LST = AceLibrary("AceLocale-2.0"):new("MageHUD_ShieldTracker")
local _, _, rev = string.find("$Rev: 11018 $", "([0-9]+)")
module.version = "2.0." .. rev
module.unit = "player"
module.defaults = {
	Enabled = false,
	Outline = true,
	ShowText = true,
	ShowPerc = true,
	ShowLabel = true,
	Side = 2,
	Level = 0,
}
module.options = {
	{ name = "ShowText", text = "SHOWTEXT", tooltip = "SHOWTEXT" },
	{ name = "ShowPerc", text = "SHOWPERC", tooltip = "SHOWPERC" },
	{ name = "ShowLabel", text = "SHOWLABEL", tooltip = "SHOWLABEL" },
	attach = true,
}
module.localized = true

function module:Initialize()
	-- Setup the frame we need
	self.f = self:CreateRing(true, MageHUDFrame)

	self.f:UpdateColor({ ["r"] = 0, ["g"] = 0, ["b"] = 1 })

	self.ShieldText = self:CreateFontString(self.f, "BACKGROUND", { 150, 15 }, 14, "LEFT", { 1.0, 1.0, 0.0 }, { "TOPLEFT", MageHUDFrameText, "TOPRIGHT", 0, -35 })
	self.ShieldPerc = self:CreateFontString(self.f, "BACKGROUND", { 40, 14 }, 12, "LEFT", { 1.0, 1.0, 1.0 }, { "TOPLEFT", self.ShieldText, "BOTTOMLEFT", 0, 0 })
	self.Label = self:CreateFontString(self.f, "BACKGROUND", { 150, 15 }, 12, "LEFT", { 1.0, 1.0, 1.0 }, { "TOPLEFT", self.ShieldPerc, "BOTTOMLEFT", 0, 0 })
end

function module:Update()
	if (self.db.profile.ShowText) then
		self.ShieldText:Show()
	else
		self.ShieldText:Hide()
	end

	if (self.db.profile.ShowPerc) then
		self.ShieldPerc:Show()
	else
		self.ShieldPerc:Hide()
	end

	if (self.db.profile.ShowLabel) then
		self.Label:Show()
	else
		self.Label:Hide()
	end

	if (self.db.profile.Outline) then
		self.f.BG:Show()
	else
		self.f.BG:Hide()
	end

	-- Clear all points for the ring
	self.f:ClearAllPoints()
	self.f:SetValue(0)
	if (self.db.profile.Side == 1) then
		-- Attach to left side
		self.f:SetPoint("TOPLEFT", self.parent:GetModule("Anchors").Left, "TOPLEFT", self.db.profile.Level * -15, 0)
		self.f.BG:SetReversed(false)
		self.f:SetReversed(false)
	else
		-- Attach to right side
		self.f:SetPoint("TOPRIGHT", self.parent:GetModule("Anchors").Right, "TOPRIGHT", self.db.profile.Level * 15, 0)
		self.f.BG:SetReversed(true)
		self.f:SetReversed(true)
	end
	self.f.BG:SetAngle(180)
end

function module:Enable()
	MageHUD:EnableShieldTracking()

	self.f.pulse = false

	if (UnitIsGhost(self.unit)) then
		self.f:GhostMode(true, self.unit)
	else
		self.f:GhostMode(false, self.unit)

		self.f:Hide()
	end

	self.Label:SetText(LST["Mana Shield"])

	-- Register the events we will use
	self:RegisterEvent("MAGEHUD_SHIELD_UPDATE", "UpdateShield")

	-- Activate the timers
	self:StartMetro(self.name .. "Alpha")
	self:StartMetro(self.name .. "Fade")
	self:StartMetro(self.name .. "Update")
end

function module:UpdateShield()
	local current = ShieldTracker.current_values[LST["Mana Shield"]]

	if not current or current == 0 then
		self.f:Hide()
	else
		local max = ShieldTracker.max_values[LST["Mana Shield"]]

		self.f:SetMax(max)
		self.f:SetValue(current)
		self.ShieldText:SetText(current)
		self.ShieldPerc:SetText(floor((current / max) * 100) .. "%")
		self.f:Show()
	end
end
