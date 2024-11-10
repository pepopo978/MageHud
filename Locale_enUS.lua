------------------------------
----- Translation for enEN
local L = AceLibrary("AceLocale-2.2"):new("MageHUD_Core")

L:RegisterTranslations("enUS", function()
	return {
		-- Core stuff
		CMD_OPTS_FRAME = "Open options window",
		CMD_OPTS_DEBUG = "Set debugging level",
		CMD_RESET = "Reset settings for this character to the defaults",
		CMD_RESET_HELP = "This option will allow you to do two things, firstly you can reset your settings to their defaults.  To do this type 'CONFIRM' after the option so that the AddOn will know you've read this information",
		CMD_RESET_CONFIRM = "This option will reset all of your options to the default values they had when the AddOn was installed",
		TEXT_RESET = "Please type CONFIRM after this command to confirm you really do wish to reset your settings",
		TEXT_RESET_CONFIRM = "All settings have been reset to their defaults",

		FONT = "FRIZQT__.TTF",

		--	Options
		TEXT = {
			TITLE = "MageHUD Options",
			VERSION = "Version: ",
			AUTHOR = "Author: ",
			INSTANT = "Instant",

			DISPLAY = "Display options",
			ATTACHTOP = "Attach target frame to top",
			HOVERMSG = "Nameplate hover message",
			HOVERDELAY = "Nameplate hover delay",

			FADE = "Fade options",
			FADE_FULL = "When full",
			FADE_OOC = "Out of combat",
			FADE_IC = "In combat",

			MISC = "Miscellanous options",
			WIDTH = "HUD width",
			YLOC = "Vertical alignment",
			SCALE = "Scale",

			RINGVIS = "Fade behaviour",
			RINGVIS_1 = "FadeFull: Fade when full",
			RINGVIS_2 = "FadeOOC: Fade when out of combat",
			RINGVIS_3 = "FadeBoth: Fade when full or out of combat",

			RINGS = "Ring options",
			RING = "Ring",
		},
		TOOLTIP = {
			ATTACHTOP = "Attach target frame to the top of the rings instead of the bottom",
			HOVERMSG = "Toggle displaying of nameplate mouse input enabled in chat",
			HOVERDELAY = "Amount of seconds needed to hover above the nameplate to activate it",

			FADE_FULL = "Alpha to fade to when out of combat and ring at 100%",
			FADE_OOC = "Alpha to fade to when out of combat or ring not at 100%",
			FADE_IC = "Alpha to fade to when in combat (only used if behaviour is set to FadeBoth or FadeOOC)",

			WIDTH = "Sets how much the rings should be separated from the center",
			YLOC = "Positions MageHUD along the Y-axis. Positive values brings it up, negative values brings it down",
			SCALE = "Set the Scale Factor",

			RINGVIS = "Sets when the rings fade out",
			RINGVIS_1 = "Fade out when rings are full, regardless of combat status",
			RINGVIS_2 = "Always fade out when out of combat, regardless of ring status",
			RINGVIS_3 = "Fade out when out of combat or rings are full",
		},
	}
end)

local LM = AceLibrary("AceLocale-2.2"):new("MageHUD_Module")

LM:RegisterTranslations("enUS", function()
	return {
		FONT = "FRIZQT__.TTF",

		["Version: "] = true,
		["Author: "] = true,
		["Instant"] = true,

		["Health"] = "Player Health",
		["Mana"] = "Player Mana",
		["ShieldCombined"] = "Combined Shield",
		["ShieldIceBarrier"] = "Ice Barrier",
		["ShieldMana"] = "Mana Shield",
		["Casting"] = true,

		TEXT = {
			ENABLED = "Enabled",
			OUTLINE = "Ring outline",
			SHOWTEXT = "Show text",
			SHOWPERC = "Show percentage",
			SHOWLABEL = "Show label",
			COLORFADE = "Color fading",
			SHOWSPELL = "Show spell being cast",
			SHOWTIME = "Show spell timer",
			ENABLEMENU = "Enable right-click menu",
			DEFICIT = "Deficit",
			ATTACH = "Attachment",
			SIDE = "Side",
			LEVEL = "Level",
		},
		TOOLTIP = {
			ENABLED = "Toggle the ring on and off",
			OUTLINE = "Toggle the outline around the ring",
			SHOWTEXT = "Toggle text display (health, mana, etc.)",
			SHOWPERC = "Toggle showing percentage",
			SHOWLABEL = "Toggle showing label for which shield this is",
			SHOWSPELL = "Toggle displaying of current spell being casted",
			SHOWTIME = "Toggle showing spell timer",
			ENABLEMENU = "Toggle right-click menu on and off",
			SIDE = "Set which side to attach to",
			LEVEL = "Set at which level it should be attached relative to the anchor (<-1: towards center, 0: at anchor, >1: away from center)",
		},
		SIDE = {
			LEFT = "Left anchor",
			RIGHT = "Right anchor",
		},
	}
end)
