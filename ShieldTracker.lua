local LST = AceLibrary("AceLocale-2.0"):new("MageHUD_ShieldTracker")
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

local petSacrifice = {
	[7812] = 319, -- Voidwalker sacrifice
	[19438] = 529, -- Voidwalker sacrifice
	[19440] = 794, -- Voidwalker sacrifice
	[19441] = 1124, -- Voidwalker sacrifice
	[19442] = 1503, -- Voidwalker sacrifice
	[19443] = 1931, -- Voidwalker sacrifice
}

local spellIdToBuffName = {
	[17] = LST["Power Word: Shield"], -- Power word shield rank 1
	[592] = LST["Power Word: Shield"], -- Power word shield rank 2
	[600] = LST["Power Word: Shield"], -- Power word shield rank 3
	[3747] = LST["Power Word: Shield"], -- Power word shield rank 4
	[6065] = LST["Power Word: Shield"], -- Power word shield rank 5
	[6066] = LST["Power Word: Shield"], -- Power word shield rank 6
	[10898] = LST["Power Word: Shield"], -- Power word shield rank 7
	[10899] = LST["Power Word: Shield"], -- Power word shield rank 8
	[10900] = LST["Power Word: Shield"], -- Power word shield rank 9
	[10901] = LST["Power Word: Shield"], -- Power word shield rank 10

	[11426] = LST["Ice Barrier"], -- lvl 40 ice barrier
	[13031] = LST["Ice Barrier"], -- lvl 46 ice barrier
	[13032] = LST["Ice Barrier"], -- lvl 52 ice barrier
	[13033] = LST["Ice Barrier"], -- lvl 58 ice barrier

	[1463] = LST["Mana Shield"], -- lvl 20 mana shield
	[8494] = LST["Mana Shield"], -- lvl 28 mana shield
	[8495] = LST["Mana Shield"], -- lvl 36 mana shield
	[10191] = LST["Mana Shield"], -- lvl 44 mana shield
	[10192] = LST["Mana Shield"], -- lvl 52 mana shield
	[10193] = LST["Mana Shield"], -- lvl 60 mana shield

	[4077] = LST["Frost Resistance"], -- ice deflector

	[6143] = LST["Frost Ward"], -- lvl 24 frost Ward
	[8461] = LST["Frost Ward"], -- lvl 34 frost Ward
	[8462] = LST["Frost Ward"], -- lvl 44 frost Ward
	[10177] = LST["Frost Ward"], -- lvl 54 frost Ward
	[28609] = LST["Frost Ward"], -- lvl 60 frost Ward

	[4057] = LST["Fire Resistance"], -- fire deflector

	[543] = LST["Fire Ward"], -- lvl 24 fire Ward
	[8457] = LST["Fire Ward"], -- lvl 34 fire Ward
	[8458] = LST["Fire Ward"], -- lvl 44 fire Ward
	[10223] = LST["Fire Ward"], -- lvl 54 fire Ward
	[10225] = LST["Fire Ward"], -- lvl 60 fire Ward

	[7239] = LST["Frost Protection"], -- Frost Protection
	[17544] = LST["Frost Protection"], -- Greater Frost Protection

	[7233] = LST["Fire Protection"], -- Fire Protection
	[17543] = LST["Fire Protection"], -- Greater Fire Protection

	[7254] = LST["Nature Protection"], -- Nature Protection
	[17546] = LST["Nature Protection"], -- Greater Nature Protection

	[7242] = LST["Shadow Protection"], -- Shadow Protection
	[17548] = LST["Shadow Protection"], -- Greater Shadow Protection

	[17549] = LST["Arcane Protection"], -- Greater Arcane Protection

	[7245] = LST["Holy Protection"], -- Holy Protection
	[17545] = LST["Holy Protection"], -- Greater Holy Protection

	[29506] = LST["The Burrower\'s Shell"], -- Burrower's Shell

	[6229] = LST["Shadow Ward"], -- lvl 32
	[11739] = LST["Shadow Ward"], -- lvl 42
	[11740] = LST["Shadow Ward"], -- lvl 52
	[28610] = LST["Shadow Ward"], -- lvl 60

	[7812] = LST["Sacrifice"], -- Voidwalker sacrifice lvl 16
	[19438] = LST["Sacrifice"], -- Voidwalker sacrifice lvl 24
	[19440] = LST["Sacrifice"], -- Voidwalker sacrifice lvl 32
	[19441] = LST["Sacrifice"], -- Voidwalker sacrifice lvl 40
	[19442] = LST["Sacrifice"], -- Voidwalker sacrifice lvl 48
	[19443] = LST["Sacrifice"], -- Voidwalker sacrifice lvl 60
}

local buffNameToShieldTypes = {
	[LST["Mana Shield"]] = { LST["Physical"] }, -- special case as it always has lower priority

	[LST["Ice Barrier"]] = { LST["Physical"], LST["Frost"], LST["Fire"], LST["Arcane"], LST["Shadow"], LST["Nature"], LST["Holy"] },
	[LST["The Burrower\'s Shell"]] = { LST["Physical"], LST["Frost"], LST["Fire"], LST["Arcane"], LST["Shadow"], LST["Nature"], LST["Holy"] },
    [LST["Power Word: Shield"]] = { LST["Physical"], LST["Frost"], LST["Fire"], LST["Arcane"], LST["Shadow"], LST["Nature"], LST["Holy"] },
	[LST["Power Word\: Shield"]] = { LST["Physical"], LST["Frost"], LST["Fire"], LST["Arcane"], LST["Shadow"], LST["Nature"], LST["Holy"] },
	[LST["Sacrifice"]] = { LST["Physical"], LST["Frost"], LST["Fire"], LST["Arcane"], LST["Shadow"], LST["Nature"], LST["Holy"] },

	[LST["Frost Resistance"]] = { LST["Frost"] }, -- frost deflector
	[LST["Fire Resistance"]] = { LST["Fire"] }, -- fire deflector

	[LST["Frost Ward"]] = { LST["Frost"] },
	[LST["Fire Ward"]] = { LST["Fire"] },
	[LST["Shadow Ward"]] = { LST["Shadow"] },

	[LST["Frost Protection"]] = { LST["Frost"] },
	[LST["Fire Protection"]] = { LST["Fire"] },
	[LST["Nature Protection"]] = { LST["Nature"] },
	[LST["Shadow Protection"]] = { LST["Shadow"] },
	[LST["Arcane Protection"]] = { LST["Arcane"] },
	[LST["Holy Protection"]] = { LST["Holy"] },
}

local buffNameToColors = {
	-- all
	[LST["Ice Barrier"]] = { ["r"] = 1, ["g"] = 1, ["b"] = 1 },
	[LST["The Burrower\'s Shell"]] = { ["r"] = 1, ["g"] = 1, ["b"] = 1 },
	[LST["Power Word\: Shield"]] = { ["r"] = 1, ["g"] = 1, ["b"] = 1 },
	[LST["Sacrifice"]] = { ["r"] = 1, ["g"] = 1, ["b"] = 1 },

	-- physical
	[LST["Mana Shield"]] = { ["r"] = 0, ["g"] = 0, ["b"] = 1 },

	-- frost
	[LST["Frost Resistance"]] = { ["r"] = 0, ["g"] = 0.9, ["b"] = 1 },
	[LST["Frost Ward"]] = { ["r"] = 0, ["g"] = 0.8, ["b"] = 1 },
	[LST["Frost Protection"]] = { ["r"] = 0, ["g"] = 0.7, ["b"] = 1 },

	-- fire
	[LST["Fire Resistance"]] = { ["r"] = 1, ["g"] = 0.6, ["b"] = 0 },
	[LST["Fire Ward"]] = { ["r"] = 1, ["g"] = 0.4, ["b"] = 0 },
	[LST["Fire Protection"]] = { ["r"] = 1, ["g"] = 0.2, ["b"] = 0 },

	-- nature
	[LST["Nature Protection"]] = { ["r"] = 0, ["g"] = 1, ["b"] = 0 },

	-- shadow
	[LST["Shadow Protection"]] = { ["r"] = 0.7, ["g"] = 0, ["b"] = 1 },
	[LST["Shadow Ward"]] = { ["r"] = 0.6, ["g"] = 0, ["b"] = 1 },

	-- arcane
	[LST["Arcane Protection"]] = { ["r"] = 1, ["g"] = 1, ["b"] = 0 },

	-- holy
	[LST["Holy Protection"]] = { ["r"] = 1, ["g"] = 0, ["b"] = 1 },
}

ShieldTracker = {
	last_cast_shield = nil,
	last_cast_string = nil,
	last_absorbed_shield = nil,
	last_absorbed_string = nil,
	current_values = {},
	max_values = {},
	active_shields = {
		[LST["Physical"]] = {}, -- shields that block physical damage
		[LST["Fire"]] = {}, -- shields that block fire damage
		[LST["Frost"]] = {}, -- shields that block frost damage
		[LST["Arcane"]] = {}, -- shields that block arcane damage
		[LST["Shadow"]] = {}, -- shields that block shadow damage
		[LST["Nature"]] = {}, -- shields that block nature damage
		[LST["Holy"]] = {}, -- shields that block holy damage
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
	if dmgType == LST["Physical"] and ShieldTracker.current_values[LST["Mana Shield"]] or 0 > 0 then
		return true
	end

	return false
end

function ShieldTracker:GetActiveShield(dmgType)
	if next(ShieldTracker.active_shields[dmgType]) ~= nil then
		return ShieldTracker.active_shields[dmgType][1]
	end
	-- special case for mana shield
	if dmgType == LST["Physical"] and ShieldTracker.current_values[LST["Mana Shield"]] > 0 then
		return LST["Mana Shield"]
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

    MageHUD:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", "SelfDamageEvent")
    MageHUD:RegisterEvent("CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS", "SelfDamageEvent")

	MageHUD:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "SelfDamageEvent") -- self is only the target for spells that hurt yourself

	MageHUD:RegisterEvent("PLAYER_DEAD", "DeathEvent")

	self.enable = true
end

function MageHUD:CastEvent(caster, target, event, spellID, castDuration)
	local absorbAmount = spellIdAbsorbAmounts[spellID]
	if not absorbAmount then
		return
	end

	local _, playerGuid = UnitExists("player")

	if caster ~= playerGuid then
		-- someone else casted the spell, check for special cases
		if petSacrifice[spellID] then
			local _, petGuid = UnitExists("pet")
			-- if a pet sacrifice from someone else's pet, ignore this cast event
			if caster ~= petGuid then
				return
			end
		elseif targetedShields[spellID] then
			if target ~= playerGuid then
				-- if not cast on player, ignore this cast event
				return
			end
		else
			-- spell we don't care about
			return
		end
	else
		-- we are the caster
		-- if we are casting on another target, ignore this cast event
		if targetedShields[spellID] and target ~= playerGuid then
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
	if shieldName == LST["The Burrower\'s Shell"] then
		shieldName = LST["Burrower Shell"]
	end
	ShieldTracker.last_cast_string = "+" .. tostring(absorbAmount) .. " from " .. shieldName

	MageHUD:TriggerEvent("MAGEHUD_SHIELD_UPDATE")
end

function MageHUD:AuraFadeEvent()
	-- local _, _, buffName = string.find(arg1, LST["(.-)%s+fades from you"]) -- shadow protection has 2 spaces ...
    local _, _, buffName = string.find(arg1, LST["(.+) fades from you"]) -- shadow protection has 2 spaces ...
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
	local _, _, dmgType, amt = string.find(eventStr, LST["%d+ (%w+) damage from.*%((%d+) absorbed%)"])
	if dmgType and amt then
		return dmgType, tonumber(amt)
	end

	_, _, dmgType, amt = string.find(eventStr, LST["%d+ (%w+) damage.*%((%d+) absorbed%)"])
	if dmgType and amt then
		return dmgType, tonumber(amt)
	end
	return nil, nil
end

function MageHUD:ParseAbsorbAmount(eventStr)
	-- example eventStr: "Mob hits you for 0. (10 absorbed)"
	local _, _, amt = string.find(eventStr, LST["for %d+.*%((%d+) absorbed%)"])
	if amt then
		return LST["Physical"], tonumber(amt)
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
				if not string.find(shield, LST["Protection"]) then
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

    -- Fs's Fireball crits you for 0 Fire damage. (307 absorbed)
    -- You suffer 1 Fire damage from Fs's Fireball.
    -- Fs hits you for 0. (8 absorbed)

	if not string.find(arg1, LST["hits you for"]) and not string.find(arg1, LST["crits you for"]) and not string.find(arg1, LST["^You suffer"]) then
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
        [LST["Physical"]] = {}, -- shields that block physical damage
		[LST["Fire"]] = {}, -- shields that block fire damage
		[LST["Frost"]] = {}, -- shields that block frost damage
		[LST["Arcane"]] = {}, -- shields that block arcane damage
		[LST["Shadow"]] = {}, -- shields that block shadow damage
		[LST["Nature"]] = {}, -- shields that block nature damage
		[LST["Holy"]] = {}, -- shields that block holy damage
	}
	MageHUD:TriggerEvent("MAGEHUD_SHIELD_UPDATE")
end

