# MageHud

<b>Requires SuperWoW</b>

MageHUD is a fork of ArcHud with some of the same original arcs and additional arcs for mage shields.

WARNING: If you disable on minimap it seems to break the addon, had to delete .wtf file to fix.  Will figure out why.

The combined shield will handle all of the following spells:
```
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
```
![image](https://github.com/pepopo978/MageHud/assets/149287158/26e8a3a4-3c69-4c33-835c-f460e1019430)

Combined shield

![image](https://github.com/pepopo978/MageHud/assets/149287158/06d336c8-6fc7-4398-a7dc-c47c4ee5b665)

Separate shields

### About this repository

This requires https://github.com/balakethelock/SuperWoW

## Installation

#### Easy mode

Use [GitAddonsManager](https://woblight.gitlab.io/overview/gitaddonsmanager/).

#### Manual instructions

1. Download the code (green **Code** button > **Download ZIP**)
2. Extract the ZIP to **<Path\To\WoW Folder>\Interface\Addons**
3. Rename the extracted folder to `MageHud` (in other words, remove `-master` from the end)

Once you're done, the folder structure should be **<Path\To\WoW Folder>\Interface\Addons\MageHud\MageHud.toc**

## Configuration

Type `/MageHUD config` to open the menu.
