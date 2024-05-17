local module = MageHUD:NewModule("ShieldIceBarrier")
local _, _, rev = string.find("$Rev: 11018 $", "([0-9]+)")
module.version = "2.0." .. rev
module.unit = "player"
module.defaults = {
	Enabled = false,
	Outline = true,
	ShowText = true,
	ShowPerc = true,
	ShowLabel = true,
	Side = 1,
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

	self.iceBarrier = 0
	self.maxIceBarrier = 0

	self.ShieldText = self:CreateFontString(self.f, "BACKGROUND", { 150, 15 }, 14, "RIGHT", { 1.0, 1.0, 0.0 }, { "TOPRIGHT", MageHUDFrameText, "TOPLEFT", 0, 0 })
	self.ShieldPerc = self:CreateFontString(self.f, "BACKGROUND", { 40, 14 }, 12, "RIGHT", { 1.0, 1.0, 1.0 }, { "TOPRIGHT", self.ShieldText, "BOTTOMRIGHT", 0, 0 })
	self.Label = self:CreateFontString(self.f, "BACKGROUND", { 150, 15 }, 12, "RIGHT", { 1.0, 1.0, 1.0 }, { "TOPRIGHT", self.ShieldPerc, "BOTTOMRIGHT", 0, 0 })
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
	self.f.pulse = false

	if (UnitIsGhost(self.unit)) then
		self.f:GhostMode(true, self.unit)
	else
		self.f:GhostMode(false, self.unit)

		self.f:Hide()
	end

	self.Label:SetText("Ice Barrier")

	-- Register the events we will use
	self:RegisterEvent("UNIT_CASTEVENT", "CastEvent")

	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "AuraFadeEvent")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "MeleeDamageEvent")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS", "MeleeDamageEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "SpellDamageEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "SpellDamageEvent")


	-- Activate the timers
	self:StartMetro(self.name .. "Alpha")
	self:StartMetro(self.name .. "Fade")
	self:StartMetro(self.name .. "Update")
end

function module:UpdateShield()
	if self.iceBarrier == 0 then
		self.f:Hide()
	else
		local max = self.maxIceBarrier
		local current = self.iceBarrier

		self.f:SetMax(max)
		self.f:SetValue(current)
		self.ShieldText:SetText(current)
		self.ShieldPerc:SetText(floor((current / max) * 100) .. "%")
		self.f:Show()
	end
end

function module:CastEvent(caster, target, event, spellID, castDuration)
	if not iceBarrierSpellIdAbsorbAmounts[spellID] then
		return
	end

	local _, guid = UnitExists("player")
	if caster ~= guid then
		return
	end

	if iceBarrierSpellIdAbsorbAmounts[spellID] then
		self.iceBarrier = iceBarrierSpellIdAbsorbAmounts[spellID]
		self.maxIceBarrier = iceBarrierSpellIdAbsorbAmounts[spellID]
	end

	self:UpdateShield()
end

function module:AuraFadeEvent()
	if string.find(arg1, "Ice Barrier fades from you") then
		self.iceBarrier = 0
		self:UpdateShield()
	end
end

function module:ParseAbsorbAmount(eventStr)
	-- example eventStr: "You suffer 0 frost damage from Blizzard. (10 absorbed)"
	-- example eventStr: "Mob hits you for 0. (10 absorbed)"
	local _, _, amt = string.find(eventStr, "%((%d+) absorbed%)")
	if amt then
		return tonumber(amt)
	end

	return nil
end

function module:DeductIceBarrier(amt)
	if amt > self.iceBarrier then
		amt = amt - self.iceBarrier
		self.iceBarrier = 0
	else
		self.iceBarrier = self.iceBarrier - amt
		amt = 0
	end
	return amt
end

function module:MeleeDamageEvent()
	-- parse absorb amount
	local amt = self:ParseAbsorbAmount(arg1)
	if amt then
		amt = tonumber(amt)
		if self.iceBarrier > 0 then
			amt = self:DeductIceBarrier(amt)
		end
		self:UpdateShield()
	end
end

function module:SpellDamageEvent()
	-- parse absorb amount
	local amt = self:ParseAbsorbAmount(arg1)
	if amt then
		amt = tonumber(amt)
		if self.iceBarrier > 0 then
			self:DeductIceBarrier(amt)
			self:UpdateShield()
		end
	end
end
