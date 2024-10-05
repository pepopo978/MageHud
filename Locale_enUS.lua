------------------------------
----- Translation for enEN
local L = AceLibrary("AceLocale-2.0"):new("MageHUD_Core")
local LM = AceLibrary("AceLocale-2.0"):new("MageHUD_Module")
local LST = AceLibrary("AceLocale-2.0"):new("MageHUD_ShieldTracker")

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

		["Version: "] = true,
		["Author: "] = true,

		--	Options
		TEXT = {
			TITLE = "MageHUD Options",

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
        ["Instant"] = true,
	}
end)



LM:RegisterTranslations("enUS", function()
	return {
		FONT = "FRIZQT__.TTF",

		["Version: "] = true,
		["Author: "] = true,

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

LST:RegisterTranslations("enUS", function()
	return {
        ["Power Word: Shield"] = true,
        ["Power Word\: Shield"] = true,
        ["Ice Barrier"] = true,
        ["Mana Shield"] = true,
        ["Frost Resistance"] = true,
        ["Frost Ward"] = true,
        ["Fire Resistance"] = true,
        ["Fire Ward"] = true,
        ["Frost Protection"] = true,
        ["Fire Protection"] = true,
        ["Nature Protection"] = true,
        ["Shadow Protection"] = true,
        ["Arcane Protection"] = true,
        ["Holy Protection"] = true,
        ["Protection"] = true,
        ["The Burrower\'s Shell"] = true,
        ["Burrower Shell"] = true,
        ["Shadow Ward"] = true,
        ["Sacrifice"] = true,

        ["Physical"] = true,
        ["Frost"] = true,
        ["Fire"] = true,
        ["Arcane"] = true,
        ["Shadow"] = true,
        ["Nature"] = true,
        ["Holy"] = true,

        ["(.+) fades from you"] = true,
        ["hits you for"] = true,
        ["^You suffer"] = true,
        ["crits you for"] = true,
        ["%d+ (%w+) damage from.*%((%d+) absorbed%)"] = true,
        ["%d+ (%w+) damage.*%((%d+) absorbed%)"] = true,
        ["for %d+.*%((%d+) absorbed%)"] = true,

        -- Rings_Casting
        ["Failed"] = true,
        ["Interrupted"] = true,
    }
end)

L:RegisterTranslations("zhCN", function()
	return {
-- Core stuff
		CMD_OPTS_FRAME = "打开选项窗口",
		CMD_OPTS_DEBUG = "设置调试级别",
		CMD_RESET = "将此角色的设置重置为默认值",
		CMD_RESET_HELP = "这个选项将允许你做两件事，首先你可以将你的设置重置为默认值。要这样做，请在此选项后输入'CONFIRM'，以便插件知道你已经阅读了这些信息",
		CMD_RESET_CONFIRM = "这个选项将把你的所有选项重置为安装插件时的默认值",
		TEXT_RESET = "请在此命令后输入CONFIRM以确认你确实希望将你的设置重置",
		TEXT_RESET_CONFIRM = "所有设置已重置为默认值",

		FONT = "FRIZQT__.TTF",

		["Version: "] = "版本：",
		["Author: "] = "作者：",

		--	Options
		TEXT = {
			TITLE = "MageHUD 选项",

			DISPLAY = "显示选项",
			ATTACHTOP = "将目标框架附着在顶部",
			HOVERMSG = "姓名板悬停消息",
			HOVERDELAY = "姓名板悬停延迟",

			FADE = "淡出选项",
			FADE_FULL = "当满时",
			FADE_OOC = "战斗外",
			FADE_IC = "战斗中",

			MISC = "其他选项",
			WIDTH = "HUD 宽度",
			YLOC = "垂直对齐",
			SCALE = "缩放",

			RINGVIS = "淡出行为",
			RINGVIS_1 = "FadeFull: 当满时淡出",
			RINGVIS_2 = "FadeOOC: 当战斗之外淡出",
			RINGVIS_3 = "FadeBoth: 当满或战斗之外时淡出",

			RINGS = "环选项",
			RING = "环",
		},
		TOOLTIP = {
			ATTACHTOP = "将目标框架附着在环的顶部而不是底部",
			HOVERMSG = "在聊天中切换显示姓名板鼠标输入启用",
			HOVERDELAY = "悬停在姓名板上以激活所需的秒数",

			FADE_FULL = "当战斗之外且环为100%时的淡出透明度",
			FADE_OOC = "当战斗之外或环未达到100%时的淡出透明度",
			FADE_IC = "战斗中的淡出透明度（仅当行为设置为FadeBoth或FadeOOC时使用）",

			WIDTH = "设置环与中心的分离程度",
			YLOC = "沿Y轴定位MageHUD。正值将其上移，负值将其下移",
			SCALE = "设置缩放因子",

			RINGVIS = "设置环淡出的时间",
			RINGVIS_1 = "当环满时淡出，不考虑战斗状态",
			RINGVIS_2 = "无论环的状态如何，总是在战斗之外时淡出",
			RINGVIS_3 = "当战斗之外或环满时淡出",
		
		},
        ["Instant"] = "立即",
	}
end)



LM:RegisterTranslations("zhCN", function()
	return {
        FONT = "FRIZQT__.TTF",

		["Version: "] = "版本：",
		["Author: "] = "作者：",

		["Health"] = "生命值",
		["Mana"] = "法力值",
		["ShieldCombined"] = "综合护盾",
		["ShieldIceBarrier"] = "寒冰护体",
		["ShieldMana"] = "法力护盾",
		["Casting"] = "施法条",

		TEXT = {
			ENABLED = "启用",
			OUTLINE = "环线轮廓",
			SHOWTEXT = "显示文字",
			SHOWPERC = "显示百分比",
			SHOWLABEL = "显示标签",
			COLORFADE = "颜色渐变",
			SHOWSPELL = "显示正在施放的法术",
			SHOWTIME = "显示计时器",
			ENABLEMENU = "启用右键菜单",
			DEFICIT = "赤字",
			ATTACH = "附着",
			SIDE = "侧边",
			LEVEL = "层级",
		},
		TOOLTIP = {
			ENABLED = "开关环的显示",
			OUTLINE = "开关环的轮廓",
			SHOWTEXT = "开关显示文字（生命值、法力值等）",
			SHOWPERC = "开关显示百分比",
			SHOWLABEL = "开关显示此护盾的标签",
			SHOWSPELL = "开关显示当前施放的法术",
			SHOWTIME = "开关显示法术计时器",
			ENABLEMENU = "开关右键菜单",
			SIDE = "设置附着在哪一侧",
			LEVEL = "设置相对于锚点的层级（<-1：向中心，0：在锚点，>1：远离中心）",
		},
		SIDE = {
			LEFT = "左侧锚点",
			RIGHT = "右侧锚点",
		},
	}
end)

LST:RegisterTranslations("zhCN", function()
	return {
        ["Power Word: Shield"] = "真言术：盾",
        ["Power Word\: Shield"] = "真言术：盾",
        ["Ice Barrier"] = "寒冰护体",
        ["Mana Shield"] = "法力护盾",
        ["Frost Resistance"] = "冰霜抗性",
        ["Frost Ward"] = "防护冰霜结界",
        ["Fire Resistance"] = "火焰抗性",
        ["Fire Ward"] = "防护火焰结界",
        ["Frost Protection"] = "防护冰霜",
        ["Fire Protection"] = "防护火焰",
        ["Nature Protection"] = "防护自然",
        ["Shadow Protection"] = "防护暗影",
        ["Arcane Protection"] = "防护奥术",
        ["Holy Protection"] = "防护神圣",
        ["Protection"] = "防护",
        ["The Burrower's Shell"] = "穴居虫之壳",
        ["Burrower Shell"] = "穴居虫之壳",
        ["Shadow Ward"] = "防护暗影结界",
        ["Sacrifice"] = "牺牲",

        ["Physical"] = "物理",
        ["Frost"] = "冰霜",
        ["Fire"] = "火焰",
        ["Arcane"] = "奥术",
        ["Shadow"] = "暗影",
        ["Nature"] = "自然",
        ["Holy"] = "神圣",


        ["(.+) fades from you"] = "(.+)效果从你身上消失了",
        ["hits you for"] = "击中你造成",
        ["^You suffer"] = "^你受到",
        ["crits you for"] = "致命一击对你造成",

        -- Fs's Fireball crits you for 0 Fire damage. (307 absorbed)
        -- Fs's Fireball hits you for 0 Fire damage. (21 absorbed)
        -- Fs的火球术击中你造成0点火焰伤害。(22点被吸收)

        -- You suffer 0 Fire damage from Fse's Fireball. (1 absorbed)
        -- 你受到0点火焰伤害（Fs的火球术）。(1点被吸收)

        -- Fs hits you for 0. (8 absorbed)
        -- Fs击中你造成0点伤害。(24点被吸收)

        ["%d+ (%w+) damage from.*%((%d+) absorbed%)"] = "%d+点(.+)伤害。%((%d+)点被吸收%)",
        ["%d+ (%w+) damage.*%((%d+) absorbed%)"] = "你受到%d+点(.+)伤害.+。%((%d+)点被吸收%)",
        ["for %d+.*%((%d+) absorbed%)"] = "%d+点伤害。%((%d+)点被吸收%)",

        -- Rings_Casting
        ["Failed"] = "失败",
        ["Interrupted"] = "已打断"
    }
end)
