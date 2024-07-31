local spellIdAbsorbAmounts = {
	[17] = 48, -- Power word shield rank 1
	[592] = 94, -- Power word shield rank 2
	[600] = 166, -- Power word shield rank 3
	[3747] = 244, -- Power word shield rank 4
	[6065] = 312, -- Power word shield rank 5
	[6066] = 394, -- Power word shield rank 6
	[10898] = 499, -- Power word shield rank 7
	[10899] = 622, -- Power word shield rank 8
	[10900] = 782, -- Power word shield rank 9
	[10901] = 942, -- Power word shield rank 10

	[11426] = 454, -- lvl 40 ice barrier
	[13031] = 568, -- lvl 46 ice barrier
	[13032] = 699, -- lvl 52 ice barrier
	[13033] = 826, -- lvl 58 ice barrier

	[1463] = 120, -- lvl 20 mana shield
	[8494] = 210, -- lvl 28 mana shield
	[8495] = 300, -- lvl 36 mana shield
	[10191] = 390, -- lvl 44 mana shield
	[10192] = 480, -- lvl 52 mana shield
	[10193] = 570, -- lvl 60 mana shield

	[4077] = 600, -- ice deflector

	[6143] = 165, -- lvl 24 frost Ward
	[8461] = 290, -- lvl 34 frost Ward
	[8462] = 470, -- lvl 44 frost Ward
	[10177] = 675, -- lvl 54 frost Ward
	[28609] = 920, -- lvl 60 frost Ward

	[4057] = 500, -- fire deflector

	[543] = 165, -- lvl 24 fire Ward
	[8457] = 290, -- lvl 34 fire Ward
	[8458] = 470, -- lvl 44 fire Ward
	[10223] = 675, -- lvl 54 fire Ward
	[10225] = 920, -- lvl 60 fire Ward

	-- all protection pots are average values, they absorb a large range of damage
	[7239] = 1800, -- Frost Protection
	[17544] = 2600, -- Greater Frost Protection

	[7233] = 1300, -- Fire Protection
	[17543] = 2600, -- Greater Fire Protection

	[7254] = 1800, -- Nature Protection
	[17546] = 2600, -- Greater Nature Protection

	[7242] = 900, -- Shadow Protection
	[17548] = 2600, -- Greater Shadow Protection

	[17549] = 2600, -- Greater Arcane Protection

	[7245] = 400, -- Holy Protection
	[17545] = 2600, -- Greater Holy Protection

	[29506] = 900, -- Burrower's Shell

	[6229] = 290, -- Shadow Ward
	[11739] = 470, -- Shadow Ward
	[11740] = 675, -- Shadow Ward
	[28610] = 920, -- Shadow Ward

	[7812] = 319, -- Voidwalker sacrifice
	[19438] = 529, -- Voidwalker sacrifice
	[19440] = 794, -- Voidwalker sacrifice
	[19441] = 1124, -- Voidwalker sacrifice
	[19442] = 1503, -- Voidwalker sacrifice
	[19443] = 1931, -- Voidwalker sacrifice
}

local targetedShields = {
	[17] = 44, -- Power word shield rank 1
	[592] = 88, -- Power word shield rank 2
	[600] = 158, -- Power word shield rank 3
	[3747] = 234, -- Power word shield rank 4
	[6065] = 301, -- Power word shield rank 5
	[6066] = 381, -- Power word shield rank 6
	[10898] = 484, -- Power word shield rank 7
	[10899] = 605, -- Power word shield rank 8
	[10900] = 763, -- Power word shield rank 9
	[10901] = 942, -- Power word shield rank 10
}

local spellIdToBuffName = {
	[17] = "Power Word: Shield", -- Power word shield rank 1
	[592] = "Power Word: Shield", -- Power word shield rank 2
	[600] = "Power Word: Shield", -- Power word shield rank 3
	[3747] = "Power Word: Shield", -- Power word shield rank 4
	[6065] = "Power Word: Shield", -- Power word shield rank 5
	[6066] = "Power Word: Shield", -- Power word shield rank 6
	[10898] = "Power Word: Shield", -- Power word shield rank 7
	[10899] = "Power Word: Shield", -- Power word shield rank 8
	[10900] = "Power Word: Shield", -- Power word shield rank 9
	[10901] = "Power Word: Shield", -- Power word shield rank 10

	[11426] = "Ice Barrier", -- lvl 40 ice barrier
	[13031] = "Ice Barrier", -- lvl 46 ice barrier
	[13032] = "Ice Barrier", -- lvl 52 ice barrier
	[13033] = "Ice Barrier", -- lvl 58 ice barrier

	[1463] = "Mana Shield", -- lvl 20 mana shield
	[8494] = "Mana Shield", -- lvl 28 mana shield
	[8495] = "Mana Shield", -- lvl 36 mana shield
	[10191] = "Mana Shield", -- lvl 44 mana shield
	[10192] = "Mana Shield", -- lvl 52 mana shield
	[10193] = "Mana Shield", -- lvl 60 mana shield

	[4077] = "Frost Resistance", -- ice deflector

	[6143] = "Frost Ward", -- lvl 24 frost Ward
	[8461] = "Frost Ward", -- lvl 34 frost Ward
	[8462] = "Frost Ward", -- lvl 44 frost Ward
	[10177] = "Frost Ward", -- lvl 54 frost Ward
	[28609] = "Frost Ward", -- lvl 60 frost Ward

	[4057] = "Fire Resistance", -- fire deflector

	[543] = "Fire Ward", -- lvl 24 fire Ward
	[8457] = "Fire Ward", -- lvl 34 fire Ward
	[8458] = "Fire Ward", -- lvl 44 fire Ward
	[10223] = "Fire Ward", -- lvl 54 fire Ward
	[10225] = "Fire Ward", -- lvl 60 fire Ward

	[7239] = "Frost Protection", -- Frost Protection
	[17544] = "Frost Protection", -- Greater Frost Protection

	[7233] = "Fire Protection", -- Fire Protection
	[17543] = "Fire Protection", -- Greater Fire Protection

	[7254] = "Nature Protection", -- Nature Protection
	[17546] = "Nature Protection", -- Greater Nature Protection

	[7242] = "Shadow Protection", -- Shadow Protection
	[17548] = "Shadow Protection", -- Greater Shadow Protection

	[17549] = "Arcane Protection", -- Greater Arcane Protection

	[7245] = "Holy Protection", -- Holy Protection
	[17545] = "Holy Protection", -- Greater Holy Protection

	[29506] = "The Burrower\'s Shell", -- Burrower's Shell

	[6229] = "Shadow Ward", -- lvl 32
	[11739] = "Shadow Ward", -- lvl 42
	[11740] = "Shadow Ward", -- lvl 52
	[28610] = "Shadow Ward", -- lvl 60

	[7812] = "Sacrifice", -- Voidwalker sacrifice lvl 16
	[19438] = "Sacrifice", -- Voidwalker sacrifice lvl 24
	[19440] = "Sacrifice", -- Voidwalker sacrifice lvl 32
	[19441] = "Sacrifice", -- Voidwalker sacrifice lvl 40
	[19442] = "Sacrifice", -- Voidwalker sacrifice lvl 48
	[19443] = "Sacrifice", -- Voidwalker sacrifice lvl 60
}

local buffNameToShieldTypes = {
	["Mana Shield"] = { "Physical" }, -- special case as it always has lower priority

	["Ice Barrier"] = { "Physical", "Frost", "Fire", "Arcane", "Shadow", "Nature", "Holy" },
	["The Burrower\'s Shell"] = { "Physical", "Frost", "Fire", "Arcane", "Shadow", "Nature", "Holy" },
	["Power Word\: Shield"] = { "Physical", "Frost", "Fire", "Arcane", "Shadow", "Nature", "Holy" },
	["Sacrifice"] = { "Physical", "Frost", "Fire", "Arcane", "Shadow", "Nature", "Holy" },

	["Frost Resistance"] = { "Frost" }, -- frost deflector
	["Fire Resistance"] = { "Fire" }, -- fire deflector

	["Frost Ward"] = { "Frost" },
	["Fire Ward"] = { "Fire" },
	["Shadow Ward"] = { "Shadow" },

	["Frost Protection"] = { "Frost" },
	["Fire Protection"] = { "Fire" },
	["Nature Protection"] = { "Nature" },
	["Shadow Protection"] = { "Shadow" },
	["Arcane Protection"] = { "Arcane" },
	["Holy Protection"] = { "Holy" },
}

local buffNameToColors = {
	-- all
	["Ice Barrier"] = { ["r"] = 1, ["g"] = 1, ["b"] = 1 },
	["The Burrower\'s Shell"] = { ["r"] = 1, ["g"] = 1, ["b"] = 1 },
	["Power Word\: Shield"] = { ["r"] = 1, ["g"] = 1, ["b"] = 1 },
	["Sacrifice"] = { ["r"] = 1, ["g"] = 1, ["b"] = 1 },

	-- physical
	["Mana Shield"] = { ["r"] = 0, ["g"] = 0, ["b"] = 1 },

	-- frost
	["Frost Resistance"] = { ["r"] = 0, ["g"] = 0.9, ["b"] = 1 },
	["Frost Ward"] = { ["r"] = 0, ["g"] = 0.8, ["b"] = 1 },
	["Frost Protection"] = { ["r"] = 0, ["g"] = 0.7, ["b"] = 1 },

	-- fire
	["Fire Resistance"] = { ["r"] = 1, ["g"] = 0.6, ["b"] = 0 },
	["Fire Ward"] = { ["r"] = 1, ["g"] = 0.4, ["b"] = 0 },
	["Fire Protection"] = { ["r"] = 1, ["g"] = 0.2, ["b"] = 0 },

	-- nature
	["Nature Protection"] = { ["r"] = 0, ["g"] = 1, ["b"] = 0 },

	-- shadow
	["Shadow Protection"] = { ["r"] = 0.7, ["g"] = 0, ["b"] = 1 },
	["Shadow Ward"] = { ["r"] = 0.6, ["g"] = 0, ["b"] = 1 },

	-- arcane
	["Arcane Protection"] = { ["r"] = 1, ["g"] = 1, ["b"] = 0 },

	-- holy
	["Holy Protection"] = { ["r"] = 1, ["g"] = 0, ["b"] = 1 },
}

ShieldTracker = {
	last_cast_shield = nil,
	last_cast_string = nil,
	last_absorbed_shield = nil,
	last_absorbed_string = nil,
	current_values = {},
	max_values = {},
	active_shields = {
		Physical = {}, -- shields that block physical damage
		Fire = {}, -- shields that block fire damage
		Frost = {}, -- shields that block frost damage
		Arcane = {}, -- shields that block arcane damage
		Shadow = {}, -- shields that block shadow damage
		Nature = {}, -- shields that block nature damage
		Holy = {}, -- shields that block holy damage
	},
}

function ShieldTracker:GetCurrentValue(buffName)
	return ShieldTracker.current_values[buffName] or 0
end

function ShieldTracker:GetMaxValue(buffName)
	return ShieldTracker.max_values[buffName] or 0
end

function ShieldTracker:GetTotalShield()
	-- loop through all shields and add them up
	local total = 0
	for k, v in pairs(ShieldTracker.current_values) do
		total = total + v
	end
	return total
end

function ShieldTracker:GetTotalMaxShield()
	-- loop through all shields and add them up
	local total = 0
	for k, v in pairs(ShieldTracker.max_values) do
		total = total + v
	end
	return total
end

function ShieldTracker:HasActiveShield(dmgType)
	if next(ShieldTracker.active_shields[dmgType]) ~= nil then
		return true
	end
	-- special case for mana shield
	if dmgType == "Physical" and ShieldTracker.current_values["Mana Shield"] or 0 > 0 then
		return true
	end

	return false
end

function ShieldTracker:GetActiveShield(dmgType)
	if next(ShieldTracker.active_shields[dmgType]) ~= nil then
		return ShieldTracker.active_shields[dmgType][1]
	end
	-- special case for mana shield
	if dmgType == "Physical" and ShieldTracker.current_values["Mana Shield"] > 0 then
		return "Mana Shield"
	end
	return nil
end

function ShieldTracker:GetLastAbsorbed()
	return ShieldTracker.last_absorbed_string
end

function ShieldTracker:GetLastAbsorbedColor()
	if ShieldTracker.last_absorbed_shield then
		return buffNameToColors[ShieldTracker.last_absorbed_shield]
	end
	return nil
end

function ShieldTracker:GetLastCast()
	return ShieldTracker.last_cast_string
end

function ShieldTracker:GetLastCastColor()
	if ShieldTracker.last_cast_shield then
		return buffNameToColors[ShieldTracker.last_cast_shield]
	end
	return nil
end

function ShieldTracker:RemoveActiveShield(dmgType)
	if next(ShieldTracker.active_shields[dmgType]) ~= nil then
		table.remove(ShieldTracker.active_shields[dmgType], 1)
	end
end

function MageHUD:EnableShieldTracking()
	if self.enable then
		return
	end

	-- Register the events we will use
	MageHUD:RegisterEvent("UNIT_CASTEVENT", "CastEvent")
	MageHUD:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "AuraFadeEvent")
	MageHUD:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "DamageEvent")
	MageHUD:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "DamageEvent")
	MageHUD:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "DamageEvent")

	MageHUD:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "SelfDamageEvent") -- self is only the target for spells that hurt yourself

	MageHUD:RegisterEvent("PLAYER_DEAD", "DeathEvent")

	self.enable = true
end

function MageHUD:CastEvent(caster, target, event, spellID, castDuration)
	local absorbAmount = spellIdAbsorbAmounts[spellID]
	if not absorbAmount then
		return
	end

	local _, guid = UnitExists("player")
	if caster ~= guid then
		-- if not a targeted shield cast on player, ignore this cast event
		if not targetedShields[spellID] or target ~= guid then
			return
		end
	else
		-- if cast on another target, ignore this cast event
		if targetedShields[spellID] and target ~= guid then
			return
		end
	end

	local shieldName = spellIdToBuffName[spellID]

	ShieldTracker.current_values[shieldName] = absorbAmount
	ShieldTracker.max_values[shieldName] = absorbAmount

	-- add to active shields for each type in buffNameToShieldTypes
	for _, dmgType in ipairs(buffNameToShieldTypes[shieldName]) do
		table.insert(ShieldTracker.active_shields[dmgType], shieldName)
	end

	ShieldTracker.last_cast_shield = shieldName

	-- shorten shield name for display
	if shieldName == "The Burrower\'s Shell" then
		shieldName = "Burrower Shell"
	end
	ShieldTracker.last_cast_string = "+" .. tostring(absorbAmount) .. " from " .. shieldName

	MageHUD:TriggerEvent("MAGEHUD_SHIELD_UPDATE")
end

function MageHUD:AuraFadeEvent()
	local _, _, buffName = string.find(arg1, "(.-)%s+fades from you") -- shadow protection has 2 spaces ...
	if buffName then
		if ShieldTracker.current_values[buffName] then
			ShieldTracker.current_values[buffName] = nil

			-- remove from all active shields
			for dmgType, shields in pairs(ShieldTracker.active_shields) do
				for i, v in pairs(shields) do
					if v == buffName then
						table.remove(shields, i)
						break
					end
				end
			end

			if ShieldTracker:GetTotalShield() == 0 then
				-- reset all max_values
				for k, v in pairs(ShieldTracker.max_values) do
					ShieldTracker.max_values[k] = nil
				end

				ShieldTracker.last_absorbed_string = nil -- reset last used shield
			end

			MageHUD:TriggerEvent("MAGEHUD_SHIELD_UPDATE")
		end
	end
end

function MageHUD:ParseElementalAbsorbAmount(eventStr)
	-- example eventStr: "You suffer 0 frost damage from Blizzard. (10 absorbed)"
	local _, _, dmgType, amt = string.find(eventStr, "%d+ (%w+) damage from.*%((%d+) absorbed%)")
	if dmgType and amt then
		return dmgType, tonumber(amt)
	end

	_, _, dmgType, amt = string.find(eventStr, "%d+ (%w+) damage.*%((%d+) absorbed%)")
	if dmgType and amt then
		return dmgType, tonumber(amt)
	end
	return nil, nil
end

function MageHUD:ParseAbsorbAmount(eventStr)
	-- example eventStr: "Mob hits you for 0. (10 absorbed)"
	local _, _, amt = string.find(eventStr, "for %d+.*%((%d+) absorbed%)")
	if amt then
		return "Physical", tonumber(amt)
	end

	return nil, nil
end

function MageHUD:DeductShield(dmgType, amt)
	-- determine which shield to deduct from
	local shield = ShieldTracker:GetActiveShield(dmgType)
	local newAmt = amt
	if shield and ShieldTracker.current_values[shield] then
		if ShieldTracker.current_values[shield] > 0 then
			ShieldTracker.last_absorbed_shield = shield
			if amt >= ShieldTracker.current_values[shield] then
				newAmt = amt - ShieldTracker.current_values[shield]
				-- if not a protection potion, remove shield so dmg can be applied to next shield
				if not string.find(shield, "Protection") then
					ShieldTracker.current_values[shield] = 0
					ShieldTracker:RemoveActiveShield(dmgType)
				else
					ShieldTracker.current_values[shield] = 1 -- set to 1 so we can keep the shield active until it fades
					newAmt = 1
					ShieldTracker.last_absorbed_string = "-? to " .. shield
					return newAmt
				end
			else
				ShieldTracker.current_values[shield] = ShieldTracker.current_values[shield] - amt
				newAmt = 0
			end
			ShieldTracker.last_absorbed_string = "-" .. tostring(amt - newAmt) .. " to " .. shield
		end
	end
	return newAmt
end

function MageHUD:SelfDamageEvent()
	-- check that self was the target (hits you for or crits you for)
	if not string.find(arg1, "its you for") then
		return
	end

	return MageHUD:DamageEvent(arg1)
end

function MageHUD:DamageEvent()
	-- check for elemental absorbs first
	local dmgType, amt = self:ParseElementalAbsorbAmount(arg1)
	if not dmgType or not amt then
		-- check for physical absorbs
		dmgType, amt = self:ParseAbsorbAmount(arg1)
	end

	if dmgType and amt then
		local newAmt
		while ShieldTracker:HasActiveShield(dmgType) do
			newAmt = self:DeductShield(dmgType, amt)
			if newAmt == 0 or newAmt == amt then
				-- all dmg absorbed or no shield was deducted from, break out of loop
				-- reason to handle it this way is we don't know exactly how much protection potions will absorb so we need to wait
				-- for aura fade events to remove them
				break
			end
			amt = newAmt
		end
		MageHUD:TriggerEvent("MAGEHUD_SHIELD_UPDATE")
	end
end

function MageHUD:DeathEvent()
	-- reset all values
	ShieldTracker.last_cast_shield = nil;
	ShieldTracker.last_cast_string = nil;
	ShieldTracker.last_absorbed_shield = nil;
	ShieldTracker.last_absorbed_string = nil;
	ShieldTracker.current_values = {};
	ShieldTracker.max_values = {};
	ShieldTracker.active_shields = {
		Physical = {}, -- shields that block physical damage
		Fire = {}, -- shields that block fire damage
		Frost = {}, -- shields that block frost damage
		Arcane = {}, -- shields that block arcane damage
		Shadow = {}, -- shields that block shadow damage
		Nature = {}, -- shields that block nature damage
		Holy = {}, -- shields that block holy damage
	}
	MageHUD:TriggerEvent("MAGEHUD_SHIELD_UPDATE")
end

