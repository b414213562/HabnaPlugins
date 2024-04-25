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
};
DoesNotHaveWhere = {
    ["Wallet"] = true;
}; 

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

    InitializeControlSettings(settings, "Wallet");

    InitializeControlSettings(settings, "Money");
	if settings.Money.S == nil then settings.Money.S = false; end --Show Total Money of all character on TitanBar Money control.
	if settings.Money.SS == nil then settings.Money.SS = true; end --Show sessions statistics
	if settings.Money.TS == nil then settings.Money.TS = true; end --Show today statistics
	_G.STM = settings.Money.S;
	_G.SSS = settings.Money.SS;
	_G.STS = settings.Money.TS;

    InitializeControlSettings(settings, "DestinyPoints");

    InitializeControlSettings(settings, "Shards");

	if settings.SkirmishMarks == nil then settings.SkirmishMarks = {}; end
	if settings.SkirmishMarks.V == nil then settings.SkirmishMarks.V = false; end
	if settings.SkirmishMarks.A == nil then settings.SkirmishMarks.A = string.format("%.3f", tA); end
	if settings.SkirmishMarks.R == nil then settings.SkirmishMarks.R = string.format("%.3f", tR); end
	if settings.SkirmishMarks.G == nil then settings.SkirmishMarks.G = string.format("%.3f", tG); end
	if settings.SkirmishMarks.B == nil then settings.SkirmishMarks.B = string.format("%.3f", tB); end
	if settings.SkirmishMarks.X == nil then settings.SkirmishMarks.X = string.format("%.0f", tX); end
	if settings.SkirmishMarks.Y == nil then settings.SkirmishMarks.Y = string.format("%.0f", tY); end
	if settings.SkirmishMarks.W == nil then settings.SkirmishMarks.W = string.format("%.0f", tW); end
	Show["SkirmishMarks"] = settings.SkirmishMarks.V;
	BC.Alpha["SkirmishMarks"] = tonumber(settings.SkirmishMarks.A);
	BC.Red["SkirmishMarks"] = tonumber(settings.SkirmishMarks.R);
	BC.Green["SkirmishMarks"] = tonumber(settings.SkirmishMarks.G);
	BC.Blue["SkirmishMarks"] = tonumber(settings.SkirmishMarks.B);
	Position.Left["SkirmishMarks"] = tonumber(settings.SkirmishMarks.X);
	Position.Top["SkirmishMarks"] = tonumber(settings.SkirmishMarks.Y);
	Where["SkirmishMarks"] = ParseWhere(settings, "SkirmishMarks");

	
	if settings.MithrilCoins == nil then settings.MithrilCoins = {}; end
	if settings.MithrilCoins.V == nil then settings.MithrilCoins.V = false; end
	if settings.MithrilCoins.A == nil then settings.MithrilCoins.A = string.format("%.3f", tA); end
	if settings.MithrilCoins.R == nil then settings.MithrilCoins.R = string.format("%.3f", tR); end
	if settings.MithrilCoins.G == nil then settings.MithrilCoins.G = string.format("%.3f", tG); end
	if settings.MithrilCoins.B == nil then settings.MithrilCoins.B = string.format("%.3f", tB); end
	if settings.MithrilCoins.X == nil then settings.MithrilCoins.X = string.format("%.0f", tX); end
	if settings.MithrilCoins.Y == nil then settings.MithrilCoins.Y = string.format("%.0f", tY); end
	if settings.MithrilCoins.W == nil then settings.MithrilCoins.W = string.format("%.0f", tW); end
	Show["MithrilCoins"] = settings.MithrilCoins.V;
	BC.Alpha["MithrilCoins"] = tonumber(settings.MithrilCoins.A);
	BC.Red["MithrilCoins"] = tonumber(settings.MithrilCoins.R);
	BC.Green["MithrilCoins"] = tonumber(settings.MithrilCoins.G);
	BC.Blue["MithrilCoins"] = tonumber(settings.MithrilCoins.B);
	Position.Left["MithrilCoins"] = tonumber(settings.MithrilCoins.X);
	Position.Top["MithrilCoins"] = tonumber(settings.MithrilCoins.Y);
    Where["MithrilCoins"] = ParseWhere(settings, "MithrilCoins");

	if settings.YuleToken == nil then settings.YuleToken = {}; end
	if settings.YuleToken.V == nil then settings.YuleToken.V = false; end
	if settings.YuleToken.A == nil then settings.YuleToken.A = string.format("%.3f", tA); end
	if settings.YuleToken.R == nil then settings.YuleToken.R = string.format("%.3f", tR); end
	if settings.YuleToken.G == nil then settings.YuleToken.G = string.format("%.3f", tG); end
	if settings.YuleToken.B == nil then settings.YuleToken.B = string.format("%.3f", tB); end
	if settings.YuleToken.X == nil then settings.YuleToken.X = string.format("%.0f", tX); end
	if settings.YuleToken.Y == nil then settings.YuleToken.Y = string.format("%.0f", tY); end
	if settings.YuleToken.W == nil then settings.YuleToken.W = string.format("%.0f", tW); end
	Show["YuleToken"] = settings.YuleToken.V;
	BC.Alpha["YuleToken"] = tonumber(settings.YuleToken.A);
	BC.Red["YuleToken"] = tonumber(settings.YuleToken.R);
	BC.Green["YuleToken"] = tonumber(settings.YuleToken.G);
	BC.Blue["YuleToken"] = tonumber(settings.YuleToken.B);
	Position.Left["YuleToken"] = tonumber(settings.YuleToken.X);
	Position.Top["YuleToken"] = tonumber(settings.YuleToken.Y);
    Where["YuleToken"] = ParseWhere(settings, "YuleToken");

	if settings.HytboldTokens == nil then settings.HytboldTokens = {}; end
	if settings.HytboldTokens.V == nil then settings.HytboldTokens.V = false; end
	if settings.HytboldTokens.A == nil then settings.HytboldTokens.A = string.format("%.3f", tA); end
	if settings.HytboldTokens.R == nil then settings.HytboldTokens.R = string.format("%.3f", tR); end
	if settings.HytboldTokens.G == nil then settings.HytboldTokens.G = string.format("%.3f", tG); end
	if settings.HytboldTokens.B == nil then settings.HytboldTokens.B = string.format("%.3f", tB); end
	if settings.HytboldTokens.X == nil then settings.HytboldTokens.X = string.format("%.0f", tX); end
	if settings.HytboldTokens.Y == nil then settings.HytboldTokens.Y = string.format("%.0f", tY); end
	if settings.HytboldTokens.W == nil then settings.HytboldTokens.W = string.format("%.0f", tW); end
	Show["HytboldTokens"] = settings.HytboldTokens.V;
	BC.Alpha["HytboldTokens"] = tonumber(settings.HytboldTokens.A);
	BC.Red["HytboldTokens"] = tonumber(settings.HytboldTokens.R);
	BC.Green["HytboldTokens"] = tonumber(settings.HytboldTokens.G);
	BC.Blue["HytboldTokens"] = tonumber(settings.HytboldTokens.B);
	Position.Left["HytboldTokens"] = tonumber(settings.HytboldTokens.X);
	Position.Top["HytboldTokens"] = tonumber(settings.HytboldTokens.Y);
    Where["HytboldTokens"] = ParseWhere(settings, "HytboldTokens");

	if settings.Medallions == nil then settings.Medallions = {}; end
	if settings.Medallions.V == nil then settings.Medallions.V = false; end
	if settings.Medallions.A == nil then settings.Medallions.A = string.format("%.3f", tA); end
	if settings.Medallions.R == nil then settings.Medallions.R = string.format("%.3f", tR); end
	if settings.Medallions.G == nil then settings.Medallions.G = string.format("%.3f", tG); end
	if settings.Medallions.B == nil then settings.Medallions.B = string.format("%.3f", tB); end
	if settings.Medallions.X == nil then settings.Medallions.X = string.format("%.0f", tX); end
	if settings.Medallions.Y == nil then settings.Medallions.Y = string.format("%.0f", tY); end
	if settings.Medallions.W == nil then settings.Medallions.W = string.format("%.0f", tW); end
	Show["Medallions"] = settings.Medallions.V;
	BC.Alpha["Medallions"] = tonumber(settings.Medallions.A);
	BC.Red["Medallions"] = tonumber(settings.Medallions.R);
	BC.Green["Medallions"] = tonumber(settings.Medallions.G);
	BC.Blue["Medallions"] = tonumber(settings.Medallions.B);
	Position.Left["Medallions"] = tonumber(settings.Medallions.X);
	Position.Top["Medallions"] = tonumber(settings.Medallions.Y);
    Where["Medallions"] = ParseWhere(settings, "Medallions");

	if settings.Seals == nil then settings.Seals = {}; end
	if settings.Seals.V == nil then settings.Seals.V = false; end
	if settings.Seals.A == nil then settings.Seals.A = string.format("%.3f", tA); end
	if settings.Seals.R == nil then settings.Seals.R = string.format("%.3f", tR); end
	if settings.Seals.G == nil then settings.Seals.G = string.format("%.3f", tG); end
	if settings.Seals.B == nil then settings.Seals.B = string.format("%.3f", tB); end
	if settings.Seals.X == nil then settings.Seals.X = string.format("%.0f", tX); end
	if settings.Seals.Y == nil then settings.Seals.Y = string.format("%.0f", tY); end
	if settings.Seals.W == nil then settings.Seals.W = string.format("%.0f", tW); end
	Show["Seals"] = settings.Seals.V;
	BC.Alpha["Seals"] = tonumber(settings.Seals.A);
	BC.Red["Seals"] = tonumber(settings.Seals.R);
	BC.Green["Seals"] = tonumber(settings.Seals.G);
	BC.Blue["Seals"] = tonumber(settings.Seals.B);
	Position.Left["Seals"] = tonumber(settings.Seals.X);
	Position.Top["Seals"] = tonumber(settings.Seals.Y);
    Where["Seals"] = ParseWhere(settings, "Seals");

    if settings.Commendations == nil then settings.Commendations = {}; end
	if settings.Commendations.V == nil then settings.Commendations.V = false; end
	if settings.Commendations.A == nil then settings.Commendations.A = string.format("%.3f", tA); end
	if settings.Commendations.R == nil then settings.Commendations.R = string.format("%.3f", tR); end
	if settings.Commendations.G == nil then settings.Commendations.G = string.format("%.3f", tG); end
	if settings.Commendations.B == nil then settings.Commendations.B = string.format("%.3f", tB); end
	if settings.Commendations.X == nil then settings.Commendations.X = string.format("%.0f", tX); end
	if settings.Commendations.Y == nil then settings.Commendations.Y = string.format("%.0f", tY); end
	if settings.Commendations.W == nil then settings.Commendations.W = string.format("%.0f", tW); end
	Show["Commendations"] = settings.Commendations.V;
	BC.Alpha["Commendations"] = tonumber(settings.Commendations.A);
	BC.Red["Commendations"] = tonumber(settings.Commendations.R);
	BC.Green["Commendations"] = tonumber(settings.Commendations.G);
	BC.Blue["Commendations"] = tonumber(settings.Commendations.B);
	Position.Left["Commendations"] = tonumber(settings.Commendations.X);
	Position.Top["Commendations"] = tonumber(settings.Commendations.Y);
    Where["Commendations"] = ParseWhere(settings, "Commendations");

    if settings.LOTROPoints == nil then settings.LOTROPoints = {}; end
	if settings.LOTROPoints.V == nil then settings.LOTROPoints.V = false; end
	if settings.LOTROPoints.A == nil then settings.LOTROPoints.A = string.format("%.3f", tA); end
	if settings.LOTROPoints.R == nil then settings.LOTROPoints.R = string.format("%.3f", tR); end
	if settings.LOTROPoints.G == nil then settings.LOTROPoints.G = string.format("%.3f", tG); end
	if settings.LOTROPoints.B == nil then settings.LOTROPoints.B = string.format("%.3f", tB); end
	if settings.LOTROPoints.X == nil then settings.LOTROPoints.X = string.format("%.0f", tX); end
	if settings.LOTROPoints.Y == nil then settings.LOTROPoints.Y = string.format("%.0f", tY); end
	if settings.LOTROPoints.L == nil then settings.LOTROPoints.L = string.format("%.0f", tL); end
	if settings.LOTROPoints.T == nil then settings.LOTROPoints.T = string.format("%.0f", tT); end
	if settings.LOTROPoints.W == nil then settings.LOTROPoints.W = string.format("%.0f", tW); end
	Show["LOTROPoints"] = settings.LOTROPoints.V;
	BC.Alpha["LOTROPoints"] = tonumber(settings.LOTROPoints.A);
	BC.Red["LOTROPoints"] = tonumber(settings.LOTROPoints.R);
	BC.Green["LOTROPoints"] = tonumber(settings.LOTROPoints.G);
	BC.Blue["LOTROPoints"] = tonumber(settings.LOTROPoints.B);
	Position.Left["LOTROPoints"] = tonumber(settings.LOTROPoints.X);
	Position.Top["LOTROPoints"] = tonumber(settings.LOTROPoints.Y);
	PositionW.Left["LOTROPoints"] = tonumber(settings.LOTROPoints.L);
	PositionW.Top["LOTROPoints"] = tonumber(settings.LOTROPoints.T);
    Where["LOTROPoints"] = ParseWhere(settings, "LOTROPoints");

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
	
	-- AU3 MARKER 4 - DO NOT REMOVE
	if settings.AmrothSilverPiece == nil then settings.AmrothSilverPiece = {}; end
	if settings.AmrothSilverPiece.V == nil then settings.AmrothSilverPiece.V = false; end
	if settings.AmrothSilverPiece.A == nil then settings.AmrothSilverPiece.A = string.format("%.3f", tA); end
	if settings.AmrothSilverPiece.R == nil then settings.AmrothSilverPiece.R = string.format("%.3f", tR); end
	if settings.AmrothSilverPiece.G == nil then settings.AmrothSilverPiece.G = string.format("%.3f", tG); end
	if settings.AmrothSilverPiece.B == nil then settings.AmrothSilverPiece.B = string.format("%.3f", tB); end
	if settings.AmrothSilverPiece.X == nil then settings.AmrothSilverPiece.X = string.format("%.0f", tX); end
	if settings.AmrothSilverPiece.Y == nil then settings.AmrothSilverPiece.Y = string.format("%.0f", tY); end
	if settings.AmrothSilverPiece.W == nil then settings.AmrothSilverPiece.W = string.format("%.0f", tW); end
	Show["AmrothSilverPiece"] = settings.AmrothSilverPiece.V;
	BC.Alpha["AmrothSilverPiece"] = tonumber(settings.AmrothSilverPiece.A);
	BC.Red["AmrothSilverPiece"] = tonumber(settings.AmrothSilverPiece.R);
	BC.Green["AmrothSilverPiece"] = tonumber(settings.AmrothSilverPiece.G);
	BC.Blue["AmrothSilverPiece"] = tonumber(settings.AmrothSilverPiece.B);
	Position.Left["AmrothSilverPiece"] = tonumber(settings.AmrothSilverPiece.X);
	Position.Top["AmrothSilverPiece"] = tonumber(settings.AmrothSilverPiece.Y);
    Where["AmrothSilverPiece"] = ParseWhere(settings, "AmrothSilverPiece");

	if settings.StarsofMerit == nil then settings.StarsofMerit = {}; end
	if settings.StarsofMerit.V == nil then settings.StarsofMerit.V = false; end
	if settings.StarsofMerit.A == nil then settings.StarsofMerit.A = string.format("%.3f", tA); end
	if settings.StarsofMerit.R == nil then settings.StarsofMerit.R = string.format("%.3f", tR); end
	if settings.StarsofMerit.G == nil then settings.StarsofMerit.G = string.format("%.3f", tG); end
	if settings.StarsofMerit.B == nil then settings.StarsofMerit.B = string.format("%.3f", tB); end
	if settings.StarsofMerit.X == nil then settings.StarsofMerit.X = string.format("%.0f", tX); end
	if settings.StarsofMerit.Y == nil then settings.StarsofMerit.Y = string.format("%.0f", tY); end
	if settings.StarsofMerit.W == nil then settings.StarsofMerit.W = string.format("%.0f", tW); end
	Show["StarsofMerit"] = settings.StarsofMerit.V;
	BC.Alpha["StarsofMerit"] = tonumber(settings.StarsofMerit.A);
	BC.Red["StarsofMerit"] = tonumber(settings.StarsofMerit.R);
	BC.Green["StarsofMerit"] = tonumber(settings.StarsofMerit.G);
	BC.Blue["StarsofMerit"] = tonumber(settings.StarsofMerit.B);
	Position.Left["StarsofMerit"] = tonumber(settings.StarsofMerit.X);
	Position.Top["StarsofMerit"] = tonumber(settings.StarsofMerit.Y);
    Where["StarsofMerit"] = ParseWhere(settings, "StarsofMerit");

    if settings.CentralGondorSilverPiece == nil then settings.CentralGondorSilverPiece = {}; end
	if settings.CentralGondorSilverPiece.V == nil then settings.CentralGondorSilverPiece.V = false; end
	if settings.CentralGondorSilverPiece.A == nil then settings.CentralGondorSilverPiece.A = string.format("%.3f", tA); end
	if settings.CentralGondorSilverPiece.R == nil then settings.CentralGondorSilverPiece.R = string.format("%.3f", tR); end
	if settings.CentralGondorSilverPiece.G == nil then settings.CentralGondorSilverPiece.G = string.format("%.3f", tG); end
	if settings.CentralGondorSilverPiece.B == nil then settings.CentralGondorSilverPiece.B = string.format("%.3f", tB); end
	if settings.CentralGondorSilverPiece.X == nil then settings.CentralGondorSilverPiece.X = string.format("%.0f", tX); end
	if settings.CentralGondorSilverPiece.Y == nil then settings.CentralGondorSilverPiece.Y = string.format("%.0f", tY); end
	if settings.CentralGondorSilverPiece.W == nil then settings.CentralGondorSilverPiece.W = string.format("%.0f", tW); end
	Show["CentralGondorSilverPiece"] = settings.CentralGondorSilverPiece.V;
	BC.Alpha["CentralGondorSilverPiece"] = tonumber(settings.CentralGondorSilverPiece.A);
	BC.Red["CentralGondorSilverPiece"] = tonumber(settings.CentralGondorSilverPiece.R);
	BC.Green["CentralGondorSilverPiece"] = tonumber(settings.CentralGondorSilverPiece.G);
	BC.Blue["CentralGondorSilverPiece"] = tonumber(settings.CentralGondorSilverPiece.B);
	Position.Left["CentralGondorSilverPiece"] = tonumber(settings.CentralGondorSilverPiece.X);
	Position.Top["CentralGondorSilverPiece"] = tonumber(settings.CentralGondorSilverPiece.Y);
    Where["CentralGondorSilverPiece"] = ParseWhere(settings, "CentralGondorSilverPiece");

	if settings.GiftgiversBrand == nil then settings.GiftgiversBrand = {}; end
	if settings.GiftgiversBrand.V == nil then settings.GiftgiversBrand.V = false; end
	if settings.GiftgiversBrand.A == nil then settings.GiftgiversBrand.A = string.format("%.3f", tA); end
	if settings.GiftgiversBrand.R == nil then settings.GiftgiversBrand.R = string.format("%.3f", tR); end
	if settings.GiftgiversBrand.G == nil then settings.GiftgiversBrand.G = string.format("%.3f", tG); end
	if settings.GiftgiversBrand.B == nil then settings.GiftgiversBrand.B = string.format("%.3f", tB); end
	if settings.GiftgiversBrand.X == nil then settings.GiftgiversBrand.X = string.format("%.0f", tX); end
	if settings.GiftgiversBrand.Y == nil then settings.GiftgiversBrand.Y = string.format("%.0f", tY); end
	if settings.GiftgiversBrand.W == nil then settings.GiftgiversBrand.W = string.format("%.0f", tW); end
	Show["GiftgiversBrand"] = settings.GiftgiversBrand.V;
	BC.Alpha["GiftgiversBrand"] = tonumber(settings.GiftgiversBrand.A);
	BC.Red["GiftgiversBrand"] = tonumber(settings.GiftgiversBrand.R);
	BC.Green["GiftgiversBrand"] = tonumber(settings.GiftgiversBrand.G);
	BC.Blue["GiftgiversBrand"] = tonumber(settings.GiftgiversBrand.B);
	Position.Left["GiftgiversBrand"] = tonumber(settings.GiftgiversBrand.X);
	Position.Top["GiftgiversBrand"] = tonumber(settings.GiftgiversBrand.Y);
    Where["GiftgiversBrand"] = ParseWhere(settings, "GiftgiversBrand");

    if settings.BingoBadge == nil then settings.BingoBadge = {}; end
	if settings.BingoBadge.V == nil then settings.BingoBadge.V = false; end
	if settings.BingoBadge.A == nil then settings.BingoBadge.A = string.format("%.3f", tA); end
	if settings.BingoBadge.R == nil then settings.BingoBadge.R = string.format("%.3f", tR); end
	if settings.BingoBadge.G == nil then settings.BingoBadge.G = string.format("%.3f", tG); end
	if settings.BingoBadge.B == nil then settings.BingoBadge.B = string.format("%.3f", tB); end
	if settings.BingoBadge.X == nil then settings.BingoBadge.X = string.format("%.0f", tX); end
	if settings.BingoBadge.Y == nil then settings.BingoBadge.Y = string.format("%.0f", tY); end
	if settings.BingoBadge.W == nil then settings.BingoBadge.W = string.format("%.0f", tW); end
	Show["BingoBadge"] = settings.BingoBadge.V;
	BC.Alpha["BingoBadge"] = tonumber(settings.BingoBadge.A);
	BC.Red["BingoBadge"] = tonumber(settings.BingoBadge.R);
	BC.Green["BingoBadge"] = tonumber(settings.BingoBadge.G);
	BC.Blue["BingoBadge"] = tonumber(settings.BingoBadge.B);
	Position.Left["BingoBadge"] = tonumber(settings.BingoBadge.X);
	Position.Top["BingoBadge"] = tonumber(settings.BingoBadge.Y);
    Where["BingoBadge"] = ParseWhere(settings, "BingoBadge");

    if settings.AnniversaryToken == nil then settings.AnniversaryToken = {}; end
	if settings.AnniversaryToken.V == nil then settings.AnniversaryToken.V = false; end
	if settings.AnniversaryToken.A == nil then settings.AnniversaryToken.A = string.format("%.3f", tA); end
	if settings.AnniversaryToken.R == nil then settings.AnniversaryToken.R = string.format("%.3f", tR); end
	if settings.AnniversaryToken.G == nil then settings.AnniversaryToken.G = string.format("%.3f", tG); end
	if settings.AnniversaryToken.B == nil then settings.AnniversaryToken.B = string.format("%.3f", tB); end
	if settings.AnniversaryToken.X == nil then settings.AnniversaryToken.X = string.format("%.0f", tX); end
	if settings.AnniversaryToken.Y == nil then settings.AnniversaryToken.Y = string.format("%.0f", tY); end
	if settings.AnniversaryToken.W == nil then settings.AnniversaryToken.W = string.format("%.0f", tW); end
	Show["AnniversaryToken"] = settings.AnniversaryToken.V;
	BC.Alpha["AnniversaryToken"] = tonumber(settings.AnniversaryToken.A);
	BC.Red["AnniversaryToken"] = tonumber(settings.AnniversaryToken.R);
	BC.Green["AnniversaryToken"] = tonumber(settings.AnniversaryToken.G);
	BC.Blue["AnniversaryToken"] = tonumber(settings.AnniversaryToken.B);
	Position.Left["AnniversaryToken"] = tonumber(settings.AnniversaryToken.X);
	Position.Top["AnniversaryToken"] = tonumber(settings.AnniversaryToken.Y);
    Where["AnniversaryToken"] = ParseWhere(settings, "AnniversaryToken");

    if settings.MotesOfEnchantment == nil then settings.MotesOfEnchantment = {}; end
	if settings.MotesOfEnchantment.V == nil then settings.MotesOfEnchantment.V = false; end
	if settings.MotesOfEnchantment.A == nil then settings.MotesOfEnchantment.A = string.format("%.3f", tA); end
	if settings.MotesOfEnchantment.R == nil then settings.MotesOfEnchantment.R = string.format("%.3f", tR); end
	if settings.MotesOfEnchantment.G == nil then settings.MotesOfEnchantment.G = string.format("%.3f", tG); end
	if settings.MotesOfEnchantment.B == nil then settings.MotesOfEnchantment.B = string.format("%.3f", tB); end
	if settings.MotesOfEnchantment.X == nil then settings.MotesOfEnchantment.X = string.format("%.0f", tX); end
	if settings.MotesOfEnchantment.Y == nil then settings.MotesOfEnchantment.Y = string.format("%.0f", tY); end
	if settings.MotesOfEnchantment.W == nil then settings.MotesOfEnchantment.W = string.format("%.0f", tW); end
	ShowMotesOfEnchantment = settings.MotesOfEnchantment.V;
	MOEbcAlpha = tonumber(settings.MotesOfEnchantment.A);
	MOEbcRed = tonumber(settings.MotesOfEnchantment.R);
	MOEbcGreen = tonumber(settings.MotesOfEnchantment.G);
	MOEbcAlphabcBlue = tonumber(settings.MotesOfEnchantment.B);
	_G.MOELocX = tonumber(settings.MotesOfEnchantment.X);
	_G.MOELocY = tonumber(settings.MotesOfEnchantment.Y);
	_G.MOEWhere = tonumber(settings.MotesOfEnchantment.W);
	if _G.MOEWhere == 3 and ShowMotesOfEnchantment then _G.MOEWhere = 1; settings.MotesOfEnchantment.W = string.format("%.0f", _G.MOEWhere); end	

	if settings.EmbersOfEnchantment == nil then settings.EmbersOfEnchantment = {}; end
	if settings.EmbersOfEnchantment.V == nil then settings.EmbersOfEnchantment.V = false; end
	if settings.EmbersOfEnchantment.A == nil then settings.EmbersOfEnchantment.A = string.format("%.3f", tA); end
	if settings.EmbersOfEnchantment.R == nil then settings.EmbersOfEnchantment.R = string.format("%.3f", tR); end
	if settings.EmbersOfEnchantment.G == nil then settings.EmbersOfEnchantment.G = string.format("%.3f", tG); end
	if settings.EmbersOfEnchantment.B == nil then settings.EmbersOfEnchantment.B = string.format("%.3f", tB); end
	if settings.EmbersOfEnchantment.X == nil then settings.EmbersOfEnchantment.X = string.format("%.0f", tX); end
	if settings.EmbersOfEnchantment.Y == nil then settings.EmbersOfEnchantment.Y = string.format("%.0f", tY); end
	if settings.EmbersOfEnchantment.W == nil then settings.EmbersOfEnchantment.W = string.format("%.0f", tW); end
	Show["EmbersOfEnchantment"] = settings.EmbersOfEnchantment.V;
	BC.Alpha["EmbersOfEnchantment"] = tonumber(settings.EmbersOfEnchantment.A);
	BC.Red["EmbersOfEnchantment"] = tonumber(settings.EmbersOfEnchantment.R);
	BC.Green["EmbersOfEnchantment"] = tonumber(settings.EmbersOfEnchantment.G);
	BC.Blue["EmbersOfEnchantment"] = tonumber(settings.EmbersOfEnchantment.B);
	Position.Left["EmbersOfEnchantment"] = tonumber(settings.EmbersOfEnchantment.X);
	Position.Top["EmbersOfEnchantment"] = tonumber(settings.EmbersOfEnchantment.Y);
	Where["EmbersOfEnchantment"] = ParseWhere(settings, "EmbersOfEnchantment");
	
	if settings.FigmentsOfSplendour == nil then settings.FigmentsOfSplendour = {}; end
	if settings.FigmentsOfSplendour.V == nil then settings.FigmentsOfSplendour.V = false; end
	if settings.FigmentsOfSplendour.A == nil then settings.FigmentsOfSplendour.A = string.format("%.3f", tA); end
	if settings.FigmentsOfSplendour.R == nil then settings.FigmentsOfSplendour.R = string.format("%.3f", tR); end
	if settings.FigmentsOfSplendour.G == nil then settings.FigmentsOfSplendour.G = string.format("%.3f", tG); end
	if settings.FigmentsOfSplendour.B == nil then settings.FigmentsOfSplendour.B = string.format("%.3f", tB); end
	if settings.FigmentsOfSplendour.X == nil then settings.FigmentsOfSplendour.X = string.format("%.0f", tX); end
	if settings.FigmentsOfSplendour.Y == nil then settings.FigmentsOfSplendour.Y = string.format("%.0f", tY); end
	if settings.FigmentsOfSplendour.W == nil then settings.FigmentsOfSplendour.W = string.format("%.0f", tW); end
	ShowFigmentsOfSplendour = settings.FigmentsOfSplendour.V;
	FOSbcAlpha = tonumber(settings.FigmentsOfSplendour.A);
	FOSbcRed = tonumber(settings.FigmentsOfSplendour.R);
	FOSbcGreen = tonumber(settings.FigmentsOfSplendour.G);
	FOSbcBlue = tonumber(settings.FigmentsOfSplendour.B);
	_G.FOSLocX = tonumber(settings.FigmentsOfSplendour.X);
	_G.FOSLocY = tonumber(settings.FigmentsOfSplendour.Y);
	_G.FOSWhere = tonumber(settings.FigmentsOfSplendour.W);
	if _G.FOSWhere == 3 and ShowFigmentsOfSplendour then _G.FOSWhere = 1; settings.FigmentsOfSplendour.W = string.format("%.0f", _G.FOSWhere); end
	
	if settings.FallFestivalToken == nil then settings.FallFestivalToken = {}; end
	if settings.FallFestivalToken.V == nil then settings.FallFestivalToken.V = false; end
	if settings.FallFestivalToken.A == nil then settings.FallFestivalToken.A = string.format("%.3f", tA); end
	if settings.FallFestivalToken.R == nil then settings.FallFestivalToken.R = string.format("%.3f", tR); end
	if settings.FallFestivalToken.G == nil then settings.FallFestivalToken.G = string.format("%.3f", tG); end
	if settings.FallFestivalToken.B == nil then settings.FallFestivalToken.B = string.format("%.3f", tB); end
	if settings.FallFestivalToken.X == nil then settings.FallFestivalToken.X = string.format("%.0f", tX); end
	if settings.FallFestivalToken.Y == nil then settings.FallFestivalToken.Y = string.format("%.0f", tY); end
	if settings.FallFestivalToken.W == nil then settings.FallFestivalToken.W = string.format("%.0f", tW); end
	ShowFallFestivalToken = settings.FallFestivalToken.V;
	FFTbcAlpha = tonumber(settings.FallFestivalToken.A);
	FFTbcRed = tonumber(settings.FallFestivalToken.R);
	FFTbcGreen = tonumber(settings.FallFestivalToken.G);
	FFTbcBlue = tonumber(settings.FallFestivalToken.B);
	_G.FFTLocX = tonumber(settings.FallFestivalToken.X);
	_G.FFTLocY = tonumber(settings.FallFestivalToken.Y);
	_G.FFTWhere = tonumber(settings.FallFestivalToken.W);
	if _G.FFTWhere == 3 and ShowFallFestivalToken then _G.FFTWhere = 1; settings.FallFestivalToken.W = string.format("%.0f", _G.FFTWhere); end
	
	if settings.FarmersFaireToken == nil then settings.FarmersFaireToken= {}; end
	if settings.FarmersFaireToken.V == nil then settings.FarmersFaireToken.V = false; end
	if settings.FarmersFaireToken.A == nil then settings.FarmersFaireToken.A = string.format("%.3f", tA); end
	if settings.FarmersFaireToken.R == nil then settings.FarmersFaireToken.R = string.format("%.3f", tR); end
	if settings.FarmersFaireToken.G == nil then settings.FarmersFaireToken.G = string.format("%.3f", tG); end
	if settings.FarmersFaireToken.B == nil then settings.FarmersFaireToken.B = string.format("%.3f", tB); end
	if settings.FarmersFaireToken.X == nil then settings.FarmersFaireToken.X = string.format("%.0f", tX); end
	if settings.FarmersFaireToken.Y == nil then settings.FarmersFaireToken.Y = string.format("%.0f", tY); end
	if settings.FarmersFaireToken.W == nil then settings.FarmersFaireToken.W = string.format("%.0f", tW); end
	ShowFarmersFaireToken = settings.FarmersFaireToken.V;
	FFATbcAlpha = tonumber(settings.FarmersFaireToken.A);
	FFATbcRed = tonumber(settings.FarmersFaireToken.R);
	FFATbcGreen = tonumber(settings.FarmersFaireToken.G);
	FFATbcBlue = tonumber(settings.FarmersFaireToken.B);
	_G.FFATLocX = tonumber(settings.FarmersFaireToken.X);
	_G.FFATLocY = tonumber(settings.FarmersFaireToken.Y);
	_G.FFATWhere = tonumber(settings.FarmersFaireToken.W);
	if _G.FFATWhere == 3 and ShowFarmersFaireToken then _G.FFATWhere = 1; settings.FarmersFaireToken.W = string.format("%.0f", _G.FFATWhere); end
	
	if settings.SpringLeaf == nil then settings.SpringLeaf= {}; end
	if settings.SpringLeaf.V == nil then settings.SpringLeaf.V = false; end
	if settings.SpringLeaf.A == nil then settings.SpringLeaf.A = string.format("%.3f", tA); end
	if settings.SpringLeaf.R == nil then settings.SpringLeaf.R = string.format("%.3f", tR); end
	if settings.SpringLeaf.G == nil then settings.SpringLeaf.G = string.format("%.3f", tG); end
	if settings.SpringLeaf.B == nil then settings.SpringLeaf.B = string.format("%.3f", tB); end
	if settings.SpringLeaf.X == nil then settings.SpringLeaf.X = string.format("%.0f", tX); end
	if settings.SpringLeaf.Y == nil then settings.SpringLeaf.Y = string.format("%.0f", tY); end
	if settings.SpringLeaf.W == nil then settings.SpringLeaf.W = string.format("%.0f", tW); end
	ShowSpringLeaf = settings.SpringLeaf.V;
	SPLbcAlpha = tonumber(settings.SpringLeaf.A);
	SPLbcRed = tonumber(settings.SpringLeaf.R);
	SPLbcGreen = tonumber(settings.SpringLeaf.G);
	SPLbcBlue = tonumber(settings.SpringLeaf.B);
	_G.SPLLocX = tonumber(settings.SpringLeaf.X);
	_G.SPLLocY = tonumber(settings.SpringLeaf.Y);
	_G.SPLWhere = tonumber(settings.SpringLeaf.W);
	if _G.SPLWhere == 3 and ShowSpringLeaf then _G.SPLWhere = 1; settings.SpringLeaf.W = string.format("%.0f", _G.SPLWhere); end
	
	if settings.MidsummerToken == nil then settings.MidsummerToken= {}; end
	if settings.MidsummerToken.V == nil then settings.MidsummerToken.V = false; end
	if settings.MidsummerToken.A == nil then settings.MidsummerToken.A = string.format("%.3f", tA); end
	if settings.MidsummerToken.R == nil then settings.MidsummerToken.R = string.format("%.3f", tR); end
	if settings.MidsummerToken.G == nil then settings.MidsummerToken.G = string.format("%.3f", tG); end
	if settings.MidsummerToken.B == nil then settings.MidsummerToken.B = string.format("%.3f", tB); end
	if settings.MidsummerToken.X == nil then settings.MidsummerToken.X = string.format("%.0f", tX); end
	if settings.MidsummerToken.Y == nil then settings.MidsummerToken.Y = string.format("%.0f", tY); end
	if settings.MidsummerToken.W == nil then settings.MidsummerToken.W = string.format("%.0f", tW); end
	ShowMidsummerToken = settings.MidsummerToken.V;
	MSTbcAlpha = tonumber(settings.MidsummerToken.A);
	MSTbcRed = tonumber(settings.MidsummerToken.R);
	MSTbcGreen = tonumber(settings.MidsummerToken.G);
	MSTbcBlue = tonumber(settings.MidsummerToken.B);
	_G.MSTLocX = tonumber(settings.MidsummerToken.X);
	_G.MSTLocY = tonumber(settings.MidsummerToken.Y);
	_G.MSTWhere = tonumber(settings.MidsummerToken.W);
	if _G.MSTWhere == 3 and ShowMidsummerToken then _G.MSTWhere = 1; settings.MidsummerToken.W = string.format("%.0f", _G.MSTWhere); end
	
	if settings.AncientScript == nil then settings.AncientScript= {}; end
	if settings.AncientScript.V == nil then settings.AncientScript.V = false; end
	if settings.AncientScript.A == nil then settings.AncientScript.A = string.format("%.3f", tA); end
	if settings.AncientScript.R == nil then settings.AncientScript.R = string.format("%.3f", tR); end
	if settings.AncientScript.G == nil then settings.AncientScript.G = string.format("%.3f", tG); end
	if settings.AncientScript.B == nil then settings.AncientScript.B = string.format("%.3f", tB); end
	if settings.AncientScript.X == nil then settings.AncientScript.X = string.format("%.0f", tX); end
	if settings.AncientScript.Y == nil then settings.AncientScript.Y = string.format("%.0f", tY); end
	if settings.AncientScript.W == nil then settings.AncientScript.W = string.format("%.0f", tW); end
	ShowAncientScript = settings.AncientScript.V;
	ASbcAlpha = tonumber(settings.AncientScript.A);
	ASbcRed = tonumber(settings.AncientScript.R);
	ASbcGreen = tonumber(settings.AncientScript.G);
	ASbcBlue = tonumber(settings.AncientScript.B);
	_G.ASLocX = tonumber(settings.AncientScript.X);
	_G.ASLocY = tonumber(settings.AncientScript.Y);
	_G.ASWhere = tonumber(settings.AncientScript.W);
	if _G.ASWhere == 3 and ShowAncientScript then _G.ASWhere = 1; settings.AncientScript.W = string.format("%.0f", _G.ASWhere); end

    if settings.BadgeOfTaste == nil then settings.BadgeOfTaste = {}; end
    if settings.BadgeOfTaste.V == nil then settings.BadgeOfTaste.V = false; end
    if settings.BadgeOfTaste.A == nil then settings.BadgeOfTaste.A = string.format("%.3f", tA); end
    if settings.BadgeOfTaste.R == nil then settings.BadgeOfTaste.R = string.format("%.3f", tR); end
    if settings.BadgeOfTaste.G == nil then settings.BadgeOfTaste.G = string.format("%.3f", tG); end
    if settings.BadgeOfTaste.B == nil then settings.BadgeOfTaste.B = string.format("%.3f", tB); end
    if settings.BadgeOfTaste.X == nil then settings.BadgeOfTaste.X = string.format("%.0f", tX); end
    if settings.BadgeOfTaste.Y == nil then settings.BadgeOfTaste.Y = string.format("%.0f", tY); end
    if settings.BadgeOfTaste.W == nil then settings.BadgeOfTaste.W = string.format("%.0f", tW); end
    ShowBadgeOfTaste = settings.BadgeOfTaste.V;
    BOTbcAlpha = tonumber(settings.BadgeOfTaste.A);
    BOTbcRed = tonumber(settings.BadgeOfTaste.R);
    BOTbcGreen = tonumber(settings.BadgeOfTaste.G);
    BOTbcBlue = tonumber(settings.BadgeOfTaste.B);
    _G.BOTLocX = tonumber(settings.BadgeOfTaste.X);
    _G.BOTLocY = tonumber(settings.BadgeOfTaste.Y);
    _G.BOTWhere = tonumber(settings.BadgeOfTaste.W);
    if _G.BOTWhere == 3 and ShowBadgeOfTaste then _G.BOTWhere = 1; settings.BadgeOfTaste.W = string.format("%.0f", _G.BOTWhere); end
    
    if settings.BadgeOfDishonour == nil then settings.BadgeOfDishonour = {}; end
    if settings.BadgeOfDishonour.V == nil then settings.BadgeOfDishonour.V = false; end
    if settings.BadgeOfDishonour.A == nil then settings.BadgeOfDishonour.A = string.format("%.3f", tA); end
    if settings.BadgeOfDishonour.R == nil then settings.BadgeOfDishonour.R = string.format("%.3f", tR); end
    if settings.BadgeOfDishonour.G == nil then settings.BadgeOfDishonour.G = string.format("%.3f", tG); end
    if settings.BadgeOfDishonour.B == nil then settings.BadgeOfDishonour.B = string.format("%.3f", tB); end
    if settings.BadgeOfDishonour.X == nil then settings.BadgeOfDishonour.X = string.format("%.0f", tX); end
    if settings.BadgeOfDishonour.Y == nil then settings.BadgeOfDishonour.Y = string.format("%.0f", tY); end
    if settings.BadgeOfDishonour.W == nil then settings.BadgeOfDishonour.W = string.format("%.0f", tW); end
    ShowBadgeOfDishonour = settings.BadgeOfDishonour.V;
    BODbcAlpha = tonumber(settings.BadgeOfDishonour.A);
    BODbcRed = tonumber(settings.BadgeOfDishonour.R);
    BODbcGreen = tonumber(settings.BadgeOfDishonour.G);
    BODbcBlue = tonumber(settings.BadgeOfDishonour.B);
    _G.BODLocX = tonumber(settings.BadgeOfDishonour.X);
    _G.BODLocY = tonumber(settings.BadgeOfDishonour.Y);
    _G.BODWhere = tonumber(settings.BadgeOfDishonour.W);
    if _G.BODWhere == 3 and ShowBadgeOfDishonour then _G.BODWhere = 1; settings.BadgeOfDishonour.W = string.format("%.0f", _G.BODWhere); end
    
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

		settings.Wallet = {};
		settings.Wallet.V = Show["Wallet"];
		settings.Wallet.A = string.format("%.3f", BC.Alpha["Wallet"]);
		settings.Wallet.R = string.format("%.3f", BC.Red["Wallet"]);
		settings.Wallet.G = string.format("%.3f", BC.Green["Wallet"]);
		settings.Wallet.B = string.format("%.3f", BC.Blue["Wallet"]);
		settings.Wallet.X = string.format("%.0f", Position.Left["Wallet"]);
		settings.Wallet.Y = string.format("%.0f", Position.Top["Wallet"]);
		settings.Wallet.L = string.format("%.0f", PositionW.Left["Wallet"]);
		settings.Wallet.T = string.format("%.0f", PositionW.Top["Wallet"]);

		settings.Money = {};
		settings.Money.V = Show["Money"];
		settings.Money.A = string.format("%.3f", BC.Alpha["Money"]);
		settings.Money.R = string.format("%.3f", BC.Red["Money"]);
		settings.Money.G = string.format("%.3f", BC.Green["Money"]);
		settings.Money.B = string.format("%.3f", BC.Blue["Money"]);
		settings.Money.X = string.format("%.0f", Position.Left["Money"]);
		settings.Money.Y = string.format("%.0f", Position.Top["Money"]);
		settings.Money.W = string.format("%.0f", Where["Money"]);
		settings.Money.S = _G.STM; --Show Total Money of all character on TitanBar Money control.
		settings.Money.SS = _G.SSS; --Show sessions statistics in money tooltip.
		settings.Money.TS = _G.STS; --Show today statistics in money tooltip
		if PlayerAlign == 1 then settings.Money.L = string.format("%.0f", PositionW.Left["Money"]); end
		if PlayerAlign == 1 then settings.Money.T = string.format("%.0f", PositionW.Top["Money"]); end

		settings.DestinyPoints = {};
		settings.DestinyPoints.V = Show["DestinyPoints"];
		settings.DestinyPoints.A = string.format("%.3f", BC.Alpha["DestinyPoints"]);
		settings.DestinyPoints.R = string.format("%.3f", BC.Red["DestinyPoints"]);
		settings.DestinyPoints.G = string.format("%.3f", BC.Green["DestinyPoints"]);
		settings.DestinyPoints.B = string.format("%.3f", BC.Blue["DestinyPoints"]);
		settings.DestinyPoints.X = string.format("%.0f", Position.Left["DestinyPoints"]);
		settings.DestinyPoints.Y = string.format("%.0f", Position.Top["DestinyPoints"]);
		settings.DestinyPoints.W = string.format("%.0f", Where["DestinyPoints"]);

		settings.Shards = {};
		settings.Shards.V = Show["Shards"];
		settings.Shards.A = string.format("%.3f", BC.Alpha["Shards"]);
		settings.Shards.R = string.format("%.3f", BC.Red["Shards"]);
		settings.Shards.G = string.format("%.3f", BC.Green["Shards"]);
		settings.Shards.B = string.format("%.3f", BC.Blue["Shards"]);
		settings.Shards.X = string.format("%.0f", Position.Left["Shards"]);
		settings.Shards.Y = string.format("%.0f", Position.Top["Shards"]);
		settings.Shards.W = string.format("%.0f", Where["Shards"]);

		settings.SkirmishMarks = {};
		settings.SkirmishMarks.V = Show["SkirmishMarks"];
		settings.SkirmishMarks.A = string.format("%.3f", BC.Alpha["SkirmishMarks"]);
		settings.SkirmishMarks.R = string.format("%.3f", BC.Red["SkirmishMarks"]);
		settings.SkirmishMarks.G = string.format("%.3f", BC.Green["SkirmishMarks"]);
		settings.SkirmishMarks.B = string.format("%.3f", BC.Blue["SkirmishMarks"]);
		settings.SkirmishMarks.X = string.format("%.0f", Position.Left["SkirmishMarks"]);
		settings.SkirmishMarks.Y = string.format("%.0f", Position.Top["SkirmishMarks"]);
		settings.SkirmishMarks.W = string.format("%.0f", Where["SkirmishMarks"]);

		settings.MithrilCoins = {};
		settings.MithrilCoins.V = Show["MithrilCoins"];
		settings.MithrilCoins.A = string.format("%.3f", BC.Alpha["MithrilCoins"]);
		settings.MithrilCoins.R = string.format("%.3f", BC.Red["MithrilCoins"]);
		settings.MithrilCoins.G = string.format("%.3f", BC.Green["MithrilCoins"]);
		settings.MithrilCoins.B = string.format("%.3f", BC.Blue["MithrilCoins"]);
		settings.MithrilCoins.X = string.format("%.0f", Position.Left["MithrilCoins"]);
		settings.MithrilCoins.Y = string.format("%.0f", Position.Top["MithrilCoins"]);
		settings.MithrilCoins.W = string.format("%.0f", Where["MithrilCoins"]);

		settings.YuleToken = {};
		settings.YuleToken.V = Show["YuleToken"];
		settings.YuleToken.A = string.format("%.3f", BC.Alpha["YuleToken"]);
		settings.YuleToken.R = string.format("%.3f", BC.Red["YuleToken"]);
		settings.YuleToken.G = string.format("%.3f", BC.Green["YuleToken"]);
		settings.YuleToken.B = string.format("%.3f", BC.Blue["YuleToken"]);
		settings.YuleToken.X = string.format("%.0f", Position.Left["YuleToken"]);
		settings.YuleToken.Y = string.format("%.0f", Position.Top["YuleToken"]);
		settings.YuleToken.W = string.format("%.0f", Where["YuleToken"]);
		
		settings.HytboldTokens = {};
		settings.HytboldTokens.V = Show["HytboldTokens"];
		settings.HytboldTokens.A = string.format("%.3f", BC.Alpha["HytboldTokens"]);
		settings.HytboldTokens.R = string.format("%.3f", BC.Red["HytboldTokens"]);
		settings.HytboldTokens.G = string.format("%.3f", BC.Green["HytboldTokens"]);
		settings.HytboldTokens.B = string.format("%.3f", BC.Blue["HytboldTokens"]);
		settings.HytboldTokens.X = string.format("%.0f", Position.Left["HytboldTokens"]);
		settings.HytboldTokens.Y = string.format("%.0f", Position.Top["HytboldTokens"]);
		settings.HytboldTokens.W = string.format("%.0f", Where["HytboldTokens"]);
		
		settings.Medallions = {};
		settings.Medallions.V = Show["Medallions"];
		settings.Medallions.A = string.format("%.3f", BC.Alpha["Medallions"]);
		settings.Medallions.R = string.format("%.3f", BC.Red["Medallions"]);
		settings.Medallions.G = string.format("%.3f", BC.Green["Medallions"]);
		settings.Medallions.B = string.format("%.3f", BC.Blue["Medallions"]);
		settings.Medallions.X = string.format("%.0f", Position.Left["Medallions"]);
		settings.Medallions.Y = string.format("%.0f", Position.Top["Medallions"]);
		settings.Medallions.W = string.format("%.0f", Where["Medallions"]);

		settings.Seals = {};
		settings.Seals.V = Show["Seals"];
		settings.Seals.A = string.format("%.3f", BC.Alpha["Seals"]);
		settings.Seals.R = string.format("%.3f", BC.Red["Seals"]);
		settings.Seals.G = string.format("%.3f", BC.Green["Seals"]);
		settings.Seals.B = string.format("%.3f", BC.Blue["Seals"]);
		settings.Seals.X = string.format("%.0f", Position.Left["Seals"]);
		settings.Seals.Y = string.format("%.0f", Position.Top["Seals"]);
		settings.Seals.W = string.format("%.0f", Where["Seals"]);

		settings.Commendations = {};
		settings.Commendations.V = Show["Commendations"];
		settings.Commendations.A = string.format("%.3f", BC.Alpha["Commendations"]);
		settings.Commendations.R = string.format("%.3f", BC.Red["Commendations"]);
		settings.Commendations.G = string.format("%.3f", BC.Green["Commendations"]);
		settings.Commendations.B = string.format("%.3f", BC.Blue["Commendations"]);
		settings.Commendations.X = string.format("%.0f", Position.Left["Commendations"]);
		settings.Commendations.Y = string.format("%.0f", Position.Top["Commendations"]);
		settings.Commendations.W = string.format("%.0f", Where["Commendations"]);

		settings.LOTROPoints = {};
		settings.LOTROPoints.V = Show["LOTROPoints"];
		settings.LOTROPoints.A = string.format("%.3f", BC.Alpha["LOTROPoints"]);
		settings.LOTROPoints.R = string.format("%.3f", BC.Red["LOTROPoints"]);
		settings.LOTROPoints.G = string.format("%.3f", BC.Green["LOTROPoints"]);
		settings.LOTROPoints.B = string.format("%.3f", BC.Blue["LOTROPoints"]);
		settings.LOTROPoints.X = string.format("%.0f", Position.Left["LOTROPoints"]);
		settings.LOTROPoints.Y = string.format("%.0f", Position.Top["LOTROPoints"]);
		settings.LOTROPoints.L = string.format("%.0f", PositionW.Left["LOTROPoints"]);
		settings.LOTROPoints.T = string.format("%.0f", PositionW.Top["LOTROPoints"]);
		settings.LOTROPoints.W = string.format("%.0f", Where["LOTROPoints"]);

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
		
		settings.AmrothSilverPiece = {};
		settings.AmrothSilverPiece.V = Show["AmrothSilverPiece"];
		settings.AmrothSilverPiece.A = string.format("%.3f", BC.Alpha["AmrothSilverPiece"]);
		settings.AmrothSilverPiece.R = string.format("%.3f", BC.Red["AmrothSilverPiece"]);
		settings.AmrothSilverPiece.G = string.format("%.3f", BC.Green["AmrothSilverPiece"]);
		settings.AmrothSilverPiece.B = string.format("%.3f", BC.Blue["AmrothSilverPiece"]);
		settings.AmrothSilverPiece.X = string.format("%.0f", Position.Left["AmrothSilverPiece"]);
		settings.AmrothSilverPiece.Y = string.format("%.0f", Position.Top["AmrothSilverPiece"]);
		settings.AmrothSilverPiece.W = string.format("%.0f", Where["AmrothSilverPiece"]);
		
		settings.StarsofMerit = {};
		settings.StarsofMerit.V = Show["StarsofMerit"];
		settings.StarsofMerit.A = string.format("%.3f", BC.Alpha["StarsofMerit"]);
		settings.StarsofMerit.R = string.format("%.3f", BC.Red["StarsofMerit"]);
		settings.StarsofMerit.G = string.format("%.3f", BC.Green["StarsofMerit"]);
		settings.StarsofMerit.B = string.format("%.3f", BC.Blue["StarsofMerit"]);
		settings.StarsofMerit.X = string.format("%.0f", Position.Left["StarsofMerit"]);
		settings.StarsofMerit.Y = string.format("%.0f", Position.Top["StarsofMerit"]);
		settings.StarsofMerit.W = string.format("%.0f", Where["StarsofMerit"]);
		
		settings.CentralGondorSilverPiece = {};
		settings.CentralGondorSilverPiece.V = Show["CentralGondorSilverPiece"];
		settings.CentralGondorSilverPiece.A = string.format("%.3f", BC.Alpha["CentralGondorSilverPiece"]);
		settings.CentralGondorSilverPiece.R = string.format("%.3f", BC.Red["CentralGondorSilverPiece"]);
		settings.CentralGondorSilverPiece.G = string.format("%.3f", BC.Green["CentralGondorSilverPiece"]);
		settings.CentralGondorSilverPiece.B = string.format("%.3f", BC.Blue["CentralGondorSilverPiece"]);
		settings.CentralGondorSilverPiece.X = string.format("%.0f", Position.Left["CentralGondorSilverPiece"]);
		settings.CentralGondorSilverPiece.Y = string.format("%.0f", Position.Top["CentralGondorSilverPiece"]);
		settings.CentralGondorSilverPiece.W = string.format("%.0f", Where["CentralGondorSilverPiece"]);
		
		settings.GiftgiversBrand = {};
		settings.GiftgiversBrand.V = Show["GiftgiversBrand"];
		settings.GiftgiversBrand.A = string.format("%.3f", BC.Alpha["GiftgiversBrand"]);
		settings.GiftgiversBrand.R = string.format("%.3f", BC.Red["GiftgiversBrand"]);
		settings.GiftgiversBrand.G = string.format("%.3f", BC.Green["GiftgiversBrand"]);
		settings.GiftgiversBrand.B = string.format("%.3f", BC.Blue["GiftgiversBrand"]);
		settings.GiftgiversBrand.X = string.format("%.0f", Position.Left["GiftgiversBrand"]);
		settings.GiftgiversBrand.Y = string.format("%.0f", Position.Top["GiftgiversBrand"]);
		settings.GiftgiversBrand.W = string.format("%.0f", Where["GiftgiversBrand"]);
		
		settings.BingoBadge = {};
		settings.BingoBadge.V = Show["BingoBadge"];
		settings.BingoBadge.A = string.format("%.3f", BC.Alpha["BingoBadge"]);
		settings.BingoBadge.R = string.format("%.3f", BC.Red["BingoBadge"]);
		settings.BingoBadge.G = string.format("%.3f", BC.Green["BingoBadge"]);
		settings.BingoBadge.B = string.format("%.3f", BC.Blue["BingoBadge"]);
		settings.BingoBadge.X = string.format("%.0f", Position.Left["BingoBadge"]);
		settings.BingoBadge.Y = string.format("%.0f", Position.Top["BingoBadge"]);
		settings.BingoBadge.W = string.format("%.0f", Where["BingoBadge"]);

		settings.AnniversaryToken = {};
		settings.AnniversaryToken.V = Show["AnniversaryToken"];
		settings.AnniversaryToken.A = string.format("%.3f", BC.Alpha["AnniversaryToken"]);
		settings.AnniversaryToken.R = string.format("%.3f", BC.Red["AnniversaryToken"]);
		settings.AnniversaryToken.G = string.format("%.3f", BC.Green["AnniversaryToken"]);
		settings.AnniversaryToken.B = string.format("%.3f", BC.Blue["AnniversaryToken"]);
		settings.AnniversaryToken.X = string.format("%.0f", Position.Left["AnniversaryToken"]);
		settings.AnniversaryToken.Y = string.format("%.0f", Position.Top["AnniversaryToken"]);
		settings.AnniversaryToken.W = string.format("%.0f", Where["AnniversaryToken"]);
		
		settings.MotesOfEnchantment = {};
		settings.MotesOfEnchantment.V = ShowMotesOfEnchantment;
		settings.MotesOfEnchantment.A = string.format("%.3f", MOEbcAlpha);
		settings.MotesOfEnchantment.R = string.format("%.3f", MOEbcRed);
		settings.MotesOfEnchantment.G = string.format("%.3f", MOEbcGreen);
		settings.MotesOfEnchantment.B = string.format("%.3f", MOEbcBlue);
		settings.MotesOfEnchantment.X = string.format("%.0f", _G.MOELocX);
		settings.MotesOfEnchantment.Y = string.format("%.0f", _G.MOELocY);
		settings.MotesOfEnchantment.W = string.format("%.0f", _G.MOEWhere);
		
		settings.EmbersOfEnchantment = {};
		settings.EmbersOfEnchantment.V = Show["EmbersOfEnchantment"];
		settings.EmbersOfEnchantment.A = string.format("%.3f", BC.Alpha["EmbersOfEnchantment"]);
		settings.EmbersOfEnchantment.R = string.format("%.3f", BC.Red["EmbersOfEnchantment"]);
		settings.EmbersOfEnchantment.G = string.format("%.3f", BC.Green["EmbersOfEnchantment"]);
		settings.EmbersOfEnchantment.B = string.format("%.3f", BC.Blue["EmbersOfEnchantment"]);
		settings.EmbersOfEnchantment.X = string.format("%.0f", Position.Left["EmbersOfEnchantment"]);
		settings.EmbersOfEnchantment.Y = string.format("%.0f", Position.Top["EmbersOfEnchantment"]);
		settings.EmbersOfEnchantment.W = string.format("%.0f", Where["EmbersOfEnchantment"]);

		settings.FigmentsOfSplendour = {};
		settings.FigmentsOfSplendour.V = ShowFigmentsOfSplendour;
		settings.FigmentsOfSplendour.A = string.format("%.3f", FOSbcAlpha);
		settings.FigmentsOfSplendour.R = string.format("%.3f", FOSbcRed);
		settings.FigmentsOfSplendour.G = string.format("%.3f", FOSbcGreen);
		settings.FigmentsOfSplendour.B = string.format("%.3f", FOSbcBlue);
		settings.FigmentsOfSplendour.X = string.format("%.0f", _G.FOSLocX);
		settings.FigmentsOfSplendour.Y = string.format("%.0f", _G.FOSLocY);
		settings.FigmentsOfSplendour.W = string.format("%.0f", _G.FOSWhere);
		
		settings.FallFestivalToken = {};
		settings.FallFestivalToken.V = ShowFallFestivalToken;
		settings.FallFestivalToken.A = string.format("%.3f", FFTbcAlpha);
		settings.FallFestivalToken.R = string.format("%.3f", FFTbcRed);
		settings.FallFestivalToken.G = string.format("%.3f", FFTbcGreen);
		settings.FallFestivalToken.B = string.format("%.3f", FFTbcBlue);
		settings.FallFestivalToken.X = string.format("%.0f", _G.FFTLocX);
		settings.FallFestivalToken.Y = string.format("%.0f", _G.FFTLocY);
		settings.FallFestivalToken.W = string.format("%.0f", _G.FFTWhere);
		
		settings.FarmersFaireToken = {};
		settings.FarmersFaireToken.V = ShowFarmersFaireToken;
		settings.FarmersFaireToken.A = string.format("%.3f", FFATbcAlpha);
		settings.FarmersFaireToken.R = string.format("%.3f", FFATbcRed);
		settings.FarmersFaireToken.G = string.format("%.3f", FFATbcGreen);
		settings.FarmersFaireToken.B = string.format("%.3f", FFATbcBlue);
		settings.FarmersFaireToken.X = string.format("%.0f", _G.FFATLocX);
		settings.FarmersFaireToken.Y = string.format("%.0f", _G.FFATLocY);
		settings.FarmersFaireToken.W = string.format("%.0f", _G.FFATWhere);
		
		settings.SpringLeaf = {};
		settings.SpringLeaf.V = ShowSpringLeaf;
		settings.SpringLeaf.A = string.format("%.3f", SPLbcAlpha);
		settings.SpringLeaf.R = string.format("%.3f", SPLbcRed);
		settings.SpringLeaf.G = string.format("%.3f", SPLbcGreen);
		settings.SpringLeaf.B = string.format("%.3f", SPLbcBlue);
		settings.SpringLeaf.X = string.format("%.0f", _G.SPLLocX);
		settings.SpringLeaf.Y = string.format("%.0f", _G.SPLLocY);
		settings.SpringLeaf.W = string.format("%.0f", _G.SPLWhere);
		
		settings.MidsummerToken = {};
		settings.MidsummerToken.V = ShowMidsummerToken;
		settings.MidsummerToken.A = string.format("%.3f", MSTbcAlpha);
		settings.MidsummerToken.R = string.format("%.3f", MSTbcRed);
		settings.MidsummerToken.G = string.format("%.3f", MSTbcGreen);
		settings.MidsummerToken.B = string.format("%.3f", MSTbcBlue);
		settings.MidsummerToken.X = string.format("%.0f", _G.MSTLocX);
		settings.MidsummerToken.Y = string.format("%.0f", _G.MSTLocY);
		settings.MidsummerToken.W = string.format("%.0f", _G.MSTWhere);
		
		settings.AncientScript = {};
		settings.AncientScript.V = ShowAncientScript;
		settings.AncientScript.A = string.format("%.3f", ASbcAlpha);
		settings.AncientScript.R = string.format("%.3f", ASbcRed);
		settings.AncientScript.G = string.format("%.3f", ASbcGreen);
		settings.AncientScript.B = string.format("%.3f", ASbcBlue);
		settings.AncientScript.X = string.format("%.0f", _G.ASLocX);
		settings.AncientScript.Y = string.format("%.0f", _G.ASLocY);
		settings.AncientScript.W = string.format("%.0f", _G.ASWhere);

		settings.BadgeOfTaste = {};
		settings.BadgeOfTaste.V = ShowBadgeOfTaste;
		settings.BadgeOfTaste.A = string.format("%.3f", BOTbcAlpha);
		settings.BadgeOfTaste.R = string.format("%.3f", BOTbcRed);
		settings.BadgeOfTaste.G = string.format("%.3f", BOTbcGreen);
		settings.BadgeOfTaste.B = string.format("%.3f", BOTbcBlue);
		settings.BadgeOfTaste.X = string.format("%.0f", _G.BOTLocX);
		settings.BadgeOfTaste.Y = string.format("%.0f", _G.BOTLocY);
		settings.BadgeOfTaste.W = string.format("%.0f", _G.BOTWhere);

        settings.BadgeOfDishonour = {};
        settings.BadgeOfDishonour.V = ShowBadgeOfDishonour;
        settings.BadgeOfDishonour.A = string.format("%.3f", BODbcAlpha);
        settings.BadgeOfDishonour.R = string.format("%.3f", BODbcRed);
        settings.BadgeOfDishonour.G = string.format("%.3f", BODbcGreen);
        settings.BadgeOfDishonour.B = string.format("%.3f", BODbcBlue);
        settings.BadgeOfDishonour.X = string.format("%.0f", _G.BODLocX);
        settings.BadgeOfDishonour.Y = string.format("%.0f", _G.BODLocY);
        settings.BadgeOfDishonour.W = string.format("%.0f", _G.BODWhere);

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
	Show["Wallet"], BC.Alpha["Wallet"], BC.Red["Wallet"], BC.Green["Wallet"], BC.Blue["Wallet"], Position.Left["Wallet"], Position.Top["Wallet"] = false, tA, tR, tG, tB, tX, tY; --for Wallet Control
	Show["Money"], _G.STM, _G.SSS, _G.STS, BC.Alpha["Money"], BC.Red["Money"], BC.Green["Money"], BC.Blue["Money"], Position.Left["Money"], Position.Top["Money"], Where["Money"] = true, false, true, true, tA, tR, tG, tB, 400, tY, 1; --for Money Control
	Show["DestinyPoints"], BC.Alpha["DestinyPoints"], BC.Red["DestinyPoints"], BC.Green["DestinyPoints"], BC.Blue["DestinyPoints"], Position.Left["DestinyPoints"], Position.Top["DestinyPoints"], Where["DestinyPoints"] = false, tA, tR, tG, tB, tX, tY, tW; --for Destiny points Control
	Show["Shards"], BC.Alpha["Shards"], BC.Red["Shards"], BC.Green["Shards"], BC.Blue["Shards"], Position.Left["Shards"], Position.Top["Shards"], Where["Shards"] = false, tA, tR, tG, tB, tX, tY, tW; --for Shards Control
	Show["SkirmishMarks"], BC.Alpha["SkirmishMarks"], BC.Red["SkirmishMarks"], BC.Green["SkirmishMarks"], BC.Blue["SkirmishMarks"], Position.Left["SkirmishMarks"], Position.Top["SkirmishMarks"], Where["SkirmishMarks"] = false, tA, tR, tG, tB, tX, tY, tW; --for Skirmish marks Control
	Show["MithrilCoins"], BC.Alpha["MithrilCoins"], BC.Red["MithrilCoins"], BC.Green["MithrilCoins"], BC.Blue["MithrilCoins"], Position.Left["MithrilCoins"], Position.Top["MithrilCoins"], Where["MithrilCoins"] = false, tA, tR, tG, tB, tX, tY, tW; --for Mithril Coins Control
	Show["YuleToken"], BC.Alpha["YuleToken"], BC.Red["YuleToken"], BC.Green["YuleToken"], BC.Blue["YuleToken"], _G.TLocX, Position.Top["YuleToken"], Where["YuleToken"] = false, tA, tR, tG, tB, tX, tY, tW; --for Yule Tokens Control
	Show["HytboldTokens"], BC.Alpha["HytboldTokens"], BC.Red["HytboldTokens"], BC.Green["HytboldTokens"], BC.Blue["HytboldTokens"], Position.Left["HytboldTokens"], Position.Top["HytboldTokens"], Where["HytboldTokens"] = false, tA, tR, tG, tB, tX, tY, tW; --for Tokens of Hytbold Control
	Show["Medallions"], BC.Alpha["Medallions"], BC.Red["Medallions"], BC.Green["Medallions"], BC.Blue["Medallions"], Position.Left["Medallions"], Position.Top["Medallions"], Where["Medallions"] = false, tA, tR, tG, tB, tX, tY, tW; --for Medallions Control
	Show["Commendations"], BC.Alpha["Commendations"], BC.Red["Commendations"], BC.Green["Commendations"], BC.Blue["Commendations"], Position.Left["Commendations"], Position.Top["Commendations"], Where["Commendations"] = false, tA, tR, tG, tB, tX, tY, tW; --for Commendations Control
	Show["Seals"], BC.Alpha["Seals"], BC.Red["Seals"], BC.Green["Seals"], BC.Blue["Seals"], Position.Left["Seals"], Position.Top["Seals"], Where["Seals"] = false, tA, tR, tG, tB, tX, tY, tW; --for Seal Control
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
	Show["LOTROPoints"], BC.Alpha["LOTROPoints"], BC.Red["LOTROPoints"], BC.Green["LOTROPoints"], BC.Blue["LOTROPoints"], Position.Left["LOTROPoints"], Position.Top["LOTROPoints"], Where["LOTROPoints"] = false, tA, tR, tG, tB, tX, tY, tW; --for LOTRO points Control
	ShowPlayerLoc, PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue, _G.PLLocX, _G.PLLocX = true, tA, tR, tG, tB, screenWidth - 205, tY; --for Player Location Control
	ShowGameTime, _G.Clock24h, _G.ShowST, _G.ShowBT, GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue, _G.GTLocX, _G.GTLocX = true, false, false, false, tA, tR, tG, tB, screenWidth - 60, tY --for Game time Control
	Show["AmrothSilverPiece"], BC.Alpha["AmrothSilverPiece"], BC.Red["AmrothSilverPiece"], BC.Green["AmrothSilverPiece"], BC.Blue["AmrothSilverPiece"], Position.Left["AmrothSilverPiece"], Position.Top["AmrothSilverPiece"], Where["AmrothSilverPiece"] = false, tA, tR, tG, tB, tX, tY, tW; --for Amroth Silver Piece Control
	Show["StarsofMerit"], BC.Alpha["StarsofMerit"], BC.Red["StarsofMerit"], BC.Green["StarsofMerit"], BC.Blue["StarsofMerit"], Position.Left["StarsofMerit"], Position.Top["StarsofMerit"], Where["StarsofMerit"] = false, tA, tR, tG, tB, tX, tY, tW; --for Stars of Merit Control
	Show["CentralGondorSilverPiece"], BC.Alpha["CentralGondorSilverPiece"], BC.Red["CentralGondorSilverPiece"], BC.Green["CentralGondorSilverPiece"], BC.Blue["CentralGondorSilverPiece"], Position.Left["CentralGondorSilverPiece"], Position.Top["CentralGondorSilverPiece"], Where["CentralGondorSilverPiece"] = false, tA, tR, tG, tB, tX, tY, tW; --for Central Gondor Silver Piece Control
	Show["GiftgiversBrand"], BC.Alpha["GiftgiversBrand"], BC.Red["GiftgiversBrand"], BC.Green["GiftgiversBrand"], BC.Blue["GiftgiversBrand"], Position.Left["GiftgiversBrand"], Position.Top["GiftgiversBrand"], Where["GiftgiversBrand"] = false, tA, tR, tG, tB, tX, tY, tW; --for Gift giver's Brand Control
	Show["BingoBadge"], BC.Alpha["BingoBadge"], BC.Red["BingoBadge"], BC.Green["BingoBadge"], BC.Blue["BingoBadge"], Position.Left["BingoBadge"], Position.Top["BingoBadge"], Where["BingoBadge"] = false, tA, tR, tG, tB, tX, tY, tW; --for Bingo Badge Control
	Show["AnniversaryToken"], BC.Alpha["AnniversaryToken"], BC.Red["AnniversaryToken"], BC.Green["AnniversaryToken"], BC.Blue["AnniversaryToken"], Position.Left["AnniversaryToken"], Position.Top["AnniversaryToken"], Where["AnniversaryToken"] = false, tA, tR, tG, tB, tX, tY, tW; --for Anniversary Token Control
	ShowMotesOfEnchantment, MOEbcAlpha, MOEbcRed, MOEbcGreen, MOEbcBlue, _G.MOELocX, _G.MOELocY, _G.MOEWhere = false, tA, tR, tG, tB, tX, tY, tW; --for Motes of Enchantment Control
	Show["EmbersOfEnchantment"], BC.Alpha["EmbersOfEnchantment"], BC.Red["EmbersOfEnchantment"], BC.Green["EmbersOfEnchantment"], BC.Blue["EmbersOfEnchantment"], Position.Left["EmbersOfEnchantment"], Position.Top["EmbersOfEnchantment"], Where["EmbersOfEnchantment"] = false, tA, tR, tG, tB, tX, tY, tW; --for Embers of Enchantment Control
	ShowFigmentsOfSplendour, FOSbcAlpha, FOSbcRed, FOSbcGreen, FOSbcBlue, _G.FOSLocX, _G.FOSLocY, _G.FOSWhere = false, tA, tR, tG, tB, tX, tY, tW; --for Figments of Splendour Control
	ShowFallFestivalToken, FFTbcAlpha, FFTbcRed, FFTbcGreen, FFTbcBlue, _G.FFTLocX, _G.FFTLocY, _G.FFTWhere = false, tA, tR, tG, tB, tX, tY, tW; --for Fall Festival Tokens Control	
	ShowFarmersFaireToken, FFATbcAlpha, FFATbcRed, FFATbcGreen, FFATbcBlue, _G.FFATLocX, _G.FFATLocY, _G.FFATWhere = false, tA, tR, tG, tB, tX, tY, tW; --for Farmers Festival Token Control
	ShowSpringLeaf, SPLbcAlpha, SPLbcRed, SPLbcGreen, SPLbcBlue, _G.SPLLocX, _G.SPLLocY, _G.SPLWhere = false, tA, tR, tG, tB, tX, tY, tW; --for Spring Leaf Control	
	ShowMidsummerToken, MSTbcAlpha, MSTbcRed, MSTbcGreen, MSTbcBlue, _G.MSTLocX, _G.MSTLocY, _G.MSTWhere = false, tA, tR, tG, tB, tX, tY, tW; --for  Midsummer Token Control
	ShowAncientScript, ASbcAlpha, ASbcRed, ASbcGreen, ASbcBlue, _G.ASLocX, _G.ASLocY, _G.ASWhere = false, tA, tR, tG, tB, tX, tY, tW; --for  Ancient Script Control
    ShowBadgeOfTaste, BOTbcAlpha, BOTbcRed, BOTbcGreen, BOTbcBlue, _G.BOTLocX, _G.BOTLocY, _G.BOTWhere = false, tA, tR, tG, tB, tX, tY, tW; --for Badge of Taste Control 
    ShowBadgeOfDishonour, BODbcAlpha, BODbcRed, BODbcGreen, BODbcBlue, _G.BODLocX, _G.BODLocY, _G.BODWhere = false, tA, tR, tG, tB, tX, tY, tW; --for Badge of Dishonour Control 

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
	_G.MOELocX = oldLocX * screenWidth;
	settings.MotesOfEnchantment.X = string.format("%.0f", _G.MOELocX);
	if ShowMotesOfEnchantment and _G.MOEWhere == 1 then MOE[ "Ctr" ]:SetPosition( _G.MOELocX, _G.MOELocY ); end
	
	oldLocX = settings.EmbersOfEnchantment.X / oldScreenWidth;
	Position.Left["EmbersOfEnchantment"] = oldLocX * screenWidth;
	settings.EmbersOfEnchantment.X = string.format("%.0f", Position.Left["EmbersOfEnchantment"]);
	if Show["EmbersOfEnchantment"] and Where["EmbersOfEnchantment"] == 1 then EOE[ "Ctr" ]:SetPosition( Position.Left["EmbersOfEnchantment"], Position.Top["EmbersOfEnchantment"] ); end
	
	oldLocX = settings.FigmentsOfSplendour.X / oldScreenWidth;
	_G.FOSLocX = oldLocX * screenWidth;
	settings.FigmentsOfSplendour.X = string.format("%.0f", _G.FOSLocX);
	if ShowFigmentsOfSplendour and _G.FOSWhere == 1 then FOS[ "Ctr" ]:SetPosition( _G.FOSLocX, _G.FOSLocY ); end
	
	oldLocX = settings.FallFestivalToken.X / oldScreenWidth;
	_G.FFTLocX = oldLocX * screenWidth;
	settings.FallFestivalToken.X = string.format("%.0f", _G.FFTLocX);
	if ShowFallFestivalToken and _G.FFTWhere == 1 then FFT[ "Ctr" ]:SetPosition( _G.FFTLocX, _G.FFTLocY ); end
	
	oldLocX = settings.FarmersFaireToken.X / oldScreenWidth;
	_G.FFATLocX = oldLocX * screenWidth;
	settings.FarmersFaireToken.X = string.format("%.0f", _G.FFATLocX);
	if ShowFarmersFaireToken and _G.FFATWhere == 1 then FFAT[ "Ctr" ]:SetPosition( _G.FFATLocX, _G.FFATLocY ); end
	
	oldLocX = settings.SpringLeaf.X / oldScreenWidth;
	_G.SPLLocX = oldLocX * screenWidth;
	settings.SpringLeaf.X = string.format("%.0f", _G.SPLLocX);
	if ShowSpringLeaf and _G.SPLWhere == 1 then SPL[ "Ctr" ]:SetPosition( _G.SPLLocX, _G.SPLLocY ); end
	
	oldLocX = settings.MidsummerToken.X / oldScreenWidth;
	_G.MSTLocX = oldLocX * screenWidth;
	settings.MidsummerToken.X = string.format("%.0f", _G.MSTLocX);
	if ShowMidsummerToken and _G.MSTWhere == 1 then MST[ "Ctr" ]:SetPosition( _G.MSTLocX, _G.MSTLocY ); end
	
	oldLocX = settings.AncientScript.X / oldScreenWidth;
	_G.ASLocX = oldLocX * screenWidth;
	settings.AncientScript.X = string.format("%.0f", _G.ASLocX);
	if ShowAncientScript and _G.ASWhere == 1 then AS[ "Ctr" ]:SetPosition( _G.ASLocX, _G.ASLocY ); end

    oldLocX = settings.BadgeOfTaste.X / oldScreenWidth;
    _G.BOTLocX = oldLocX * screenWidth;
    settings.BadgeOfTaste.X = string.format("%.0f", _G.BOTLocX);
    if ShowBadgeOfTaste and _G.BOTWhere == 1 then BOT[ "Ctr" ]:SetPosition( _G.BOTLocX, _G.BOTLocY ); end

    oldLocX = settings.BadgeOfDishonour.X / oldScreenWidth;
    _G.BODLocX = oldLocX * screenWidth;
    settings.BadgeOfDishonour.X = string.format("%.0f", _G.BODLocX);
    if ShowBadgeOfDishonour and _G.BODWhere == 1 then BOD[ "Ctr" ]:SetPosition( _G.BODLocX, _G.BODLocY ); end
	
	SaveSettings( false );
	write( L["TBSSCD"] );
end
