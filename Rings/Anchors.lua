local module = MageHUD:NewModule("Anchors")

function module:Initialize()
	-- Setup the frames we need
	self.Left = self:CreateRing(false, MageHUDFrame)
	self.Right = self:CreateRing(false, MageHUDFrame)

	self.Left:SetAlpha(0)

	self.Right:SetReversed(true)
	self.Right:SetAlpha(0)
end
