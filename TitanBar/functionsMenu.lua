-- functionsMenu.lua
-- Written By Habna


--**v Functions for the menu v**

--- Generic function to show/hide a currency control.
---@param key string Long key, e.g. "Wallet", "LOTROPoints"
function ShowHideCurrency(key)
    local code = CurrencyKeyToCode[key];
    ImportCtr( code );
    local controlTable = _G[code];
    local control = controlTable["Ctr"];

	Show[key] = not Show[key];
	settings[key].V = Show[key];
    if (not DoesNotHaveWhere[key]) then
        settings[key].W = string.format("%.0f", Where[key]);
    end
	SaveSettings( false );
	if Show[key] then
		--write( "TitanBar: Showing control");
        control:SetBackColor( GetBGColor(key) );
	else
		--write( "TitanBar: Hiding control's window");
        if (HasWindow[key]) then
            local from = _G["frm" .. code];
            local window = _G["w" .. code];
            if from then window:Close(); end
        end
	end
	control:SetVisible( Show[key] );
    if (key == "Wallet") then
        local menuItem = _G["HabnaPlugins"]["TitanBar"]["opt_" .. code];
    	menuItem:SetChecked( Show[key] );
    end
end

-- **v Show/Hide Wallet v**
function ShowHideWallet()
	Show["Wallet"] = not Show["Wallet"];
	settings.Wallet.V = Show["Wallet"];
	SaveSettings( false );
	if Show["Wallet"] then
		--write( "TitanBar: Showing wallet control");
		ImportCtr( "WI" );
		WI[ "Ctr" ]:SetBackColor( GetBGColor("Wallet") );
	else
		--write( "TitanBar: Hiding wallet control");
		if _G.frmWI then wWI:Close(); end
	end
	WI[ "Ctr" ]:SetVisible( Show["Wallet"] );
	opt_WI:SetChecked( Show["Wallet"] );
end
-- **^
-- **v Show/Hide Money v**
function ShowHideMoney()
	Show["Money"] = not Show["Money"];
	settings.Money.V = Show["Money"];
	settings.Money.W = string.format("%.0f", Where["Money"]);
	SaveSettings( false );
	ImportCtr( "MI" );
	if Show["Money"] then
		--write( "TitanBar: Showing money");
		--ImportCtr( "MI" );
		MI[ "Ctr" ]:SetBackColor( GetBGColor("Money") );
	else
		--write( "TitanBar: Hiding money");
		if _G.frmMI then wMI:Close(); end
	end
	MI[ "Ctr" ]:SetVisible( Show["Money"] );
end
-- **^
-- **v Show/Hide Destiny Points v**
function ShowHideDestinyPoints()
	Show["DestinyPoints"] = not Show["DestinyPoints"];
	settings.DestinyPoints.V = Show["DestinyPoints"];
	settings.DestinyPoints.W = string.format("%.0f", Where["DestinyPoints"]);
	SaveSettings( false );
	ImportCtr( "DP" );
	if Show["DestinyPoints"] then
		DP[ "Ctr" ]:SetBackColor( GetBGColor("DestinyPoints") );
	end
	DP[ "Ctr" ]:SetVisible( Show["DestinyPoints"] );
end
-- **^
-- **v Show/Hide Shards v**
function ShowHideShards()
	Show["Shards"] = not Show["Shards"];
	settings.Shards.V = Show["Shards"];
	settings.Shards.W = string.format("%.0f", Where["Shards"]);
	SaveSettings( false );
	ImportCtr( "SP" );
	if Show["Shards"] then
		SP[ "Ctr" ]:SetBackColor( GetBGColor("Shards") );
	end
	SP[ "Ctr" ]:SetVisible( Show["Shards"] );
end
-- **^
-- **v Show/Hide Skirmish marks v**
function ShowHideSkirmishMarks()
	Show["SkirmishMarks"] = not Show["SkirmishMarks"];
	settings.SkirmishMarks.V = Show["SkirmishMarks"];
	settings.SkirmishMarks.W = string.format("%.0f", Where["SkirmishMarks"]);
	SaveSettings( false );
	ImportCtr( "SM" );
	if Show["SkirmishMarks"] then
		SM[ "Ctr" ]:SetBackColor( GetBGColor("SkirmishMarks") );
	end
	SM[ "Ctr" ]:SetVisible( Show["SkirmishMarks"] );
end
-- **^
-- **v Show/Hide Mithril Coins v**
function ShowHideMithrilCoins()
	Show["MithrilCoins"] = not Show["MithrilCoins"];
	settings.MithrilCoins.V = Show["MithrilCoins"];
	settings.MithrilCoins.W = string.format("%.0f", Where["MithrilCoins"]);
	SaveSettings( false );
	ImportCtr( "MC" );
	if Show["MithrilCoins"] then
		MC[ "Ctr" ]:SetBackColor( GetBGColor("MithrilCoins") );
	end
	MC[ "Ctr" ]:SetVisible( Show["MithrilCoins"] );
end
-- **^
-- **v Show/Hide Yule Tokens v**
function ShowHideYuleToken()
	Show["YuleToken"] = not Show["YuleToken"];
	settings.YuleToken.V = Show["YuleToken"];
	settings.YuleToken.W = string.format("%.0f", Where["YuleToken"]);
	SaveSettings( false );
	ImportCtr( "YT" );
	if Show["YuleToken"] then
		YT[ "Ctr" ]:SetBackColor( GetBGColor("YuleToken") );
	end
	YT[ "Ctr" ]:SetVisible( Show["YuleToken"] );
end
-- **^
-- **v Show/Hide Tokens of Hytbold v**
function ShowHideHytboldTokens()
	Show["HytboldTokens"] = not Show["HytboldTokens"];
	settings.HytboldTokens.V = Show["HytboldTokens"];
	settings.HytboldTokens.W = string.format("%.0f", Where["HytboldTokens"]);
	SaveSettings( false );
	ImportCtr( "HT" );
	if Show["HytboldTokens"] then
		HT[ "Ctr" ]:SetBackColor( GetBGColor("HytboldTokens") );
	end
	HT[ "Ctr" ]:SetVisible( Show["HytboldTokens"] );
end
-- **^
-- **v Show/Hide Medallions v**
function ShowHideMedallions()
	Show["Medallions"] = not Show["Medallions"];
	settings.Medallions.V = Show["Medallions"];
	settings.Medallions.W = string.format("%.0f", Where["Medallions"]);
	SaveSettings( false );
	ImportCtr( "MP" );
	if Show["Medallions"] then
		MP[ "Ctr" ]:SetBackColor( GetBGColor("Medallions") );
	end
	MP[ "Ctr" ]:SetVisible( Show["Medallions"] );
end
-- **^
-- **v Show/Hide Seals v**
function ShowHideSeals()
	Show["Seals"] = not Show["Seals"];
	settings.Seals.V = Show["Seals"];
	settings.Seals.W = string.format("%.0f", Where["Seals"]);
	SaveSettings( false );
	ImportCtr( "SL" );
	if Show["Seals"] then
		SL[ "Ctr" ]:SetBackColor( GetBGColor("Seals") );
	end
	SL[ "Ctr" ]:SetVisible( Show["Seals"] );
end
-- **^
-- **v Show/Hide Commendations v**
function ShowHideCommendations()
	Show["Commendations"] = not Show["Commendations"];
	settings.Commendations.V = Show["Commendations"];
	settings.Commendations.W = string.format("%.0f", Where["Commendations"]);
	SaveSettings( false );
	ImportCtr( "CP" );
	if Show["Commendations"] then
		CP[ "Ctr" ]:SetBackColor( GetBGColor("Commendations") );
	end
	CP[ "Ctr" ]:SetVisible( Show["Commendations"] );
end
-- **^
-- **v Show/Hide LOTRO Points v**
function ShowHideLOTROPoints()
	Show["LOTROPoints"] = not Show["LOTROPoints"];
	settings.LOTROPoints.V = Show["LOTROPoints"];
	settings.LOTROPoints.W = string.format("%.0f", Where["LOTROPoints"]);
	SaveSettings( false );
	ImportCtr( "LP" );
	if Show["LOTROPoints"] then
		LP[ "Ctr" ]:SetBackColor( GetBGColor("LOTROPoints") );
	else
		if _G.frmLP then wLP:Close(); end
	end
	LP[ "Ctr" ]:SetVisible( Show["LOTROPoints"] );
end
-- **^
-- **v Show/Hide backpack Infos v**
function ShowHideBackpackInfos()
	ShowBagInfos = not ShowBagInfos;
	settings.BagInfos.V = ShowBagInfos;
	SaveSettings( false );
	if ShowBagInfos then
		ImportCtr( "BI" );
		BI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BIbcAlpha, BIbcRed, BIbcGreen, BIbcBlue ) );
	else
		RemoveCallback(backpack, "ItemAdded");
		RemoveCallback(backpack, "ItemRemoved");
		if _G.frmBI then wBI:Close(); end
	end
	BI[ "Ctr" ]:SetVisible( ShowBagInfos );
	opt_BI:SetChecked( ShowBagInfos );
end
--**^
-- **v Show/Hide backpack Infos v**
function ShowHidePlayerInfos()
	ShowPlayerInfos = not ShowPlayerInfos;
	settings.PlayerInfos.V = ShowPlayerInfos;
	SaveSettings( false );
	if ShowPlayerInfos then
		ImportCtr( "PI" );
		PI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( PIbcAlpha, PIbcRed, PIbcGreen, PIbcBlue ) );
	else
		RemoveCallback(Player, "LevelChanged");
		RemoveCallback(Player, "NameChanged");
		RemoveCallback(Turbine.Chat, "Received", XPcb);
	end
	PI[ "Ctr" ]:SetVisible( ShowPlayerInfos );
	opt_PI:SetChecked( ShowPlayerInfos );
end
--**^
-- **v Show/Hide equipment Infos v**
function ShowHideEquipInfos()
	ShowEquipInfos = not ShowEquipInfos;
	settings.EquipInfos.V = ShowEquipInfos;
	SaveSettings( false );
	if ShowEquipInfos then
		GetEquipmentInfos();
		AddCallback(PlayerEquipment, "ItemEquipped", function(sender, args) if ShowEquipInfos then GetEquipmentInfos(); UpdateEquipsInfos(); end end);
		AddCallback(PlayerEquipment, "ItemUnequipped", function(sender, args) ItemUnEquippedTimer:SetWantsUpdates( true ); end); --Workaround
		ImportCtr( "EI" );
		EI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( EIbcAlpha, EIbcRed, EIbcGreen, EIbcBlue ) );
	else
		RemoveCallback(PlayerEquipment, "ItemEquipped");
		RemoveCallback(PlayerEquipment, "ItemUnequipped");
		if _G.frmEI then wEI:Close(); end
	end
	EI[ "Ctr" ]:SetVisible( ShowEquipInfos );
	opt_EI:SetChecked( ShowEquipInfos );
end
--**^
-- **v Show/Hide durability Infos v**
function ShowHideDurabilityInfos()
	ShowDurabilityInfos = not ShowDurabilityInfos;
	settings.DurabilityInfos.V = ShowDurabilityInfos;
	SaveSettings( false );
	if ShowDurabilityInfos then
		GetEquipmentInfos();
		AddCallback(PlayerEquipment, "ItemEquipped", function(sender, args) if ShowEquipInfos then GetEquipmentInfos(); UpdateEquipsInfos(); end if ShowDurabilityInfos then GetEquipmentInfos(); UpdateDurabilityInfos(); end end);
		AddCallback(PlayerEquipment, "ItemUnequipped", function(sender, args) ItemUnEquippedTimer:SetWantsUpdates( true ); end); --Workaround
		ImportCtr( "DI" );
		DI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( DIbcAlpha, DIbcRed, DIbcGreen, DIbcBlue ) );
	else
		RemoveCallback(PlayerEquipment, "ItemEquipped");
		RemoveCallback(PlayerEquipment, "ItemUnequipped");
		if _G.frmDI then wDI:Close(); end
	end
	DI[ "Ctr" ]:SetVisible( ShowDurabilityInfos );
	opt_DI:SetChecked( ShowDurabilityInfos );
end
--**^
-- **v Show/Hide Tracked Items Infos v**
function ShowHideTrackItems()
	ShowTrackItems = not ShowTrackItems;
	settings.TrackItems.V = ShowTrackItems;
	SaveSettings( false );
	if ShowTrackItems then
		ImportCtr( "TI" );
		TI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( TIbcAlpha, TIbcRed, TIbcGreen, TIbcBlue ) );
	else
		if _G.frmTI then wTI:Close(); end
	end
	TI[ "Ctr" ]:SetVisible( ShowTrackItems );
	opt_TI:SetChecked( ShowTrackItems );
end
--**^
-- **v Show/Hide Infamy v**
function ShowHideInfamy()
	ShowInfamy = not ShowInfamy;
	settings.Infamy.V = ShowInfamy;
	SaveSettings( false );
	if ShowInfamy then
		ImportCtr( "IF" );
		IF[ "Ctr" ]:SetBackColor( Turbine.UI.Color( IFbcAlpha, IFbcRed, IFbcGreen, IFbcBlue ) );
	else
		RemoveCallback(Turbine.Chat, "Received", IFcb);
		if _G.frmIF then wIF:Close(); end
	end
	IF[ "Ctr" ]:SetVisible( ShowInfamy );
	opt_IF:SetChecked( ShowInfamy );
end
-- **^
-- **v Show/Hide Vault v**
function ShowHideVault()
	ShowVault = not ShowVault;
	settings.Vault.V = ShowVault;
	SaveSettings( false );
	if ShowVault then
		ImportCtr( "VT" );
		VT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( VTbcAlpha, VTbcRed, VTbcGreen, VTbcBlue ) );
	else
		RemoveCallback(vaultpack, "CountChanged");
		if _G.frmVT then wVT:Close(); end
	end
	VT[ "Ctr" ]:SetVisible( ShowVault );
	opt_VT:SetChecked( ShowVault );
end
-- **^
-- **v Show/Hide SharedStorage v**
function ShowHideSharedStorage()
	ShowSharedStorage = not ShowSharedStorage;
	settings.SharedStorage.V = ShowSharedStorage;
	SaveSettings( false );
	if ShowSharedStorage then
		ImportCtr( "SS" );
		SS[ "Ctr" ]:SetBackColor( Turbine.UI.Color( SSbcAlpha, SSbcRed, SSbcGreen, SSbcBlue ) );
	else
		RemoveCallback(sspack, "CountChanged");
		if _G.frmSS then wSS:Close(); end
	end
	SS[ "Ctr" ]:SetVisible( ShowSharedStorage );
	opt_SS:SetChecked( ShowSharedStorage );
end
-- **^
-- **v Show/Hide Bank v**
function ShowHideBank()
	ShowBank = not ShowBank;
	settings.Bank.V = ShowBank;
	SaveSettings( false );
	if ShowBank then
		ImportCtr( "BK" );
		BK[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BKbcAlpha, BKbcRed, BKbcGreen, BKbcBlue ) );
	else
	end
	BK[ "Ctr" ]:SetVisible( ShowBank );
	opt_BK:SetChecked( ShowBank );
end
-- **^
-- **v Show/Hide Day & Night time v**
function ShowHideDayNight()
	ShowDayNight = not ShowDayNight;
	settings.DayNight.V = ShowDayNight;
	SaveSettings( false );
	if ShowDayNight then
		ImportCtr( "DN" );
		DN[ "Ctr" ]:SetBackColor( Turbine.UI.Color( DNbcAlpha, DNbcRed, DNbcGreen, DNbcBlue ) );
	else
		if _G.frmDN then wDN:Close(); end
	end
	DN[ "Ctr" ]:SetVisible( ShowDayNight );
	opt_DN:SetChecked( ShowDayNight );
end
-- **^
-- **v Show/Hide Reputation v**
function ShowHideReputation()
	ShowReputation = not ShowReputation;
	settings.Reputation.V = ShowReputation;
	SaveSettings( false );
	if ShowReputation then
		ImportCtr( "RP" );
		RP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( RPbcAlpha, RPbcRed, RPbcGreen, RPbcBlue ) );
	else
		RemoveCallback(Turbine.Chat, "Received", RPcb);
		if _G.frmRP then wRP:Close(); end
	end
	RP[ "Ctr" ]:SetVisible( ShowReputation );
	opt_RP:SetChecked( ShowReputation );
end
-- **^

-- **v Show/Hide Player Location v**
function ShowHidePlayerLoc()
	ShowPlayerLoc = not ShowPlayerLoc;
	settings.PlayerLoc.V = ShowPlayerLoc;
	SaveSettings( false );
	if ShowPlayerLoc then
		ImportCtr( "PL" );
		PL[ "Ctr" ]:SetBackColor( Turbine.UI.Color( PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue ) );
	else
		RemoveCallback(Turbine.Chat, "Received", PLcb);
	end
	PL[ "Ctr" ]:SetVisible( ShowPlayerLoc );
	opt_PL:SetChecked( ShowPlayerLoc );
end
--**^
-- **v Show/Hide Time v**
function ShowHideGameTime()
	ShowGameTime = not ShowGameTime;
	settings.GameTime.V = ShowGameTime;
	SaveSettings( false );
	if ShowGameTime then
		ImportCtr( "GT" );
		GT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue ) );
	else
		if _G.frmGT then wGT:Close(); end
	end
	GT[ "Ctr" ]:SetVisible( ShowGameTime );
	opt_GT:SetChecked( ShowGameTime );
end
--**^
-- **v Profile load/Save v**
function LoadPlayerProfile()
	PProfile = Turbine.PluginData.Load( Turbine.DataScope.Account, "TitanBarPlayerProfile" );
	if PProfile == nil then PProfile = {}; end
end

function SavePlayerProfile()
	-- The table key is saved with "," in DE & FR clients. Ex. [1,000000]. This causes a parse error.
	-- If you change [1,000000] to [1.000000] error is not there any more. [1] would be easier! Why all those zeroes!
	-- So LOTRO saves the table key in the client language, but lua is unable to read it since "," is a special character.
	-- LOTRO just has to save the key in English and the value in the client language.

	-- So I'm converting the key [1,000000] into a string like this ["1"]
	-- That's VindarPatch's doing, it converts the whole table into string (key and value)
	-- Now I only need to convert the key since the values are already in the correct language format.
	local newt = {};
	for i, v in pairs(PProfile) do newt[tostring(i)] = v; end
	PProfile = newt;

	Turbine.PluginData.Save( Turbine.DataScope.Account, "TitanBarPlayerProfile", PProfile );
end
--**^
-- **v Show Shell Command window v**
function HelpInfo()
	if frmSC then
		wShellCmd:Close();
	else
		import(AppDirD.."shellcmd"); -- LUA shell command file
		frmShellCmd();
	end
end
-- **^
--**v Unload TitanBar v**
function UnloadTitanBar()
	Turbine.PluginManager.LoadPlugin( 'TitanBar Unloader' ); --workaround
end
--**^
--**v Reload TitanBar v**
function ReloadTitanBar()
	settings.TitanBar.Z = true;
	SaveSettings( false );
	Turbine.PluginManager.LoadPlugin( 'TitanBar Reloader' ); --workaround
end
--**^
--**v About TitanBar v**
function AboutTitanBar()
	--write( "TitanBar: About!" );
	--Turbine.PluginManager.ShowAbouts(Plugins.TitanBar); -- Add this when About is available
	--Turbine.PluginManager.ShowOptions(Plugins.TitanBar); --This will open plugin manager and show TitanBar options (THIS IS AN EXAMLPE)
end
--**^
function ShowHideAmrothSilverPiece()
	Show["AmrothSilverPiece"] = not Show["AmrothSilverPiece"];
	settings.AmrothSilverPiece.V = Show["AmrothSilverPiece"];
	settings.AmrothSilverPiece.W = string.format("%.0f", Where["AmrothSilverPiece"]);
	SaveSettings( false );
	ImportCtr( "ASP" );
	if Show["AmrothSilverPiece"] then
		ASP[ "Ctr" ]:SetBackColor( GetBGColor("AmrothSilverPiece") );
	end
	ASP[ "Ctr" ]:SetVisible( Show["AmrothSilverPiece"] );
end
function ShowHideStarsofMerit()
	Show["StarsofMerit"] = not Show["StarsofMerit"];
	settings.StarsofMerit.V = Show["StarsofMerit"];
	settings.StarsofMerit.W = string.format("%.0f", Where["StarsofMerit"]);
	SaveSettings( false );
	ImportCtr( "SOM" );
	if Show["StarsofMerit"] then
		SOM[ "Ctr" ]:SetBackColor( GetBGColor("StarsofMerit") );
	end
	SOM[ "Ctr" ]:SetVisible( Show["StarsofMerit"] );
end
function ShowHideCentralGondorSilverPiece()
	Show["CentralGondorSilverPiece"] = not Show["CentralGondorSilverPiece"];
	settings.CentralGondorSilverPiece.V = Show["CentralGondorSilverPiece"];
	settings.CentralGondorSilverPiece.W = string.format("%.0f", Where["CentralGondorSilverPiece"]);
	SaveSettings( false );
	ImportCtr( "CGSP" );
	if Show["CentralGondorSilverPiece"] then
		CGSP[ "Ctr" ]:SetBackColor( GetBGColor("CentralGondorSilverPiece") );
	end
	CGSP[ "Ctr" ]:SetVisible( Show["CentralGondorSilverPiece"] );
end
function ShowHideGiftgiversBrand()
	Show["GiftgiversBrand"] = not Show["GiftgiversBrand"];
	settings.GiftgiversBrand.V = Show["GiftgiversBrand"];
	settings.GiftgiversBrand.W = string.format("%.0f", Where["GiftgiversBrand"]);
	SaveSettings( false );
	ImportCtr( "GGB" );
	if Show["GiftgiversBrand"] then
		GGB[ "Ctr" ]:SetBackColor( GetBGColor("GiftgiversBrand") );
	end
	GGB[ "Ctr" ]:SetVisible( Show["GiftgiversBrand"] );
end
-- **^
-- **v Show/Hide Bingo Badges v**
function ShowHideBingoBadge()
	Show["BingoBadge"] = not Show["BingoBadge"];
	settings.BingoBadge.V = Show["BingoBadge"];
	settings.BingoBadge.W = string.format("%.0f", Where["BingoBadge"]);
	SaveSettings( false );
	ImportCtr( "BB" );
	if Show["BingoBadge"] then
		BB[ "Ctr" ]:SetBackColor( GetBGColor("BingoBadge") );
	end
	BB[ "Ctr" ]:SetVisible( Show["BingoBadge"] );
end
function ShowHideAnniversaryToken()
	Show["AnniversaryToken"] = not Show["AnniversaryToken"];
	settings.AnniversaryToken.V = Show["AnniversaryToken"];
	settings.AnniversaryToken.W = string.format( "%.0f", Where["AnniversaryToken"] );
	SaveSettings( false );
	ImportCtr( "LAT" );
	if Show["AnniversaryToken"] then
		LAT[ "Ctr" ]:SetBackColor( GetBGColor("AnniversaryToken") );
	end
	LAT[ "Ctr" ]:SetVisible( Show["AnniversaryToken"] );
end
function ShowHideMotesOfEnchantment()
	Show["MotesOfEnchantment"] = not Show["MotesOfEnchantment"];
	settings.MotesOfEnchantment.V = Show["MotesOfEnchantment"];
	settings.MotesOfEnchantment.W = string.format( "%.0f", Where["MotesOfEnchantment"] );
	SaveSettings( false );
	ImportCtr( "MOE" );
	if Show["MotesOfEnchantment"] then
		MOE[ "Ctr" ]:SetBackColor( GetBGColor("MotesOfEnchantment") );
	end
	MOE[ "Ctr" ]:SetVisible( Show["MotesOfEnchantment"] );
end
function ShowHideEmbersOfEnchantment()
	Show["EmbersOfEnchantment"] = not Show["EmbersOfEnchantment"];
	settings.EmbersOfEnchantment.V = Show["EmbersOfEnchantment"];
	settings.EmbersOfEnchantment.W = string.format( "%.0f", Where["EmbersOfEnchantment"] );
	SaveSettings( false );
	ImportCtr( "EOE" );
	if Show["EmbersOfEnchantment"] then
		EOE[ "Ctr" ]:SetBackColor( GetBGColor("EmbersOfEnchantment") );
	end
	EOE[ "Ctr" ]:SetVisible( Show["EmbersOfEnchantment"] );
end

function ShowHideFigmentsOfSplendour()
	Show["FigmentsOfSplendour"] = not Show["FigmentsOfSplendour"];
	settings.FigmentsOfSplendour.V = Show["FigmentsOfSplendour"];
	settings.FigmentsOfSplendour.W = string.format( "%.0f", Where["FigmentsOfSplendour"] );
	SaveSettings( false );
	ImportCtr( "FOS" );
	if Show["FigmentsOfSplendour"] then
		FOS[ "Ctr" ]:SetBackColor( GetBGColor("FigmentsOfSplendour") );
	end
	FOS[ "Ctr" ]:SetVisible( Show["FigmentsOfSplendour"] );
end

function ShowHideFallFestivalToken()
	Show["FallFestivalToken"] = not Show["FallFestivalToken"];
	settings.FallFestivalToken.V = Show["FallFestivalToken"];
	settings.FallFestivalToken.W = string.format( "%.0f", Where["FallFestivalToken"] );
	SaveSettings( false );
	ImportCtr( "FFT" );
	if Show["FallFestivalToken"] then
		FFT[ "Ctr" ]:SetBackColor( GetBGColor("FallFestivalToken") );
	end
	FFT[ "Ctr" ]:SetVisible( Show["FallFestivalToken"] );
end

function ShowHideFarmersFaireToken()
	Show["FarmersFaireToken"] = not Show["FarmersFaireToken"];
	settings.FarmersFaireToken.V = Show["FarmersFaireToken"];
	settings.FarmersFaireToken.W = string.format( "%.0f", Where["FarmersFaireToken"] );
	SaveSettings( false );
	ImportCtr( "FFAT" );
	if Show["FarmersFaireToken"] then
		FFAT[ "Ctr" ]:SetBackColor( GetBGColor("FarmersFaireToken") );
	end
	FFAT[ "Ctr" ]:SetVisible( Show["FarmersFaireToken"]);
end

function ShowHideSpringLeaf()
	Show["SpringLeaf"] = not Show["SpringLeaf"];
	settings.SpringLeaf.V = Show["SpringLeaf"];
	settings.SpringLeaf.W = string.format( "%.0f", Where["SpringLeaf"] );
	SaveSettings( false );
	ImportCtr( "SPL" );
	if Show["SpringLeaf"] then
		SPL[ "Ctr" ]:SetBackColor( GetBGColor("SpringLeaf") );
	end
	SPL[ "Ctr" ]:SetVisible( Show["SpringLeaf"]);
end

function ShowHideMidsummerToken()
	Show["MidsummerToken"] = not Show["MidsummerToken"];
	settings.MidsummerToken.V = Show["MidsummerToken"];
	settings.MidsummerToken.W = string.format( "%.0f", Where["MidsummerToken"] );
	SaveSettings( false );
	ImportCtr( "MST" );
	if Show["MidsummerToken"] then
		MST[ "Ctr" ]:SetBackColor( GetBGColor("MidsummerToken") );
	end
	MST[ "Ctr" ]:SetVisible( Show["MidsummerToken"]);
end

function ShowHideAncientScript()
	Show["AncientScript"] = not Show["AncientScript"];
	settings.AncientScript.V = Show["AncientScript"];
	settings.AncientScript.W = string.format( "%.0f", Where["AncientScript"] );
	SaveSettings( false );
	ImportCtr( "AS" );
	if Show["AncientScript"] then
		AS[ "Ctr" ]:SetBackColor( GetBGColor("AncientScript") );
	end
	AS[ "Ctr" ]:SetVisible( Show["AncientScript"]);
end

function ShowHideBadgeOfTaste()
	Show["BadgeOfTaste"] = not Show["BadgeOfTaste"];
	settings.BadgeOfTaste.V = Show["BadgeOfTaste"];
	settings.BadgeOfTaste.W = string.format( "%.0f", Where["BadgeOfTaste"] );
	SaveSettings( false );
	ImportCtr( "BOT" );
	if Show["BadgeOfTaste"] then
		BOT[ "Ctr" ]:SetBackColor( GetBGColor("BadgeOfTaste") );
	end
	BOT[ "Ctr" ]:SetVisible( Show["BadgeOfTaste"] );
end

function ShowHideBadgeOfDishonour()
	Show["BadgeOfDishonour"] = not Show["BadgeOfDishonour"];
	settings.BadgeOfDishonour.V = Show["BadgeOfDishonour"];
	settings.BadgeOfDishonour.W = string.format( "%.0f", Where["BadgeOfDishonour"] );
	SaveSettings( false );
	ImportCtr( "BOD" );
	if Show["BadgeOfDishonour"] then
		BOD[ "Ctr" ]:SetBackColor( GetBGColor("BadgeOfDishonour") );
	end
	BOD[ "Ctr" ]:SetVisible( Show["BadgeOfDishonour"] );
end
