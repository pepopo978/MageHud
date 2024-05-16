--
-- MageHUDFu -- a FuBar button interface to MageHUD
--

-- Only load if MageHUD is already loaded
if not MageHUD then return end

local dewdrop = AceLibrary("Dewdrop-2.0")

MageHUDFu = AceLibrary("AceAddon-2.0"):new("AceDB-2.0", "FuBarPlugin-2.0")
MageHUDFu:RegisterDB("MageHUDDB")
MageHUDFu.hasIcon = "Interface\\Icons\\Ability_Hunter_Pathfinding"
MageHUDFu.cannotDetachTooltip = true
MageHUDFu.independentProfile = true
MageHUDFu.hideWithoutStandby = true

function MageHUDFu:OnMenuRequest(level, value, x, valueN_1, valueN_2, valueN_3, valueN_4)
	MageHUD.createDDMenu(level, value, true)
	if(level == 1) then
		dewdrop:AddLine()
	end
end
