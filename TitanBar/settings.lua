-- settings.lua
-- Written by Habna
-- Rewritten by many

-- Globals that are used by Settings:

-- default values:
tA, tR, tG, tB, tX, tY, tW = 0.3, 0.3, 0.3, 0.3, 0, 0, 3; --Default alpha, red, green, blue, X, Y pos of control, Show where
tL, tT = 100, 100; --Default position of control window

Show = {}; -- Visibility boolean for Controls

BC = {}; -- Background Color of Controls
BC.Alpha = {};
BC.Red = {};
BC.Green = {};
BC.Blue = {};

Position = {}; -- Position of Controls
Position.Left = {};
Position.Top = {};

PositionW = {}; -- Position of Windows
PositionW.Left = {};
PositionW.Top = {};

Where = {}; -- Is currency on bar, tooltip, or hidden?

HasWindow = {
    ["Wallet"] = true;
    ["Money"] = true;
    ["LOTROPoints"] = true;
};
DoesNotHaveWhere = {
    ["Wallet"] = true;
};

Currencies = {
    "Wallet",
    "Money",
    "DestinyPoints",
    "Shards",
    "SkirmishMarks",
    "MithrilCoins",
    "YuleToken",
    "HytboldTokens",
    "Medallions",
    "Seals",
    "Commendations",
    "LOTROPoints",
    "AmrothSilverPiece",
    "StarsofMerit",
    "CentralGondorSilverPiece",
    "GiftgiversBrand",
    "BingoBadge",
    "AnniversaryToken",
    "MotesOfEnchantment",
    "EmbersOfEnchantment",
    "FigmentsOfSplendour",
    "FallFestivalToken",
    "FarmersFaireToken",
    "SpringLeaf",
    "MidsummerToken",
    "AncientScript",
    "BadgeOfTaste",
    "BadgeOfDishonour",
}

CurrencyCodeToKey = {
    ["WI"] = "Wallet",
    ["MI"] = "Money",
    ["DP"] = "DestinyPoints",
    ["SP"] = "Shards",
    ["SM"] = "SkirmishMarks",
    ["MC"] = "MithrilCoins",
    ["YT"] = "YuleToken",
    ["HT"] = "HytboldTokens",
    ["MP"] = "Medallions",
    ["SL"] = "Seals",
    ["CP"] = "Commendations",
    ["LP"] = "LOTROPoints",
    ["ASP"] = "AmrothSilverPiece",
    ["SOM"] = "StarsofMerit",
    ["CGSP"] = "CentralGondorSilverPiece",
    ["GGB"] = "GiftgiversBrand",
    ["BB"] = "BingoBadge",
    ["LAT"] = "AnniversaryToken",
    ["MOE"] = "MotesOfEnchantment",
    ["EOE"] = "EmbersOfEnchantment",
    ["FOS"] = "FigmentsOfSplendour",
    ["FFT"] = "FallFestivalToken",
    ["FFAT"] = "FarmersFaireToken",
    ["SPL"] = "SpringLeaf",
    ["MST"] = "MidsummerToken",
    ["AS"] = "AncientScript",
    ["BOT"] = "BadgeOfTaste",
    ["BOD"] = "BadgeOfDishonour",
}

CurrencyKeyToCode = {
    ["Wallet"] = "WI",
    ["Money"] = "MI",
    ["DestinyPoints"] = "DP",
    ["Shards"] = "SP",
    ["SkirmishMarks"] = "SM",
    ["MithrilCoins"] = "MC",
    ["YuleToken"] = "YT",
    ["HytboldTokens"] = "HT",
    ["Medallions"] = "MP",
    ["Seals"] = "SL",
    ["Commendations"] = "CP",
    ["LOTROPoints"] = "LP",
    ["AmrothSilverPiece"] = "ASP",
    ["StarsofMerit"] = "SOM",
    ["CentralGondorSilverPiece"] = "CGSP",
    ["GiftgiversBrand"] = "GGB",
    ["BingoBadge"] = "BB",
    ["AnniversaryToken"] = "LAT",
    ["MotesOfEnchantment"] = "MOE",
    ["EmbersOfEnchantment"] = "EOE",
    ["FigmentsOfSplendour"] = "FOS",
    ["FallFestivalToken"] = "FFT",
    ["FarmersFaireToken"] = "FFAT",
    ["SpringLeaf"] = "SPL",
    ["MidsummerToken"] = "MST",
    ["AncientScript"] = "AS",
    ["BadgeOfTaste"] = "BOT",
    ["BadgeOfDishonour"] = "BOD",
}

--- Parses an entry like settings.Money.W. Also checks for a discrepancy between Where and Show.
---@param where string
---@param show boolean
---@return number?,string
function ParseWhere(where, show)
    local whereNum = tonumber(where);
    if whereNum == 3 and show then
        whereNum = 1;
        where = string.format("%.0f", whereNum);
    end -- old TitanBar comment: Remove after Oct, 15th 2013
    return whereNum, where;
end

function InitializeControlSettings(settings, key)
    InitializeDefaultControlSettings(settings, key);
    InitializeGlobalControlSettings(settings, key);
end

--- Initialize Show, ARGB, X/Y, and Where variables
---@param settings any
---@param key any
function InitializeDefaultControlSettings(settings, key)
	if settings[key] == nil then settings[key] = {}; end
	if settings[key].V == nil then settings[key].V = false; end
	if settings[key].A == nil then settings[key].A = string.format("%.3f", tA); end
	if settings[key].R == nil then settings[key].R = string.format("%.3f", tR); end
	if settings[key].G == nil then settings[key].G = string.format("%.3f", tG); end
	if settings[key].B == nil then settings[key].B = string.format("%.3f", tB); end
	if settings[key].X == nil then settings[key].X = string.format("%.0f", tX); end
	if settings[key].Y == nil then settings[key].Y = string.format("%.0f", tY); end
    if (HasWindow[key]) then
        if settings[key].L == nil then settings[key].L = string.format("%.0f", tL); end --X position of window
        if settings[key].T == nil then settings[key].T = string.format("%.0f", tT); end --Y position of window
    end
    if (not DoesNotHaveWhere[key]) then
        local value = tW;
        if (key == "Money") then value = 1; end
        if settings[key].W == nil then settings[key].W = string.format("%.0f", value); end
    end
end

--- Initialize global Show, ARGB, X/Y, and Where variables
---@param settings any
---@param key any
function InitializeGlobalControlSettings(settings, key)
	Show[key] = settings[key].V;
    BC.Alpha[key] = tonumber(settings[key].A);
	BC.Red[key] = tonumber(settings[key].R);
	BC.Green[key] = tonumber(settings[key].G);
	BC.Blue[key] = tonumber(settings[key].B);
	Position.Left[key] = tonumber(settings[key].X);
	Position.Top[key] = tonumber(settings[key].Y);
    if (HasWindow[key]) then
        PositionW.Left[key] = tonumber(settings[key].L);
        PositionW.Top[key] = tonumber(settings[key].T);
    end
    if (not DoesNotHaveWhere[key]) then
        Where[key] = ParseWhere(settings, key);
    end
end

--- Parses an entry like settings.Money.W. Also checks for a discrepancy between Where and Show.
---@param settings table
---@param key string
---@return number?
function ParseWhere(settings, key)
    local where = tonumber(settings[key].W);
    if where == 3 and settings[key].V then
        where = 1;
        settings[key].W = string.format("%.0f", where);
    end -- old TitanBar comment: Remove after Oct, 15th 2013
    return where;
end

function SaveControlSettings(settings, key)
    settings[key] = {};
    settings[key].V = Show[key];
    settings[key].A = string.format("%.3f", BC.Alpha[key]);
    settings[key].R = string.format("%.3f", BC.Red[key]);
    settings[key].G = string.format("%.3f", BC.Green[key]);
    settings[key].B = string.format("%.3f", BC.Blue[key]);
    settings[key].X = string.format("%.0f", Position.Left[key]);
    settings[key].Y = string.format("%.0f", Position.Top[key]);
    if (HasWindow[key]) then
        settings[key].L = string.format("%.0f", PositionW.Left[key]);
        settings[key].T = string.format("%.0f", PositionW.Top[key]);
    end
    if (not DoesNotHaveWhere[key]) then
		settings[key].W = string.format("%.0f", Where[key]);
    end
end

function ResetControlSettings(key)
	Show[key] = false;
    BC.Alpha[key] = tA;
    BC.Red[key] = tR;
    BC.Green[key] = tG;
    BC.Blue[key] = tB;
    Position.Left[key] = tX;
    Position.Top[key] = tY;
    if (HasWindow[key]) then
        PositionW.Left[key] = tL;
        PositionW.Top[key] = tT;
    end
    if (not DoesNotHaveWhere[key]) then
        local where = tW;
        if (key == "Money") then where = 1; end
		Where[key] = where;
    end
end

-- **v Load / update / set default settings v**
-- I'm confused as to what most of this is... Most of these strings should be in localization files, and I believe they are - so why are they here too?  Deprecated code that hasn't been cleaned up yet?
function LoadSettings()
	if GLocale == "de" then
		settings = Turbine.PluginData.Load( Turbine.DataScope.Character, "TitanBarSettingsDE" );
	elseif GLocale == "en" then
		settings = Turbine.PluginData.Load( Turbine.DataScope.Character, "TitanBarSettingsEN" );
	elseif GLocale == "fr" then
		settings = Turbine.PluginData.Load( Turbine.DataScope.Character, "TitanBarSettingsFR" );
	end
	
	if settings == nil then	settings = {}; end

	if settings.TitanBar == nil then settings.TitanBar = {}; end
	if settings.TitanBar.A == nil then settings.TitanBar.A = string.format("%.3f", tA); end --Default Alpha color value
	if settings.TitanBar.R == nil then settings.TitanBar.R = string.format("%.3f", tR); end --Default Red color value
	if settings.TitanBar.G == nil then settings.TitanBar.G = string.format("%.3f", tG); end --Default Green color value
	if settings.TitanBar.B == nil then settings.TitanBar.B = string.format("%.3f", tB); end --Default Blue color value
	if settings.TitanBar.W == nil then settings.TitanBar.W = string.format("%.0f", screenWidth); end -- Default TitanBar Width
	if settings.TitanBar.L == nil then settings.TitanBar.L = GLocale; end -- Default TitanBar Language
	if settings.TitanBar.H == nil then settings.TitanBar.H = string.format("%.0f", 30); end -- Default TitanBar Height
	if settings.TitanBar.F == nil then settings.TitanBar.F = string.format("%.0f", 1107296268); end -- Default TitanBar Font type #
	if settings.TitanBar.T == nil then settings.TitanBar.T = "TrajanPro14"; end -- Default TitanBar Font name
	if settings.TitanBar.D == nil then settings.TitanBar.D = true; end -- True ->TitanBar set to Top of the screen
	if settings.TitanBar.Z == nil then settings.TitanBar.Z = false; end -- TitanBar was reloaded
	--if settings.TitanBar.ZT == nil then settings.TitanBar.ZT = "TB"; end -- TitanBar was reloaded (text)
	bcAlpha = tonumber(settings.TitanBar.A);
	bcRed = tonumber(settings.TitanBar.R);
	bcGreen = tonumber(settings.TitanBar.G);
	bcBlue = tonumber(settings.TitanBar.B);
	TBWidth = tonumber(settings.TitanBar.W);
	TBLocale = settings.TitanBar.L;
	import (AppLocaleD..TBLocale);
	TBHeight = tonumber(settings.TitanBar.H);
	_G.TBFont = tonumber(settings.TitanBar.F);
	TBFontT = settings.TitanBar.T;
	--if TBFontT == "Undefined" then TBFontT = "TrajanPro14"; end --Override previous default font. Remove after Oct, 20th 2012
	local tStrS = tonumber(string.sub( TBFontT, string.len(TBFontT) - 1, string.len(TBFontT) )); --Get Font Size
	--write(tStrS);
	if TBHeight > 30 and tStrS <= 16 then 
		CTRHeight = 30;
	elseif TBHeight > 30 and tStrS > 16 then
		CTRHeight = 2*tStrS;
	else 
		CTRHeight = TBHeight; 
	end
	--write(CTRHeight);
	tStr = string.sub( TBFontT, 1, string.len(TBFontT) - 2 ); --Get Font name
	--write(tStr);
	if tStrS == nil then tStrS = 0; end
	NM = _G.FontN[tStr][tStrS]; --Number multiplier
	TM = _G.FontT[tStr][tStrS]; --Text multiplier
	TBTop = settings.TitanBar.D;
	TBReloaded = settings.TitanBar.Z;
	TBReloadedText = settings.TitanBar.ZT;


	settings.Language = nil; --Remove after Oct, 15th 2013
	--if settings.Language.C = nil then settings.Language.C = false; end --Language as change --Remove after Oct, 15th 2013
	--LangChange = settings.Language.C; --Remove after Oct, 15th 2013


	if settings.Options == nil then settings.Options = {}; end
	settings.Options.V = nil; --Remove after oct, 15th 2013
	if settings.Options.L == nil then settings.Options.L = string.format("%.0f", tL); end --X position of options window
	if settings.Options.T == nil then settings.Options.T = string.format("%.0f", tT); end --Y position of options window
	if settings.Options.H == nil then settings.Options.H = L["OPAHC"]; end --Auto hide option (Default is: Only in combat)
	if settings.Options.I == nil then settings.Options.I = string.format("%.0f", 32); end --Icon size (Default is: 32)
	OPWLeft = tonumber(settings.Options.L);
	OPWTop = tonumber(settings.Options.T);
	
	TBAutoHide = settings.Options.H;
	-- If user change language, Auto hide option not showing in proper language. Fix: Re-input correct word in variable.
	if TBAutoHide == "Disabled" or TBAutoHide == "D\195\169sactiver" or TBAutoHide == "niemals" then TBAutoHide = L["OPAHD"]; end
	if TBAutoHide == "Always" or TBAutoHide == "Toujours" or TBAutoHide == "immer" then TBAutoHide = L["OPAHE"]; end
	if TBAutoHide == "Only in combat" or TBAutoHide == "Seulement en combat" or TBAutoHide == "Nur in der Schlacht" then TBAutoHide = L["OPAHC"]; end

	TBIconSize = settings.Options.I;
	-- If user change language, icon disappear. Fix: Re-input correct word in variable.
	if TBIconSize == "Small (16x16)" or TBIconSize == "Petit (16x16)" or TBIconSize == "klein (16x16)" then TBIconSize = L["OPISS"];
	elseif TBIconSize == "Large (32x32)" or TBIconSize == "Grand (32x32)" or TBIconSize == "Breit (32x32)" then TBIconSize = L["OPISL"]; end
	

	if settings.Profile == nil then settings.Profile = {}; end
	settings.Profile.V = nil; --Remove after oct, 15th 2013
	if settings.Profile.L == nil then settings.Profile.L = string.format("%.0f", tL); end
	if settings.Profile.T == nil then settings.Profile.T = string.format("%.0f", tT); end
	PPWLeft = tonumber(settings.Profile.L);
	PPWTop = tonumber(settings.Profile.T);


	if settings.Shell == nil then settings.Shell = {}; end
	if settings.Shell.L == nil then settings.Shell.L = string.format("%.0f", tL); end --X position of Shell commands window
	if settings.Shell.T == nil then settings.Shell.T = string.format("%.0f", tT); end --Y position of Shell commands window
	SCWLeft = tonumber(settings.Shell.L);
	SCWTop = tonumber(settings.Shell.T);


	if settings.Background == nil then settings.Background = {}; end
	if settings.Background.L == nil then settings.Background.L = string.format("%.0f", tL); end --X position of Background window
	if settings.Background.T == nil then settings.Background.T = string.format("%.0f", tT); end --Y position of Background window
	if settings.Background.A == nil then settings.Background.A = false; end --ToAll option
	BGWLeft = tonumber(settings.Background.L);
	BGWTop = tonumber(settings.Background.T);
	BGWToAll = settings.Background.A;

    -- Initialize each currency:
    for key, value in ipairs(Currencies) do
        InitializeControlSettings(settings, value);
    end

    -- Handle currency-specific initializations:
    -- Money:
	if settings.Money.S == nil then settings.Money.S = false; end --Show Total Money of all character on TitanBar Money control.
	if settings.Money.SS == nil then settings.Money.SS = true; end --Show sessions statistics
	if settings.Money.TS == nil then settings.Money.TS = true; end --Show today statistics
	_G.STM = settings.Money.S;
	_G.SSS = settings.Money.SS;
	_G.STS = settings.Money.TS;

    -- End currency initialization

    if settings.BagInfos == nil then settings.BagInfos = {}; end
	if settings.BagInfos.V == nil then settings.BagInfos.V = true; end
	if settings.BagInfos.A == nil then settings.BagInfos.A = string.format("%.3f", tA); end
	if settings.BagInfos.R == nil then settings.BagInfos.R = string.format("%.3f", tR); end
	if settings.BagInfos.G == nil then settings.BagInfos.G = string.format("%.3f", tG); end
	if settings.BagInfos.B == nil then settings.BagInfos.B = string.format("%.3f", tB); end
	if settings.BagInfos.X == nil then settings.BagInfos.X = string.format("%.0f", tX); end
	if settings.BagInfos.Y == nil then settings.BagInfos.Y = string.format("%.0f", tY); end
	if settings.BagInfos.L == nil then settings.BagInfos.L = string.format("%.0f", tL); end
	if settings.BagInfos.T == nil then settings.BagInfos.T = string.format("%.0f", tT); end
	if settings.BagInfos.U == nil then settings.BagInfos.U = true; end --Show used slots info? False will show free slots infos
	if settings.BagInfos.M == nil then settings.BagInfos.M = true; end --Show max slots info?
	ShowBagInfos = settings.BagInfos.V;
	BIbcAlpha = tonumber(settings.BagInfos.A);
	BIbcRed = tonumber(settings.BagInfos.R);
	BIbcGreen = tonumber(settings.BagInfos.G);
	BIbcBlue = tonumber(settings.BagInfos.B);
	_G.BILocX = tonumber(settings.BagInfos.X);
	_G.BILocY = tonumber(settings.BagInfos.Y);
	BIWLeft = tonumber(settings.BagInfos.L);
	BIWTop = tonumber(settings.BagInfos.T);
	_G.BIUsed = settings.BagInfos.U;
	_G.BIMax = settings.BagInfos.M;


	if settings.BagInfosList == nil then settings.BagInfosList = {}; end
	if settings.BagInfosList.L == nil then settings.BagInfosList.L = string.format("%.0f", tL); end
	if settings.BagInfosList.T == nil then settings.BagInfosList.T = string.format("%.0f", tT); end
	BLWLeft = tonumber(settings.BagInfosList.L);
	BLWTop = tonumber(settings.BagInfosList.T);


	if settings.PlayerInfos == nil then settings.PlayerInfos = {}; end
	if settings.PlayerInfos.V == nil then settings.PlayerInfos.V = false; end
	if settings.PlayerInfos.A == nil then settings.PlayerInfos.A = string.format("%.3f", tA); end
	if settings.PlayerInfos.R == nil then settings.PlayerInfos.R = string.format("%.3f", tR); end
	if settings.PlayerInfos.G == nil then settings.PlayerInfos.G = string.format("%.3f", tG); end
	if settings.PlayerInfos.B == nil then settings.PlayerInfos.B = string.format("%.3f", tB); end
	if settings.PlayerInfos.X == nil then settings.PlayerInfos.X = string.format("%.0f", 210); end
	if settings.PlayerInfos.Y == nil then settings.PlayerInfos.Y = string.format("%.0f", tY); end
	if settings.PlayerInfos.XP == nil then settings.PlayerInfos.XP = string.format("%.0f", 0); end --Experience points
	if settings.PlayerInfos.Layout == nil then settings.PlayerInfos.Layout = false; end
	ShowPlayerInfos = settings.PlayerInfos.V;
	PIbcAlpha = tonumber(settings.PlayerInfos.A);
	PIbcRed = tonumber(settings.PlayerInfos.R);
	PIbcGreen = tonumber(settings.PlayerInfos.G);
	PIbcBlue = tonumber(settings.PlayerInfos.B);
	_G.PILocX = tonumber(settings.PlayerInfos.X);
	_G.PILocY = tonumber(settings.PlayerInfos.Y);
	ExpPTS = settings.PlayerInfos.XP;
	PILayout = settings.PlayerInfos.Layout;
	if not PILayout then
		_G.AlignLbl = Turbine.UI.ContentAlignment.MiddleLeft;
		_G.AlignVal = Turbine.UI.ContentAlignment.MiddleRight;
		_G.AlignOff = 0;
		_G.AlignOffP = 5;
	--  _G.AlignHead = Turbine.UI.ContentAlignment.MiddleLeft;
	elseif PILayout then
		_G.AlignLbl = Turbine.UI.ContentAlignment.MiddleRight;
		_G.AlignVal = Turbine.UI.ContentAlignment.MiddleLeft;
		_G.AlignOff = 5;
		_G.AlignOffP = 0;
	--	_G.AlignHead = Turbine.UI.ContentAlignment.MiddleCenter;
	end

	if settings.EquipInfos == nil then settings.EquipInfos = {}; end
	if settings.EquipInfos.V == nil then settings.EquipInfos.V = true; end
	if settings.EquipInfos.A == nil then settings.EquipInfos.A = string.format("%.3f", tA); end
	if settings.EquipInfos.R == nil then settings.EquipInfos.R = string.format("%.3f", tR); end
	if settings.EquipInfos.G == nil then settings.EquipInfos.G = string.format("%.3f", tG); end
	if settings.EquipInfos.B == nil then settings.EquipInfos.B = string.format("%.3f", tB); end
	if settings.EquipInfos.X == nil then settings.EquipInfos.X = string.format("%.0f", 75); end
	if settings.EquipInfos.Y == nil then settings.EquipInfos.Y = string.format("%.0f", tY); end
	ShowEquipInfos = settings.EquipInfos.V;
	EIbcAlpha = tonumber(settings.EquipInfos.A);
	EIbcRed = tonumber(settings.EquipInfos.R);
	EIbcGreen = tonumber(settings.EquipInfos.G);
	EIbcBlue = tonumber(settings.EquipInfos.B);
	_G.EILocX = tonumber(settings.EquipInfos.X);
	_G.EILocY = tonumber(settings.EquipInfos.Y);


	if settings.DurabilityInfos == nil then settings.DurabilityInfos = {}; end
	if settings.DurabilityInfos.V == nil then settings.DurabilityInfos.V = true; end
	if settings.DurabilityInfos.A == nil then settings.DurabilityInfos.A = string.format("%.3f", tA); end
	if settings.DurabilityInfos.R == nil then settings.DurabilityInfos.R = string.format("%.3f", tR); end
	if settings.DurabilityInfos.G == nil then settings.DurabilityInfos.G = string.format("%.3f", tG); end
	if settings.DurabilityInfos.B == nil then settings.DurabilityInfos.B = string.format("%.3f", tB); end
	if settings.DurabilityInfos.X == nil then settings.DurabilityInfos.X = string.format("%.0f", 145); end
	if settings.DurabilityInfos.Y == nil then settings.DurabilityInfos.Y = string.format("%.0f", tY); end
	if settings.DurabilityInfos.L == nil then settings.DurabilityInfos.L = string.format("%.0f", tL); end
	if settings.DurabilityInfos.T == nil then settings.DurabilityInfos.T = string.format("%.0f", tT); end
	if settings.DurabilityInfos.I == nil then settings.DurabilityInfos.I = true; end
	if settings.DurabilityInfos.N == nil then settings.DurabilityInfos.N = true; end
	ShowDurabilityInfos = settings.DurabilityInfos.V;
	DIbcAlpha = tonumber(settings.DurabilityInfos.A);
	DIbcRed = tonumber(settings.DurabilityInfos.R);
	DIbcGreen = tonumber(settings.DurabilityInfos.G);
	DIbcBlue = tonumber(settings.DurabilityInfos.B);
	_G.DILocX = tonumber(settings.DurabilityInfos.X);
	_G.DILocY = tonumber(settings.DurabilityInfos.Y);
	DIWLeft = tonumber(settings.DurabilityInfos.L);
	DIWTop = tonumber(settings.DurabilityInfos.T);
	DIIcon = settings.DurabilityInfos.I;
	DIText = settings.DurabilityInfos.N;


	if settings.PlayerLoc == nil then settings.PlayerLoc = {}; end
	if settings.PlayerLoc.V == nil then settings.PlayerLoc.V = true; end
	if settings.PlayerLoc.A == nil then settings.PlayerLoc.A = string.format("%.3f", tA); end
	if settings.PlayerLoc.R == nil then settings.PlayerLoc.R = string.format("%.3f", tR); end
	if settings.PlayerLoc.G == nil then settings.PlayerLoc.G = string.format("%.3f", tG); end
	if settings.PlayerLoc.B == nil then settings.PlayerLoc.B = string.format("%.3f", tB); end
	if settings.PlayerLoc.L == nil then settings.PlayerLoc.L = string.format( L["PLMsg"] ); end
	if settings.PlayerLoc.X == nil then settings.PlayerLoc.X = string.format("%.0f", screenWidth - 205); end
	if settings.PlayerLoc.Y == nil then settings.PlayerLoc.Y = string.format("%.0f", tY); end
	ShowPlayerLoc = settings.PlayerLoc.V;
	PLbcAlpha = tonumber(settings.PlayerLoc.A);
	PLbcRed = tonumber(settings.PlayerLoc.R);
	PLbcGreen = tonumber(settings.PlayerLoc.G);
	PLbcBlue = tonumber(settings.PlayerLoc.B);
	pLLoc = settings.PlayerLoc.L;
	_G.PLLocX = tonumber(settings.PlayerLoc.X);
	_G.PLLocY = tonumber(settings.PlayerLoc.Y);


	if settings.TrackItems == nil then settings.TrackItems = {}; end
	if settings.TrackItems.V == nil then settings.TrackItems.V = false; end
	if settings.TrackItems.A == nil then settings.TrackItems.A = string.format("%.3f", tA); end
	if settings.TrackItems.R == nil then settings.TrackItems.R = string.format("%.3f", tR); end
	if settings.TrackItems.G == nil then settings.TrackItems.G = string.format("%.3f", tG); end
	if settings.TrackItems.B == nil then settings.TrackItems.B = string.format("%.3f", tB); end
	if settings.TrackItems.X == nil then settings.TrackItems.X = string.format("%.0f", tX); end
	if settings.TrackItems.Y == nil then settings.TrackItems.Y = string.format("%.0f", tY); end
	if settings.TrackItems.L == nil then settings.TrackItems.L = string.format("%.0f", tL); end
	if settings.TrackItems.T == nil then settings.TrackItems.T = string.format("%.0f", tT); end
	ShowTrackItems = settings.TrackItems.V;
	TIbcAlpha = tonumber(settings.TrackItems.A);
	TIbcRed = tonumber(settings.TrackItems.R);
	TIbcGreen = tonumber(settings.TrackItems.G);
	TIbcBlue = tonumber(settings.TrackItems.B);
	_G.TILocX = tonumber(settings.TrackItems.X);
	_G.TILocY = tonumber(settings.TrackItems.Y);
	TIWLeft = tonumber(settings.TrackItems.L);
	TIWTop = tonumber(settings.TrackItems.T);


	if settings.Infamy == nil then settings.Infamy = {}; end
	if settings.Infamy.V == nil then settings.Infamy.V = false; end
	if settings.Infamy.A == nil then settings.Infamy.A = string.format("%.3f", tA); end
	if settings.Infamy.R == nil then settings.Infamy.R = string.format("%.3f", tR); end
	if settings.Infamy.G == nil then settings.Infamy.G = string.format("%.3f", tG); end
	if settings.Infamy.B == nil then settings.Infamy.B = string.format("%.3f", tB); end
	if settings.Infamy.P == nil then settings.Infamy.P = string.format("%.0f", 0); end --Infamy points
	if settings.Infamy.K == nil then settings.Infamy.K = string.format("%.0f", 0); end --Infamy rank
	if settings.Infamy.X == nil then settings.Infamy.X = string.format("%.0f", tX); end
	if settings.Infamy.Y == nil then settings.Infamy.Y = string.format("%.0f", tY); end
	if settings.Infamy.L == nil then settings.Infamy.L = string.format("%.0f", tL); end
	if settings.Infamy.T == nil then settings.Infamy.T = string.format("%.0f", tT); end
	ShowInfamy = settings.Infamy.V;
	IFbcAlpha = tonumber(settings.Infamy.A);
	IFbcRed = tonumber(settings.Infamy.R);
	IFbcGreen = tonumber(settings.Infamy.G);
	IFbcBlue = tonumber(settings.Infamy.B);
	SetInfamy = settings.Infamy.F;
	_G.IFLocX = tonumber(settings.Infamy.X);
	_G.IFLocY = tonumber(settings.Infamy.Y);
	IFWLeft = tonumber(settings.Infamy.L);
	IFWTop = tonumber(settings.Infamy.T);
	InfamyPTS = settings.Infamy.P;
	InfamyRank = settings.Infamy.K;


	if settings.Vault == nil then settings.Vault = {}; end
	if settings.Vault.V == nil then settings.Vault.V = false; end
	if settings.Vault.A == nil then settings.Vault.A = string.format("%.3f", tA); end
	if settings.Vault.R == nil then settings.Vault.R = string.format("%.3f", tR); end
	if settings.Vault.G == nil then settings.Vault.G = string.format("%.3f", tG); end
	if settings.Vault.B == nil then settings.Vault.B = string.format("%.3f", tB); end
	if settings.Vault.X == nil then settings.Vault.X = string.format("%.0f", tX); end
	if settings.Vault.Y == nil then settings.Vault.Y = string.format("%.0f", tY); end
	if settings.Vault.L == nil then settings.Vault.L = string.format("%.0f", tL); end
	if settings.Vault.T == nil then settings.Vault.T = string.format("%.0f", tT); end
	ShowVault = settings.Vault.V;
	VTbcAlpha = tonumber(settings.Vault.A);
	VTbcRed = tonumber(settings.Vault.R);
	VTbcGreen = tonumber(settings.Vault.G);
	VTbcBlue = tonumber(settings.Vault.B);
	_G.VTLocX = tonumber(settings.Vault.X);
	_G.VTLocY = tonumber(settings.Vault.Y);
	VTWLeft = tonumber(settings.Vault.L);
	VTWTop = tonumber(settings.Vault.T);


	if settings.SharedStorage == nil then settings.SharedStorage = {}; end
	if settings.SharedStorage.V == nil then settings.SharedStorage.V = false; end
	if settings.SharedStorage.A == nil then settings.SharedStorage.A = string.format("%.3f", tA); end
	if settings.SharedStorage.R == nil then settings.SharedStorage.R = string.format("%.3f", tR); end
	if settings.SharedStorage.G == nil then settings.SharedStorage.G = string.format("%.3f", tG); end
	if settings.SharedStorage.B == nil then settings.SharedStorage.B = string.format("%.3f", tB); end
	if settings.SharedStorage.X == nil then settings.SharedStorage.X = string.format("%.0f", tX); end
	if settings.SharedStorage.Y == nil then settings.SharedStorage.Y = string.format("%.0f", tY); end
	if settings.SharedStorage.L == nil then settings.SharedStorage.L = string.format("%.0f", tL); end
	if settings.SharedStorage.T == nil then settings.SharedStorage.T = string.format("%.0f", tT); end
	ShowSharedStorage = settings.SharedStorage.V;
	SSbcAlpha = tonumber(settings.SharedStorage.A);
	SSbcRed = tonumber(settings.SharedStorage.R);
	SSbcGreen = tonumber(settings.SharedStorage.G);
	SSbcBlue = tonumber(settings.SharedStorage.B);
	_G.SSLocX = tonumber(settings.SharedStorage.X);
	_G.SSLocY = tonumber(settings.SharedStorage.Y);
	SSWLeft = tonumber(settings.SharedStorage.L);
	SSWTop = tonumber(settings.SharedStorage.T);

	--[[
	if settings.Bank == nil then settings.Bank = {}; end
	if settings.Bank.V == nil then settings.Bank.V = false; end
	if settings.Bank.A == nil then settings.Bank.A = string.format("%.3f", tA); end
	if settings.Bank.R == nil then settings.Bank.R = string.format("%.3f", tR); end
	if settings.Bank.G == nil then settings.Bank.G = string.format("%.3f", tG); end
	if settings.Bank.B == nil then settings.Bank.B = string.format("%.3f", tB); end
	if settings.Bank.X == nil then settings.Bank.X = string.format("%.0f", tX); end
	if settings.Bank.Y == nil then settings.Bank.Y = string.format("%.0f", tY); end
	if settings.Bank.L == nil then settings.Bank.L = string.format("%.0f", tL); end
	if settings.Bank.T == nil then settings.Bank.T = string.format("%.0f", tT); end
	ShowBank = settings.Bank.V;
	BKbcAlpha = tonumber(settings.Bank.A);
	BKbcRed = tonumber(settings.Bank.R);
	BKbcGreen = tonumber(settings.Bank.G);
	BKbcBlue = tonumber(settings.Bank.B);
	_G.BKLocX = tonumber(settings.Bank.X);
	_G.BKLocY = tonumber(settings.Bank.Y);
	BKWLeft = tonumber(settings.Bank.L);
	BKWTop = tonumber(settings.Bank.T);
	]]

	if settings.DayNight == nil then settings.DayNight = {}; end
	if settings.DayNight.V == nil then settings.DayNight.V = false; end
	if settings.DayNight.A == nil then settings.DayNight.A = string.format("%.3f", tA); end
	if settings.DayNight.R == nil then settings.DayNight.R = string.format("%.3f", tR); end
	if settings.DayNight.G == nil then settings.DayNight.G = string.format("%.3f", tG); end
	if settings.DayNight.B == nil then settings.DayNight.B = string.format("%.3f", tB); end
	if settings.DayNight.X == nil then settings.DayNight.X = string.format("%.0f", tX); end
	if settings.DayNight.Y == nil then settings.DayNight.Y = string.format("%.0f", tY); end
	if settings.DayNight.L == nil then settings.DayNight.L = string.format("%.0f", tL); end
	if settings.DayNight.T == nil then settings.DayNight.T = string.format("%.0f", tT); end
	if settings.DayNight.N == nil then settings.DayNight.N = true; end -- True = Show next day & night time
	if settings.DayNight.S == nil then settings.DayNight.S = string.format("%.0f", 10350); end -- Timer seed
	ShowDayNight = settings.DayNight.V;
	DNbcAlpha = tonumber(settings.DayNight.A);
	DNbcRed = tonumber(settings.DayNight.R);
	DNbcGreen = tonumber(settings.DayNight.G);
	DNbcBlue = tonumber(settings.DayNight.B);
	_G.DNLocX = tonumber(settings.DayNight.X);
	_G.DNLocY = tonumber(settings.DayNight.Y);
	DNWLeft = tonumber(settings.DayNight.L);
	DNWTop = tonumber(settings.DayNight.T);
	_G.DNNextT = settings.DayNight.N;
	_G.TS = tonumber(settings.DayNight.S);


	if settings.Reputation == nil then settings.Reputation = {}; end
	if settings.Reputation.V == nil then settings.Reputation.V = false; end
	if settings.Reputation.H == nil then settings.Reputation.H = false; end-- Hide max reputations in tooltip
	if settings.Reputation.A == nil then settings.Reputation.A = string.format( "%.3f", tA ); end-- Color alpha
	if settings.Reputation.R == nil then settings.Reputation.R = string.format( "%.3f", tR ); end-- Color red
	if settings.Reputation.G == nil then settings.Reputation.G = string.format( "%.3f", tG ); end-- Color green
	if settings.Reputation.B == nil then settings.Reputation.B = string.format( "%.3f", tB ); end-- Color blue
	if settings.Reputation.X == nil then settings.Reputation.X = string.format( "%.0f", tX ); end-- X coord
	if settings.Reputation.Y == nil then settings.Reputation.Y = string.format( "%.0f", tY ); end-- X coord
	if settings.Reputation.L == nil then settings.Reputation.L = string.format( "%.0f", tL ); end-- Left coord
	if settings.Reputation.T == nil then settings.Reputation.T = string.format( "%.0f", tT ); end-- Top coord
	ShowReputation = settings.Reputation.V;
	HideMaxReps = settings.Reputation.H
	RPbcAlpha = tonumber( settings.Reputation.A );
	RPbcRed = tonumber( settings.Reputation.R );
	RPbcGreen = tonumber( settings.Reputation.G );
	RPbcBlue = tonumber( settings.Reputation.B );
	_G.RPLocX = tonumber( settings.Reputation.X );
	_G.RPLocY = tonumber( settings.Reputation.Y );
	RPWLeft = tonumber( settings.Reputation.L );
	RPWTop = tonumber( settings.Reputation.T )


	if settings.GameTime == nil then settings.GameTime = {}; end
	if settings.GameTime.V == nil then settings.GameTime.V = true; end
	if settings.GameTime.A == nil then settings.GameTime.A = string.format("%.3f", tA); end
	if settings.GameTime.R == nil then settings.GameTime.R = string.format("%.3f", tR); end
	if settings.GameTime.G == nil then settings.GameTime.G = string.format("%.3f", tG); end
	if settings.GameTime.B == nil then settings.GameTime.B = string.format("%.3f", tB); end
	if settings.GameTime.X == nil then settings.GameTime.X = string.format("%.0f", screenWidth - 60); end
	if settings.GameTime.Y == nil then settings.GameTime.Y = string.format("%.0f", tY); end
	if settings.GameTime.H == nil then settings.GameTime.H = false; end -- True = Show clock in 24h format
	if settings.GameTime.S == nil then settings.GameTime.S = false; end -- True = Show server time
	if settings.GameTime.O == nil then settings.GameTime.O = false; end -- True = Show both time (Server & Real)
	if settings.GameTime.M == nil then settings.GameTime.M = string.format("%.0f", 0); end -- User defined GMT
	if settings.GameTime.L == nil then settings.GameTime.L = string.format("%.0f", tL); end
	if settings.GameTime.T == nil then settings.GameTime.T = string.format("%.0f", tT); end
	ShowGameTime = settings.GameTime.V;
	GTbcAlpha = tonumber(settings.GameTime.A);
	GTbcRed = tonumber(settings.GameTime.R);
	GTbcGreen = tonumber(settings.GameTime.G);
	GTbcBlue = tonumber(settings.GameTime.B);
	_G.GTLocX = tonumber(settings.GameTime.X);
	_G.GTLocY = tonumber(settings.GameTime.Y);
	_G.Clock24h = settings.GameTime.H;
	_G.ShowST = settings.GameTime.S;
	_G.ShowBT = settings.GameTime.O;
	_G.UserGMT = settings.GameTime.M;
	GTWLeft = tonumber(settings.GameTime.L);
	GTWTop = tonumber(settings.GameTime.T);

	SaveSettings( false );

	--if settings.TitanBar.W ~= screenWidth then ReplaceCtr(); end --Replace control if screen width as changed
end
-- **^
-- **v Save settings v**
function SaveSettings(str)
	if str then --True: get all variable and save settings
		settings = {};
		
		settings.TitanBar = {};
		settings.TitanBar.A = string.format("%.3f", bcAlpha);
		settings.TitanBar.R = string.format("%.3f", bcRed);
		settings.TitanBar.G = string.format("%.3f", bcGreen);
		settings.TitanBar.B = string.format("%.3f", bcBlue);
		settings.TitanBar.W = string.format("%.0f", screenWidth);
		settings.TitanBar.L = TBLocale;
		settings.TitanBar.H = string.format("%.0f", TBHeight);
		settings.TitanBar.F = string.format("%.0f", _G.TBFont);
		settings.TitanBar.T = TBFontT;
		settings.TitanBar.D = TBTop;
		settings.TitanBar.Z = TBReloaded;
		settings.TitanBar.ZT = TBReloadedText;
		
		settings.Options = {};
		settings.Options.L = string.format("%.0f", OPWLeft);
		settings.Options.T = string.format("%.0f", OPWTop);
		settings.Options.H = TBAutoHide;
		settings.Options.I = string.format("%.0f", TBIconSize);

		settings.Profile = {};
		settings.Profile.L = string.format("%.0f", PPWLeft);
		settings.Profile.T = string.format("%.0f", PPWTop);

		settings.Shell = {};
		settings.Shell.L = string.format("%.0f", SCWLeft);
		settings.Shell.T = string.format("%.0f", SCWTop);

		settings.Background = {};
		settings.Background.L = string.format("%.0f", BGWLeft);
		settings.Background.T = string.format("%.0f", BGWTop);
		settings.Background.A = BGWToAll;

        -- Save currency-specific data:
        for key, value in ipairs(Currencies) do
            SaveControlSettings(settings, value);
        end

        -- Money-specific settings:
		settings.Money.S = _G.STM; --Show Total Money of all character on TitanBar Money control.
		settings.Money.SS = _G.SSS; --Show sessions statistics in money tooltip.
		settings.Money.TS = _G.STS; --Show today statistics in money tooltip
		if PlayerAlign == 1 then settings.Money.L = string.format("%.0f", PositionW.Left["Money"]); end
		if PlayerAlign == 1 then settings.Money.T = string.format("%.0f", PositionW.Top["Money"]); end

		settings.BagInfos = {};
		settings.BagInfos.V = ShowBagInfos;
		settings.BagInfos.A = string.format("%.3f", BIbcAlpha);
		settings.BagInfos.R = string.format("%.3f", BIbcRed);
		settings.BagInfos.G = string.format("%.3f", BIbcGreen);
		settings.BagInfos.B = string.format("%.3f", BIbcBlue);
		settings.BagInfos.X = string.format("%.0f", _G.BILocX);
		settings.BagInfos.Y = string.format("%.0f", _G.BILocY);
		settings.BagInfos.L = string.format("%.0f", BIWLeft);
		settings.BagInfos.T = string.format("%.0f", BIWTop);
		settings.BagInfos.U = _G.BIUsed;
		settings.BagInfos.M = _G.BIMax;

		settings.BagInfosList = {};
		settings.BagInfosList.L = string.format("%.0f", BLWLeft);
		settings.BagInfosList.T = string.format("%.0f", BLWTop);

		settings.PlayerInfos = {};
		settings.PlayerInfos.V = ShowPlayerInfos;
		settings.PlayerInfos.A = string.format("%.3f", PIbcAlpha);
		settings.PlayerInfos.R = string.format("%.3f", PIbcRed);
		settings.PlayerInfos.G = string.format("%.3f", PIbcGreen);
		settings.PlayerInfos.B = string.format("%.3f", PIbcBlue);
		settings.PlayerInfos.X = string.format("%.0f", _G.PILocX);
		settings.PlayerInfos.Y = string.format("%.0f", _G.PILocY);
		settings.PlayerInfos.XP = ExpPTS;
		settings.PlayerInfos.Layout = PILayout;

		settings.EquipInfos = {};
		settings.EquipInfos.V = ShowEquipInfos;
		settings.EquipInfos.A = string.format("%.3f", EIbcAlpha);
		settings.EquipInfos.R = string.format("%.3f", EIbcRed);
		settings.EquipInfos.G = string.format("%.3f", EIbcGreen);
		settings.EquipInfos.B = string.format("%.3f", EIbcBlue);
		settings.EquipInfos.X = string.format("%.0f", _G.EILocX);
		settings.EquipInfos.Y = string.format("%.0f", _G.EILocY);
	
		settings.DurabilityInfos = {};
		settings.DurabilityInfos.V = ShowDurabilityInfos;
		settings.DurabilityInfos.A = string.format("%.3f", DIbcAlpha);
		settings.DurabilityInfos.R = string.format("%.3f", DIbcRed);
		settings.DurabilityInfos.G = string.format("%.3f", DIbcGreen);
		settings.DurabilityInfos.B = string.format("%.3f", DIbcBlue);
		settings.DurabilityInfos.X = string.format("%.0f", _G.DILocX);
		settings.DurabilityInfos.Y = string.format("%.0f", _G.DILocY);
		settings.DurabilityInfos.L = string.format("%.0f", DIWLeft);
		settings.DurabilityInfos.T = string.format("%.0f", DIWTop);
		settings.DurabilityInfos.I = DIIcon;
		settings.DurabilityInfos.N = DIText;
	
		settings.PlayerLoc = {};
		settings.PlayerLoc.V = ShowPlayerLoc;
		settings.PlayerLoc.A = string.format("%.3f", PLbcAlpha);
		settings.PlayerLoc.R = string.format("%.3f", PLbcRed);
		settings.PlayerLoc.G = string.format("%.3f", PLbcGreen);
		settings.PlayerLoc.B = string.format("%.3f", PLbcBlue);
		settings.PlayerLoc.L = string.format( pLLoc );
		settings.PlayerLoc.X = string.format("%.0f", _G.PLLocX);
		settings.PlayerLoc.Y = string.format("%.0f", _G.PLLocY);

		settings.TrackItems = {};
		settings.TrackItems.V = ShowTrackItems;
		settings.TrackItems.A = string.format("%.3f", TIbcAlpha);
		settings.TrackItems.R = string.format("%.3f", TIbcRed);
		settings.TrackItems.G = string.format("%.3f", TIbcGreen);
		settings.TrackItems.B = string.format("%.3f", TIbcBlue);
		settings.TrackItems.X = string.format("%.0f", _G.TILocX);
		settings.TrackItems.Y = string.format("%.0f", _G.TILocY);
		settings.TrackItems.L = string.format("%.0f", TIWLeft);
		settings.TrackItems.T = string.format("%.0f", TIWTop);

		settings.Infamy = {};
		settings.Infamy.V = ShowInfamy;
		settings.Infamy.P = string.format("%.0f", InfamyPTS);
		settings.Infamy.K = string.format("%.0f", InfamyRank);
		settings.Infamy.A = string.format("%.3f", IFbcAlpha);
		settings.Infamy.R = string.format("%.3f", IFbcRed);
		settings.Infamy.G = string.format("%.3f", IFbcGreen);
		settings.Infamy.B = string.format("%.3f", IFbcBlue);
		settings.Infamy.X = string.format("%.0f", _G.IFLocX);
		settings.Infamy.Y = string.format("%.0f", _G.IFLocY);
		settings.Infamy.L = string.format("%.0f", IFWLeft);
		settings.Infamy.T = string.format("%.0f", IFWTop);

		settings.Vault = {};
		settings.Vault.V = ShowVault;
		settings.Vault.A = string.format("%.3f", VTbcAlpha);
		settings.Vault.R = string.format("%.3f", VTbcRed);
		settings.Vault.G = string.format("%.3f", VTbcGreen);
		settings.Vault.B = string.format("%.3f", VTbcBlue);
		settings.Vault.X = string.format("%.0f", _G.VTLocX);
		settings.Vault.Y = string.format("%.0f", _G.VTLocY);
		settings.Vault.L = string.format("%.0f", VTWLeft);
		settings.Vault.T = string.format("%.0f", VTWTop);

		settings.SharedStorage = {};
		settings.SharedStorage.V = ShowSharedStorage;
		settings.SharedStorage.A = string.format("%.3f", SSbcAlpha);
		settings.SharedStorage.R = string.format("%.3f", SSbcRed);
		settings.SharedStorage.G = string.format("%.3f", SSbcGreen);
		settings.SharedStorage.B = string.format("%.3f", SSbcBlue);
		settings.SharedStorage.X = string.format("%.0f", _G.SSLocX);
		settings.SharedStorage.Y = string.format("%.0f", _G.SSLocY);
		settings.SharedStorage.L = string.format("%.0f", SSWLeft);
		settings.SharedStorage.T = string.format("%.0f", SSWTop);
		--[[
		settings.Bank = {};
		settings.Bank.V = ShowBank;
		settings.Bank.A = string.format("%.3f", BKbcAlpha);
		settings.Bank.R = string.format("%.3f", BKbcRed);
		settings.Bank.G = string.format("%.3f", BKbcGreen);
		settings.Bank.B = string.format("%.3f", BKbcBlue);
		settings.Bank.X = string.format("%.0f", _G.BKLocX);
		settings.Bank.Y = string.format("%.0f", _G.BKLocY);
		settings.Bank.L = string.format("%.0f", BKWLeft);
		settings.Bank.T = string.format("%.0f", BKWTop);
		]]
		settings.DayNight = {};
		settings.DayNight.V = ShowDayNight;
		settings.DayNight.A = string.format("%.3f", DNbcAlpha);
		settings.DayNight.R = string.format("%.3f", DNbcRed);
		settings.DayNight.G = string.format("%.3f", DNbcGreen);
		settings.DayNight.B = string.format("%.3f", DNbcBlue);
		settings.DayNight.X = string.format("%.0f", _G.DNLocX);
		settings.DayNight.Y = string.format("%.0f", _G.DNLocY);
		settings.DayNight.L = string.format("%.0f", DNWLeft);
		settings.DayNight.T = string.format("%.0f", DNWTop);
		settings.DayNight.N = _G.DNNextT;
		settings.DayNight.S = string.format("%.0f", _G.TS);

		settings.Reputation = {};
		settings.Reputation.V = ShowReputation;
		settings.Reputation.H = HideMaxReps;
		settings.Reputation.A = string.format("%.3f", RPbcAlpha);
		settings.Reputation.R = string.format("%.3f", RPbcRed);
		settings.Reputation.G = string.format("%.3f", RPbcGreen);
		settings.Reputation.B = string.format("%.3f", RPbcBlue);
		settings.Reputation.X = string.format("%.0f", _G.RPLocX);
		settings.Reputation.Y = string.format("%.0f", _G.RPLocY);
		settings.Reputation.L = string.format("%.0f", RPWLeft);
		settings.Reputation.T = string.format("%.0f", RPWTop);

		settings.GameTime = {};
		settings.GameTime.V = ShowGameTime;
		settings.GameTime.A = string.format("%.3f", GTbcAlpha);
		settings.GameTime.R = string.format("%.3f", GTbcRed);
		settings.GameTime.G = string.format("%.3f", GTbcGreen);
		settings.GameTime.B = string.format("%.3f", GTbcBlue);
		settings.GameTime.X = string.format("%.0f", _G.GTLocX);
		settings.GameTime.Y = string.format("%.0f", _G.GTLocY);
		settings.GameTime.H = _G.Clock24h;
		settings.GameTime.S = _G.ShowST;
		settings.GameTime.O = _G.ShowBT;
		settings.GameTime.M = string.format("%.0f", _G.UserGMT);
		if PlayerAlign == 1 then settings.GameTime.L = string.format("%.0f", GTWLeft); end
		if PlayerAlign == 1 then  settings.GameTime.T = string.format("%.0f", GTWTop); end

	end
	
	if GLocale == "de" then Turbine.PluginData.Save( Turbine.DataScope.Character, "TitanBarSettingsDE", settings ); end
	if GLocale == "en" then Turbine.PluginData.Save( Turbine.DataScope.Character, "TitanBarSettingsEN", settings ); end
	if GLocale == "fr" then Turbine.PluginData.Save( Turbine.DataScope.Character, "TitanBarSettingsFR", settings ); end
end
-- **^
-- **v Reset All Settings v**
function ResetSettings()
	write( L["TBR"] );
	TBLocale = "en";
	
	if GLocale == "en" then tA, tR, tG, tB, tX, tY, tW = 0.3, 0.3, 0.3, 0.3, 0, 0, 3;
	else tA, tR, tG, tB, tX, tY, tW = "0,3", "0,3", "0,3", "0,3", "0", "0", "3"; end
	tL, tT = 100, 100;
	
	TBHeight, _G.TBFont, TBFontT, TBTop, TBAutoHide, TBIconSize, bcAlpha, bcRed, bcGreen, bcBlue = 30, 1107296268, "TrajanPro14", true, L["OPAHC"], 32, tA, tR, tG, tB; --Backcolor & default X Location for TitanBar

    -- Reset each currency:
    for key, value in ipairs(Currencies) do
        ResetControlSettings(value);
    end

    -- Money-specific reset:
	_G.STM, _G.SSS, _G.STS = false, true, true;

    -- End currency initialization

	ShowBagInfos, _G.BIUsed, _G.BIMax, BIbcAlpha, BIbcRed, BIbcGreen, BIbcBlue, _G.BILocX, _G.BILocY = true, true, true, tA, tR, tG, tB, tX, tY; --for Bag info Control
	ShowEquipInfos, EIbcAlpha, EIbcRed, EIbcGreen, EIbcBlue, _G.EILocX, _G.EILocY = true, tA, tR, tG, tB, 75, tY; --for Equipment infos Control
	ShowDurabilityInfos, DIIcon, DIText, DIbcAlpha, DIbcRed, DIbcGreen, DIbcBlue, _G.DILocX, _G.DILocY = true, true, true, tA, tR, tG, tB, 145, tY; --for Durability infos Control
	ShowPlayerInfos, PIbcAlpha, PIbcRed, PIbcGreen, PIbcBlue, _G.PILocX, _G.PILocY = false, tA, tR, tG, tB, 210, tY; --for Player infos Control
	ShowTrackItems, TIbcAlpha, TIbcRed, TIbcGreen, TIbcBlue, _G.TILocX, _G.TILocY = false, tA, tR, tG, tB, tX, tY; --for Track Items Control
	ShowInfamy, IFbcAlpha, IFbcRed, IFbcGreen, IFbcBlue, _G.IFLocX, _G.IFLocY = false, tA, tR, tG, tB, tX, tY --for Infamy Control
	ShowVault, VTbcAlpha, VTbcRed, VTbcGreen, VTbcBlue, _G.VTLocX, _G.VTLocY = false, tA, tR, tG, tB, tX, tY --for Vault Control
	ShowSharedStorage, SSbcAlpha, SSbcRed, SSbcGreen, SSbcBlue, _G.SSLocX, _G.SSLocY = false, tA, tR, tG, tB, tX, tY --for SharedStorage Control
	--ShowBank, BKbcAlpha, BKbcRed, BKbcGreen, BKbcBlue, _G.BKLocX, _G.BKLocY = false, tA, tR, tG, tB, tX, tY --for Bank Control
	ShowDayNight, _G.DNNextT, DNbcAlpha, DNbcRed, DNbcGreen, DNbcBlue, _G.DNLocX, _G.DNLocY = false, true, tA, tR, tG, tB, tX, tY --for DayNight Control
	ShowReputation, RPbcAlpha, RPbcRed, RPbcGreen, RPbcBlue, _G.RPLocX, _G.RPLocY = false, tA, tR, tG, tB, tX, tY --for Reputation Control
	ShowPlayerLoc, PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue, _G.PLLocX, _G.PLLocX = true, tA, tR, tG, tB, screenWidth - 205, tY; --for Player Location Control
	ShowGameTime, _G.Clock24h, _G.ShowST, _G.ShowBT, GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue, _G.GTLocX, _G.GTLocX = true, false, false, false, tA, tR, tG, tB, screenWidth - 60, tY --for Game time Control

	SaveSettings( true ); --True: Get & save all settings table to file. / False: only save settings table to file.
	ReloadTitanBar();
end
-- **^

function ReplaceCtr()
	write( L["TBSSCS"] );
	TB["win"]:SetSize( screenWidth, TBHeight );
	local oldScreenWidth = settings.TitanBar.W;
	TBWidth = screenWidth;
	settings.TitanBar.W = string.format("%.0f", screenWidth);
	
	local oldLocX = settings.Wallet.X / oldScreenWidth;
	Position.Left["Wallet"] = oldLocX * screenWidth;
	settings.Wallet.X = string.format("%.0f", Position.Left["Wallet"]);
	if Show["Wallet"] then WI[ "Ctr" ]:SetPosition( Position.Left["Wallet"], Position.Top["Wallet"] ); end

	oldLocX = settings.Money.X / oldScreenWidth;
	Position.Left["Money"] = oldLocX * screenWidth;
	settings.Money.X = string.format("%.0f", Position.Left["Money"]);
	if Show["Money"] and Where["Money"] == 1 then MI[ "Ctr" ]:SetPosition( Position.Left["Money"], Position.Top["Money"] ); end
	
	oldLocX = settings.DestinyPoints.X / oldScreenWidth;
	Position.Left["DestinyPoints"] = oldLocX * screenWidth;
	settings.DestinyPoints.X = string.format("%.0f", Position.Left["DestinyPoints"]);
	if Show["DestinyPoints"] and Where["DestinyPoints"] == 1 then DP[ "Ctr" ]:SetPosition( Position.Left["DestinyPoints"], Position.Top["DestinyPoints"] ); end

	oldLocX = settings.Shards.X / oldScreenWidth;
	Position.Left["Shards"] = oldLocX * screenWidth;
	settings.Shards.X = string.format("%.0f", Position.Left["Shards"]);
	if Show["Shards"] and Where["Shards"] == 1 then SP[ "Ctr" ]:SetPosition( Position.Left["Shards"], Position.Top["Shards"] ); end

	oldLocX = settings.SkirmishMarks.X / oldScreenWidth;
	Position.Left["SkirmishMarks"] = oldLocX * screenWidth;
	settings.SkirmishMarks.X = string.format("%.0f", Position.Left["SkirmishMarks"]);
	if Show["SkirmishMarks"] and Where["SkirmishMarks"] == 1 then SM[ "Ctr" ]:SetPosition( Position.Left["SkirmishMarks"], Position.Top["SkirmishMarks"] ); end
	
	oldLocX = settings.MithrilCoins.X / oldScreenWidth;
	Position.Left["MithrilCoins"] = oldLocX * screenWidth;
	settings.MithrilCoins.X = string.format("%.0f", Position.Left["MithrilCoins"]);
	if Show["MithrilCoins"] and Where["MithrilCoins"] == 1 then MC[ "Ctr" ]:SetPosition( Position.Left["MithrilCoins"], Position.Top["MithrilCoins"] ); end
	
	oldLocX = settings.YuleToken.X / oldScreenWidth;
	Position.Left["YuleToken"] = oldLocX * screenWidth;
	settings.YuleToken.X = string.format("%.0f", Position.Left["YuleToken"]);
	if Show["YuleToken"] and Where["YuleToken"] == 1 then YT[ "Ctr" ]:SetPosition( Position.Left["YuleToken"], Position.Top["YuleToken"] ); end

	ldLocX = settings.HytboldTokens.X / oldScreenWidth;
	Position.Left["HytboldTokens"] = oldLocX * screenWidth;
	settings.HytboldTokens.X = string.format("%.0f", Position.Left["HytboldTokens"]);
	if Show["HytboldTokens"] and Where["HytboldTokens"] == 1 then HT[ "Ctr" ]:SetPosition( Position.Left["HytboldTokens"], Position.Top["HytboldTokens"] ); end
	
	oldLocX = settings.Medallions.X / oldScreenWidth;
	Position.Left["Medallions"] = oldLocX * screenWidth;
	settings.Medallions.X = string.format("%.0f", Position.Left["Medallions"]);
	if Show["Medallions"] and Where["Medallions"] == 1 then MP[ "Ctr" ]:SetPosition( Position.Left["Medallions"], Position.Top["Medallions"] ); end

	oldLocX = settings.Seals.X / oldScreenWidth;
	Position.Left["Seals"] = oldLocX * screenWidth;
	settings.Seals.X = string.format("%.0f", Position.Left["Seals"]);
	if Show["Seals"] and Where["Seals"] == 1 then SL[ "Ctr" ]:SetPosition( Position.Left["Seals"], Position.Top["Seals"] ); end

	oldLocX = settings.Commendations.X / oldScreenWidth;
	Position.Left["Commendations"] = oldLocX * screenWidth;
	settings.Commendations.X = string.format("%.0f", Position.Left["Commendations"]);
	if Show["Commendations"] and Where["Commendations"] == 1 then CP[ "Ctr" ]:SetPosition( Position.Left["Commendations"], Position.Top["Commendations"] ); end

	oldLocX = settings.BagInfos.X / oldScreenWidth;
	_G.BILocX = oldLocX * screenWidth;
	settings.BagInfos.X = string.format("%.0f", _G.BILocX);
	if ShowBagInfos then BI[ "Ctr" ]:SetPosition( _G.BILocX, _G.BILocY ); end

	oldLocX = settings.PlayerInfos.X / oldScreenWidth;
	_G.PILocX = oldLocX * screenWidth;
	settings.PlayerInfos.X = string.format("%.0f", _G.PILocX);
	if ShowPlayerInfos then PI[ "Ctr" ]:SetPosition( _G.PILocX, _G.PILocY ); end

	oldLocX = settings.EquipInfos.X / oldScreenWidth;
	_G.EILocX = oldLocX * screenWidth;
	settings.EquipInfos.X = string.format("%.0f", _G.EILocX);
	if ShowEquipInfos then EI[ "Ctr" ]:SetPosition( _G.EILocX, _G.EILocY ); end

	oldLocX = settings.DurabilityInfos.X / oldScreenWidth;
	_G.DILocX = oldLocX * screenWidth;
	settings.DurabilityInfos.X = string.format("%.0f", _G.DILocX);
	if ShowDurabilityInfos then DI[ "Ctr" ]:SetPosition( _G.DILocX, _G.DILocY ); end

	oldLocX = settings.PlayerLoc.X / oldScreenWidth;
	_G.PLLocX = oldLocX * screenWidth;
	settings.PlayerLoc.X = string.format("%.0f", _G.PLLocX);
	if ShowPlayerLoc then PL[ "Ctr" ]:SetPosition( _G.PLLocX, _G.PLLocY ); end

	oldLocX = settings.TrackItems.X / oldScreenWidth;
	_G.TILocX = oldLocX * screenWidth;
	settings.TrackItems.X = string.format("%.0f", _G.TILocX);
	if ShowTrackItems then TI[ "Ctr" ]:SetPosition( _G.TILocX, _G.TILocY ); end

	oldLocX = settings.Infamy.X / oldScreenWidth;
	_G.IFLocX = oldLocX * screenWidth;
	settings.Infamy.X = string.format("%.0f", _G.IFLocX);
	if ShowInfamy then IF[ "Ctr" ]:SetPosition( _G.IFLocX, _G.IFLocY ); end

	oldLocX = settings.Vault.X / oldScreenWidth;
	_G.VTLocX = oldLocX * screenWidth;
	settings.Vault.X = string.format("%.0f", _G.VTLocX);
	if ShowVault then VT[ "Ctr" ]:SetPosition( _G.VTLocX, _G.VTLocY ); end

	oldLocX = settings.SharedStorage.X / oldScreenWidth;
	_G.SSLocX = oldLocX * screenWidth;
	settings.SharedStorage.X = string.format("%.0f", _G.SSLocX);
	if ShowSharedStorage then SS[ "Ctr" ]:SetPosition( _G.SSLocX, _G.SSLocY ); end

	--oldLocX = settings.Bank.X / oldScreenWidth;
	--_G.BKLocX = oldLocX * screenWidth;
	--settings.Bank.X = string.format("%.0f", _G.BKLocX);
	--if ShowBank then BK[ "Ctr" ]:SetPosition( _G.BKLocX, _G.BKLocY ); end

	oldLocX = settings.DayNight.X / oldScreenWidth;
	_G.DNLocX = oldLocX * screenWidth;
	settings.DayNight.X = string.format("%.0f", _G.DNLocX);
	if ShowDayNight then DN[ "Ctr" ]:SetPosition( _G.DNLocX, _G.DNLocY ); end

	oldLocX = settings.Reputation.X / oldScreenWidth;
	_G.RPLocX = oldLocX * screenWidth;
	settings.Reputation.X = string.format("%.0f", _G.RPLocX);
	if ShowReputation then RP[ "Ctr" ]:SetPosition( _G.RPLocX, _G.RPLocY ); end

	oldLocX = settings.LOTROPoints.X / oldScreenWidth;
	Position.Left["LOTROPoints"] = oldLocX * screenWidth;
	settings.LOTROPoints.X = string.format("%.0f", Position.Left["LOTROPoints"]);
	if Show["LOTROPoints"] and Where["LOTROPoints"] == 1 then LP[ "Ctr" ]:SetPosition( Position.Left["LOTROPoints"], Position.Top["LOTROPoints"] ); end

	oldLocX = settings.GameTime.X / oldScreenWidth;
	_G.GTLocX = oldLocX * screenWidth;
	settings.GameTime.X = string.format("%.0f", _G.GTLocX);
	if ShowGameTime then GT[ "Ctr" ]:SetPosition( _G.GTLocX, _G.GTLocY ); end
	
	oldLocX = settings.AmrothSilverPiece.X / oldScreenWidth;
	Position.Left["AmrothSilverPiece"] = oldLocX * screenWidth;
	settings.AmrothSilverPiece.X = string.format("%.0f", Position.Left["AmrothSilverPiece"]);
	if Show["AmrothSilverPiece"] and Where["AmrothSilverPiece"] == 1 then ASP[ "Ctr" ]:SetPosition( Position.Left["AmrothSilverPiece"], Position.Top["AmrothSilverPiece"] ); end
	
	oldLocX = settings.StarsofMerit.X / oldScreenWidth;
	Position.Left["StarsofMerit"] = oldLocX * screenWidth;
	settings.StarsofMerit.X = string.format("%.0f", Position.Left["StarsofMerit"]);
	if Show["StarsofMerit"] and Where["StarsofMerit"] == 1 then SOM[ "Ctr" ]:SetPosition( Position.Left["StarsofMerit"], Position.Top["StarsofMerit"] ); end
	
	oldLocX = settings.CentralGondorSilverPiece.X / oldScreenWidth;
	Position.Left["CentralGondorSilverPiece"] = oldLocX * screenWidth;
	settings.CentralGondorSilverPiece.X = string.format("%.0f", Position.Left["CentralGondorSilverPiece"]);
	if Show["CentralGondorSilverPiece"] and Where["CentralGondorSilverPiece"] == 1 then CGSP[ "Ctr" ]:SetPosition( Position.Left["CentralGondorSilverPiece"], Position.Top["CentralGondorSilverPiece"] ); end
	
	oldLocX = settings.GiftgiversBrand.X / oldScreenWidth;
	Position.Left["GiftgiversBrand"] = oldLocX * screenWidth;
	settings.GiftgiversBrand.X = string.format("%.0f", Position.Left["GiftgiversBrand"]);
	if Show["GiftgiversBrand"] and Where["GiftgiversBrand"] == 1 then GGB[ "Ctr" ]:SetPosition( Position.Left["GiftgiversBrand"], Position.Top["GiftgiversBrand"] ); end
	
	oldLocX = settings.BingoBadge.X / oldScreenWidth;
	Position.Left["BingoBadge"] = oldLocX * screenWidth;
	settings.BingoBadge.X = string.format("%.0f", Position.Left["BingoBadge"]);
	if Show["BingoBadge"] and Where["BingoBadge"] == 1 then BB[ "Ctr" ]:SetPosition( Position.Left["BingoBadge"], Position.Top["BingoBadge"] ); end
	
	oldLocX = settings.AnniversaryToken.X / oldScreenWidth;
	Position.Left["AnniversaryToken"] = oldLocX * screenWidth;
	settings.AnniversaryToken.X = string.format("%.0f", Position.Left["AnniversaryToken"]);
	if Show["AnniversaryToken"] and Where["AnniversaryToken"] == 1 then LAT[ "Ctr" ]:SetPosition( Position.Left["AnniversaryToken"], Position.Top["AnniversaryToken"] ); end
	
	oldLocX = settings.MotesOfEnchantment.X / oldScreenWidth;
	Position.Left["MotesOfEnchantment"] = oldLocX * screenWidth;
	settings.MotesOfEnchantment.X = string.format("%.0f", Position.Left["MotesOfEnchantment"]);
	if Show["MotesOfEnchantment"] and Where["MotesOfEnchantment"] == 1 then MOE[ "Ctr" ]:SetPosition( Position.Left["MotesOfEnchantment"], Position.Top["MotesOfEnchantment"] ); end
	
	oldLocX = settings.EmbersOfEnchantment.X / oldScreenWidth;
	Position.Left["EmbersOfEnchantment"] = oldLocX * screenWidth;
	settings.EmbersOfEnchantment.X = string.format("%.0f", Position.Left["EmbersOfEnchantment"]);
	if Show["EmbersOfEnchantment"] and Where["EmbersOfEnchantment"] == 1 then EOE[ "Ctr" ]:SetPosition( Position.Left["EmbersOfEnchantment"], Position.Top["EmbersOfEnchantment"] ); end
	
	oldLocX = settings.FigmentsOfSplendour.X / oldScreenWidth;
	Position.Left["FigmentsOfSplendour"] = oldLocX * screenWidth;
	settings.FigmentsOfSplendour.X = string.format("%.0f", Position.Left["FigmentsOfSplendour"]);
	if Show["FigmentsOfSplendour"] and Where["FigmentsOfSplendour"] == 1 then FOS[ "Ctr" ]:SetPosition( Position.Left["FigmentsOfSplendour"], Position.Top["FigmentsOfSplendour"] ); end
	
	oldLocX = settings.FallFestivalToken.X / oldScreenWidth;
	Position.Left["FallFestivalToken"] = oldLocX * screenWidth;
	settings.FallFestivalToken.X = string.format("%.0f", Position.Left["FallFestivalToken"]);
	if Show["FallFestivalToken"] and Where["FallFestivalToken"] == 1 then FFT[ "Ctr" ]:SetPosition( Position.Left["FallFestivalToken"], Position.Top["FallFestivalToken"] ); end
	
	oldLocX = settings.FarmersFaireToken.X / oldScreenWidth;
	Position.Left["FarmersFaireToken"] = oldLocX * screenWidth;
	settings.FarmersFaireToken.X = string.format("%.0f", Position.Left["FarmersFaireToken"]);
	if Show["FarmersFaireToken"] and Where["FarmersFaireToken"] == 1 then FFAT[ "Ctr" ]:SetPosition( Position.Left["FarmersFaireToken"], Position.Top["FarmersFaireToken"] ); end
	
	oldLocX = settings.SpringLeaf.X / oldScreenWidth;
	Position.Left["SpringLeaf"] = oldLocX * screenWidth;
	settings.SpringLeaf.X = string.format("%.0f", Position.Left["SpringLeaf"]);
	if Show["SpringLeaf"] and Where["SpringLeaf"] == 1 then SPL[ "Ctr" ]:SetPosition( Position.Left["SpringLeaf"], Position.Top["SpringLeaf"] ); end
	
	oldLocX = settings.MidsummerToken.X / oldScreenWidth;
	Position.Left["MidsummerToken"] = oldLocX * screenWidth;
	settings.MidsummerToken.X = string.format("%.0f", Position.Left["MidsummerToken"]);
	if Show["MidsummerToken"] and Where["MidsummerToken"] == 1 then MST[ "Ctr" ]:SetPosition( Position.Left["MidsummerToken"], Position.Top["MidsummerToken"] ); end
	
	oldLocX = settings.AncientScript.X / oldScreenWidth;
	Position.Left["AncientScript"] = oldLocX * screenWidth;
	settings.AncientScript.X = string.format("%.0f", Position.Left["AncientScript"]);
	if Show["AncientScript"] and Where["AncientScript"] == 1 then AS[ "Ctr" ]:SetPosition( Position.Left["AncientScript"], Position.Top["AncientScript"] ); end

    oldLocX = settings.BadgeOfTaste.X / oldScreenWidth;
    Position.Left["BadgeOfTaste"] = oldLocX * screenWidth;
    settings.BadgeOfTaste.X = string.format("%.0f", Position.Left["BadgeOfTaste"]);
    if Show["BadgeOfTaste"] and Where["BadgeOfTaste"] == 1 then BOT[ "Ctr" ]:SetPosition( Position.Left["BadgeOfTaste"], Position.Top["BadgeOfTaste"] ); end

    oldLocX = settings.BadgeOfDishonour.X / oldScreenWidth;
    Position.Left["BadgeOfDishonour"] = oldLocX * screenWidth;
    settings.BadgeOfDishonour.X = string.format("%.0f", Position.Left["BadgeOfDishonour"]);
    if Show["BadgeOfDishonour"] and Where["BadgeOfDishonour"] == 1 then BOD[ "Ctr" ]:SetPosition( Position.Left["BadgeOfDishonour"], Position.Top["BadgeOfDishonour"] ); end
	
	SaveSettings( false );
	write( L["TBSSCD"] );
end
