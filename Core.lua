-- Create the addon object
MageHUD = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.0", "AceConsole-2.0", "AceDB-2.0", "AceModuleCore-2.0", "AceDebug-2.0", "Metrognome-2.0")

-- Locale object
local L = AceLibrary("AceLocale-2.2"):new("MageHUD_Core")

-- Debugging levels
--   1 Warning
--   2 Info
--   3 Notice
--   4 Off
local debugLevels = { "warn", "info", "notice", "off" }
local d_warn = 1
local d_info = 2
local d_notice = 3

-- Set up Dewdrop and core addon options menu
local dewdrop = AceLibrary:GetInstance("Dewdrop-2.0")
local ddframe

-- Set up database
MageHUD:RegisterDB("MageHUDDB")
MageHUD:RegisterDefaults("profile", {
	Debug = nil,
	Width = 30,
	YLoc = 0,
	FadeFull = 1.0,
	FadeOOC = 1.0,
	FadeIC = 1.0,
	RingVisibility = 3,
	Scale = 1.0,
	AttachTop = false,
})

-- Set up chat commands
MageHUD:RegisterChatCommand({ "/MageHUD", "/ah" }, {
	type = "group",
	name = "MageHUD",
	args = {
		reset = {
			type = "group",
			name = "reset",
			desc = L["CMD_RESET"],
			args = {
				confirm = {
					type = "execute",
					name = "CONFIRM",
					desc = L["CMD_RESET_CONFIRM"],
					func = "ResetOptionsConfirm",
				}
			}
		},
		config = {
			type = "execute",
			name = "config",
			desc = L["CMD_OPTS_FRAME"],
			func = function()
				if not ddframe then
					ddframe = CreateFrame("Frame", nil, UIParent)
					ddframe:SetWidth(2)
					ddframe:SetHeight(2)
					ddframe:SetPoint("BOTTOMLEFT", GetCursorPosition())
					ddframe:SetClampedToScreen(true)
					dewdrop:Register(ddframe, 'dontHook', true, 'children', MageHUD.createDDMenu)
				end
				local x, y = GetCursorPosition()
				ddframe:SetPoint("BOTTOMLEFT", x / UIParent:GetScale(), y / UIParent:GetScale())
				dewdrop:Open(ddframe)
			end,
		},
		debug = {
			type = "text",
			name = "debug",
			desc = L["CMD_OPTS_DEBUG"],
			get = function()
				return debugLevels[MageHUD:GetDebugLevel() or 4]
			end,
			set = function(v)
				if (v == "notice") then
					MageHUD:SetDebugLevel(3)
					MageHUD.db.profile.Debug = 3
				elseif (v == "info") then
					MageHUD:SetDebugLevel(2)
					MageHUD.db.profile.Debug = 2
				elseif (v == "warn") then
					MageHUD:SetDebugLevel(1)
					MageHUD.db.profile.Debug = 1
				elseif (v == "off") then
					MageHUD:SetDebugLevel(nil)
					MageHUD.db.profile.Debug = nil
				end
			end,
			validate = { "off", "warn", "info", "notice" },
			order = -2,
		},
	},
}, "MAGEHUD")

function MageHUD.modDB(action, key, namespace, value)
	if (not action or not key) then
		return
	end
	if (namespace and not value and not MageHUD:HasModule(namespace)) then
		value = namespace
		namespace = nil
	end

	if (action == "toggle") then
		MageHUD:LevelDebug(d_notice, "Toggling key '%s'", key)
		if (namespace) then
			MageHUD:AcquireDBNamespace(namespace).profile[key] = not MageHUD:AcquireDBNamespace(namespace).profile[key]
		else
			MageHUD.db.profile[key] = not MageHUD.db.profile[key]
		end
	elseif (action == "set") then
		MageHUD:LevelDebug(d_notice, "Setting new value for key '%s' = '%s'", key, value)
		if (namespace) then
			MageHUD:AcquireDBNamespace(namespace).profile[key] = tonumber(value)
		else
			MageHUD.db.profile[key] = tonumber(value)
		end
	end

	if (namespace) then
		MageHUD:TriggerEvent("MAGEHUD_MODULE_UPDATE", namespace)
	else
		MageHUD:OnProfileDisable()
		MageHUD:OnProfileEnable()
	end
end

function MageHUD.createDDMenu(level, menu, skipfirst)
	if (level == 1) then
		for k, v in ipairs(MageHUD.dewdrop_menu["L1"]) do
			if (k == 1 and not skipfirst or k > 1) then
				if (type(v) == "table") then
					MageHUD:LevelDebug(d_notice, "Creating button on level %s", level)
					dewdrop:AddLine(unpack(v))
				else
					MageHUD:LevelDebug(d_warn, "Error in createDDMenu in level %d (table expected, got %s)", level, type(v))
				end
			end
		end
	else
		if (MageHUD.dewdrop_menu[menu]) then
			local id
			local val
			local arg3
			local arg4
			local isradio
			for _, v in ipairs(MageHUD.dewdrop_menu[menu]) do
				if (type(v) == "table") then
					MageHUD:LevelDebug(d_notice, "Creating button on level %s in menu %s", level, menu)
					id, val, arg3, arg4, isradio = nil, nil, nil, nil, nil
					for a, b in ipairs(v) do
						if (b == "checked" or b == "sliderValue") then
							id = a + 1
						elseif (b == "isRadio" and v[a + 1]) then
							isradio = true
						elseif (b == "arg2" or b == "sliderArg2") then
							val = v[a + 1]
						elseif (b == "arg3" or b == "sliderArg3") then
							arg3 = v[a + 1]
						elseif (b == "arg4" or b == "sliderArg4") then
							arg4 = v[a + 1]
						end
					end
					if (id) then
						MageHUD:LevelDebug(d_notice, "  Found value on '%d', setting name '%s'", id, val)
						if (isradio) then
							if (arg4) then
								MageHUD:LevelDebug(d_notice, "  Using namespace '%s'", arg3)
								v[id] = (MageHUD:AcquireDBNamespace(arg3).profile[val] == arg4 and true or false)
								MageHUD:LevelDebug(d_notice, "  Value set to '%s'", v[id])
							else
								v[id] = (MageHUD.db.profile[val] == arg3 and true or false)
								MageHUD:LevelDebug(d_notice, "  Value set to '%s'", v[id])
							end
						else
							if (arg3) then
								MageHUD:LevelDebug(d_notice, "  Using namespace '%s'", arg3)
								v[id] = MageHUD:AcquireDBNamespace(arg3).profile[val]
								MageHUD:LevelDebug(d_notice, "  Value set to '%s'", v[id])
							else
								v[id] = MageHUD.db.profile[val]
								MageHUD:LevelDebug(d_notice, "  Value set to '%s'", v[id])
							end
						end
					end
					dewdrop:AddLine(unpack(v))
				else
					MageHUD:LevelDebug(d_warn, "Error in createDDMenu in level %d (table expected, got %s)", level, type(v))
				end
			end
		end
	end
end

function MageHUD:OnInitialize()
	-- Set debug level
	self:SetDebugLevel(self.db.profile.Debug)

	local _, _, rev = string.find("$Rev: 11018 $", "([0-9]+)")
	self.version = self.version .. "." .. rev

	self.ClassColor = {
		["MAGE"] = "00FFFF",
		["WARLOCK"] = "8D54FB",
		["PRIEST"] = "FFFFFF",
		["DRUID"] = "FF8A00",
		["SHAMAN"] = "FF71A8",
		["PALADIN"] = "FF71A8",
		["ROGUE"] = "FFFF00",
		["HUNTER"] = "00FF00",
		["WARRIOR"] = "B39442",
	}

	self:LevelDebug(d_notice, "Creating core addon Dewdrop menu")
	self.dewdrop_menu = {
		["L1"] = {
			{ "text", L["TEXT"]["TITLE"], "isTitle", true },
			{ "text", L["TEXT"]["VERSION"] .. self.version, "notClickable", true },
			{ "text", L["TEXT"]["AUTHOR"] .. self.author, "notClickable", true },
			{},
			{ "text", L["TEXT"]["DISPLAY"], "hasArrow", true, "value", "L2_display" },
			{ "text", L["TEXT"]["FADE"], "hasArrow", true, "value", "L2_fade" },
			{ "text", L["TEXT"]["MISC"], "hasArrow", true, "value", "L2_misc" },
			{},
			{ "text", L["TEXT"]["RINGS"], "isTitle", true },
		},
		["L2_display"] = {
			{
				"text", L["TEXT"]["ATTACHTOP"],
				"tooltipTitle", L["TEXT"]["ATTACHTOP"],
				"tooltipText", L["TOOLTIP"]["ATTACHTOP"],
				"checked", false,
				"func", MageHUD.modDB,
				"arg1", "toggle",
				"arg2", "AttachTop"
			},
			{
				"text", L["TEXT"]["HOVERMSG"],
				"tooltipTitle", L["TEXT"]["HOVERMSG"],
				"tooltipText", L["TOOLTIP"]["HOVERMSG"],
				"checked", false,
				"func", MageHUD.modDB,
				"arg1", "toggle",
				"arg2", "HoverMsg"
			},
			{
				"text", L["TEXT"]["HOVERDELAY"],
				"tooltipTitle", L["TEXT"]["HOVERDELAY"],
				"tooltipText", L["TOOLTIP"]["HOVERDELAY"],
				"hasArrow", true,
				"hasSlider", true,
				"sliderMin", 0,
				"sliderMax", 5,
				"sliderMinText", L["TEXT"]["INSTANT"],
				"sliderMaxText", "5s",
				"sliderStep", 0.5,
				"sliderValue", 0,
				"sliderFunc", MageHUD.modDB,
				"sliderArg1", "set",
				"sliderArg2", "HoverDelay"
			},
		},
		["L2_fade"] = {
			{
				"text", L["TEXT"]["FADE_FULL"],
				"tooltipTitle", L["TEXT"]["FADE_FULL"],
				"tooltipText", L["TOOLTIP"]["FADE_FULL"],
				"hasArrow", true,
				"hasSlider", true,
				"sliderStep", 0.01,
				"sliderIsPercent", true,
				"sliderValue", 0,
				"sliderFunc", MageHUD.modDB,
				"sliderArg1", "set",
				"sliderArg2", "FadeFull"
			},
			{
				"text", L["TEXT"]["FADE_OOC"],
				"tooltipTitle", L["TEXT"]["FADE_OOC"],
				"tooltipText", L["TOOLTIP"]["FADE_OOC"],
				"hasArrow", true,
				"hasSlider", true,
				"sliderStep", 0.01,
				"sliderIsPercent", true,
				"sliderValue", 0,
				"sliderFunc", MageHUD.modDB,
				"sliderArg1", "set",
				"sliderArg2", "FadeOOC"
			},
			{
				"text", L["TEXT"]["FADE_IC"],
				"tooltipTitle", L["TEXT"]["FADE_IC"],
				"tooltipText", L["TOOLTIP"]["FADE_IC"],
				"hasArrow", true,
				"hasSlider", true,
				"sliderStep", 0.01,
				"sliderIsPercent", true,
				"sliderValue", 0,
				"sliderFunc", MageHUD.modDB,
				"sliderArg1", "set",
				"sliderArg2", "FadeIC"
			},
		},
		["L2_misc"] = {
			{
				"text", L["TEXT"]["WIDTH"],
				"tooltipTitle", L["TEXT"]["WIDTH"],
				"tooltipText", L["TOOLTIP"]["WIDTH"],
				"hasArrow", true,
				"hasSlider", true,
				"sliderMin", 30,
				"sliderMax", 100,
				"sliderStep", 1,
				"sliderValue", 0,
				"sliderFunc", MageHUD.modDB,
				"sliderArg1", "set",
				"sliderArg2", "Width"
			},
			{
				"text", L["TEXT"]["YLOC"],
				"tooltipTitle", L["TEXT"]["YLOC"],
				"tooltipText", L["TOOLTIP"]["YLOC"],
				"hasArrow", true,
				"hasSlider", true,
				"sliderMin", -50,
				"sliderMax", 200,
				"sliderStep", 1,
				"sliderValue", 0,
				"sliderFunc", MageHUD.modDB,
				"sliderArg1", "set",
				"sliderArg2", "YLoc"
			},
			{
				"text", L["TEXT"]["SCALE"],
				"tooltipTitle", L["TEXT"]["SCALE"],
				"tooltipText", L["TOOLTIP"]["SCALE"],
				"hasArrow", true,
				"hasSlider", true,
				"sliderStep", 0.01,
				"sliderMax", 2,
				"sliderIsPercent", true,
				"sliderValue", 0,
				"sliderFunc", MageHUD.modDB,
				"sliderArg1", "set",
				"sliderArg2", "Scale"
			},
			{
				"text", L["TEXT"]["RINGVIS"],
				"tooltipTitle", L["TEXT"]["RINGVIS"],
				"tooltipText", L["TOOLTIP"]["RINGVIS"],
				"hasArrow", true,
				"value", "L3_ringvis"
			},
		},
		["L3_ringvis"] = {
			{
				"text", L["TEXT"]["RINGVIS_1"],
				"tooltipTitle", L["TEXT"]["RINGVIS_1"],
				"tooltipText", L["TOOLTIP"]["RINGVIS_1"],
				"isRadio", true,
				"checked", true,
				"func", MageHUD.modDB,
				"arg1", "set",
				"arg2", "RingVisibility",
				"arg3", 1
			},
			{
				"text", L["TEXT"]["RINGVIS_2"],
				"tooltipTitle", L["TEXT"]["RINGVIS_2"],
				"tooltipText", L["TOOLTIP"]["RINGVIS_2"],
				"isRadio", true,
				"checked", false,
				"func", MageHUD.modDB,
				"arg1", "set",
				"arg2", "RingVisibility",
				"arg3", 2
			},
			{
				"text", L["TEXT"]["RINGVIS_3"],
				"tooltipTitle", L["TEXT"]["RINGVIS_3"],
				"tooltipText", L["TOOLTIP"]["RINGVIS_3"],
				"isRadio", true,
				"checked", false,
				"func", MageHUD.modDB,
				"arg1", "set",
				"arg2", "RingVisibility",
				"arg3", 3
			},
		},
	}

	-- Taken from Moog_Hud
	self.RepColor = { "FF4444", "DD4444", "DD7744", "BB9944", "44DD44", "55EE44", "66FF44" }

	self:TriggerEvent("MAGEHUD_LOADED")
	self:LevelDebug(d_info, "MageHUD has been initialized.")
end

function MageHUD:OnEnable()
	self:LevelDebug(d_notice, "Registering events")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "EventHandler")

	self:RegisterEvent("PLAYER_ENTER_COMBAT", "CombatStatus")
	self:RegisterEvent("PLAYER_LEAVE_COMBAT", "CombatStatus")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CombatStatus")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CombatStatus")

	self:OnProfileEnable()

	self.Enabled = true

	MageHUDFrame:Show()
	self:LevelDebug(d_notice, "Triggering ring enable event")
	self:TriggerEvent("MAGEHUD_MODULE_ENABLE")
	self:LevelDebug(d_info, "MageHUD is now enabled")
end

function MageHUD:OnDisable()
	self:LevelDebug(d_notice, "Triggering ring disable event")
	self:TriggerEvent("MAGEHUD_MODULE_DISABLE")

	-- Hide frame
	MageHUDFrame:Hide()

	self.Enabled = false
	self:LevelDebug(d_info, "MageHUD is now disabled")
end

function MageHUD:OnProfileEnable()
	self:LevelDebug(d_notice, "Positioning ring anchors. Width: " .. self.db.profile.Width)
	-- Position the HUD according to user settings
	if (self:HasModule("Anchors")) then
		self:GetModule("Anchors").Left:ClearAllPoints()
		self:GetModule("Anchors").Left:SetPoint("TOPLEFT", MageHUDFrame, "TOPLEFT", 0 - self.db.profile.Width, 0)
		self:GetModule("Anchors").Right:ClearAllPoints()
		self:GetModule("Anchors").Right:SetPoint("TOPLEFT", MageHUDFrame, "TOPRIGHT", self.db.profile.Width, 0)
	end

	self:LevelDebug(d_notice, "Position frame. YLoc: " .. self.db.profile.YLoc)
	MageHUDFrame:ClearAllPoints()
	MageHUDFrame:SetPoint("CENTER", WorldFrame, "CENTER", 0, self.db.profile.YLoc)

	self:LevelDebug(d_notice, "Setting scale. Scale: " .. self.db.profile.Scale)
	-- Scale the HUD according to user settings.
	MageHUDFrame:SetScale(self.db.profile.Scale)

	-- Set initial combat flags
	self.PlayerIsInCombat = false
	self.PlayerIsRegenOn = true
	self.PetIsInCombat = false
end

function MageHUD:OnProfileDisable()
	self:LevelDebug(d_notice, "Unregistering events")
	if (self:IsEventRegistered("UNIT_HEALTH")) then
		self:UnregisterEvent("UNIT_HEALTH")
	end
	if (self:IsEventRegistered("UNIT_MAXHEALTH")) then
		self:UnregisterEvent("UNIT_MAXHEALTH")
	end

	if (self:IsEventRegistered("UNIT_MANA")) then
		self:UnregisterEvent("UNIT_MANA")
	end

	if (self:IsEventRegistered("UNIT_MAXMANA")) then
		self:UnregisterEvent("UNIT_MAXMANA")
	end

	if (self:IsEventRegistered("UNIT_AURA")) then
		self:UnregisterEvent("UNIT_AURA")
	end

	if (self:IsEventRegistered("UNIT_CASTEVENT")) then
		self:UnregisterEvent("UNIT_CASTEVENT")
	end

	if (self:IsEventRegistered("CHAT_MSG_SPELL_AURA_GONE_SELF")) then
		self:UnregisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	end

	if (self:IsEventRegistered("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS")) then
		self:UnregisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS")
	end

	if (self:IsEventRegistered("CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS")) then
		self:UnregisterEvent("CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS")
	end

	if (self:IsEventRegistered("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE")) then
		self:UnregisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE")
	end

	if (self:IsEventRegistered("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")) then
		self:UnregisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
	end

	self:LevelDebug(d_notice, "Hiding frames")
end

function MageHUD:ResetOptionsConfirm()
	self:ResetDB("profile")
	self:OnProfileDisable()
	self:OnProfileEnable()
	self:TriggerEvent("MAGEHUD_MODULE_UPDATE")
	self:Print(L["TEXT"]["RESET_CONFIRM"])
end

function MageHUD:SetAuraTooltip(this)
	if (not this:IsVisible()) then
		return
	end
	GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
	local unit = this.unit
	if (this.isdebuff == 1) then
		GameTooltip:SetUnitDebuff(unit, this:GetID())
	else
		GameTooltip:SetUnitBuff(unit, this:GetID())
	end
end

function MageHUD:EventHandler()
	if (event == "PLAYER_ENTERING_WORLD") then
		self.PlayerIsInCombat = false
		self.PlayerIsRegenOn = true
	end
end

function MageHUD:CombatStatus()
	self:LevelDebug(d_info, "CombatStatus: event = " .. event)
	if (event == "PLAYER_ENTER_COMBAT" or event == "PLAYER_REGEN_DISABLED") then
		self.PlayerIsInCombat = true
		if (event == "PLAYER_REGEN_DISABLED") then
			self.PlayerIsRegenOn = false
		end
	elseif (event == "PLAYER_LEAVE_COMBAT" or event == "PLAYER_REGEN_ENABLED") then
		if (event == "PLAYER_LEAVE_COMBAT" and self.PlayerIsRegenOn) then
			self.PlayerIsInCombat = false
		elseif (event == "PLAYER_REGEN_ENABLED") then
			self.PlayerIsInCombat = false
			self.PlayerIsRegenOn = true
		end
	elseif (event == "PET_ATTACK_START") then
		self.PetIsInCombat = true
	elseif (event == "PET_ATTACK_STOP") then
		self.PetIsInCombat = false
	end
end

function MageHUD:UpdateFonts(tbl)
	local update = false
	for k, v in pairs(tbl) do
		if (type(v) == "table") then
			if (v.GetFont) then
				local fontName, fontSize, fontFlags = v:GetFont()
				if (fontName) then
					self:LevelDebug(d_info, "UpdateFonts: fontName = %s, localeFont = %s", fontName, L "FONT")
				end
				if (fontName and not string.find(fontName, L "FONT")) then
					v:SetFont("Fonts\\" .. L["FONT"], fontSize, fontFlags)
					update = true
				end
			end
			self:UpdateFonts(v)
		end
	end
	if (update) then
		self:LevelDebug(d_notice, "Fonts updated")
	end
end
