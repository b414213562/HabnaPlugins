-- functionsMenu.lua
-- Written By Habna


--**v Functions for the menu v**

-- **v Show/Hide Wallet v**
function ShowHideWallet()
	Show["Wallet"] = not Show["Wallet"];
	settings.Wallet.V = Show["Wallet"];
	SaveSettings( false );
	if Show["Wallet"] then
		--write( "TitanBar: Showing wallet control");
		ImportCtr( "WI" );
		WI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["Wallet"], BC.Red["Wallet"], BC.Green["Wallet"], BC.Blue["Wallet"] ) );
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
		MI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["Money"], BC.Red["Money"], BC.Green["Money"], BC.Blue["Money"] ) );
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
		DP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["DestinyPoints"], BC.Red["DestinyPoints"], BC.Green["DestinyPoints"], BC.Blue["DestinyPoints"] ) );
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
		SP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["Shards"], BC.Red["Shards"], BC.Green["Shards"], BC.Blue["Shards"] ) );
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
		SM[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["SkirmishMarks"], BC.Red["SkirmishMarks"], BC.Green["SkirmishMarks"], BC.Blue["SkirmishMarks"] ) );
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
		MC[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["MithrilCoins"], BC.Red["MithrilCoins"], BC.Green["MithrilCoins"], BC.Blue["MithrilCoins"] ) );
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
		YT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["YuleToken"], BC.Red["YuleToken"], BC.Green["YuleToken"], BC.Blue["YuleToken"] ) );
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
		HT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["HytboldTokens"], BC.Red["HytboldTokens"], BC.Green["HytboldTokens"], BC.Blue["HytboldTokens"] ) );
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
		MP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["Medallions"], BC.Red["Medallions"], BC.Green["Medallions"], BC.Blue["Medallions"] ) );
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
		SL[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["Seals"], BC.Red["Seals"], BC.Green["Seals"], BC.Blue["Seals"] ) );
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
		CP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["Commendations"], BC.Red["Commendations"], BC.Green["Commendations"], BC.Blue["Commendations"] ) );
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
		LP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["LOTROPoints"], BC.Red["LOTROPoints"], BC.Green["LOTROPoints"], BC.Blue["LOTROPoints"] ) );
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
		ASP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["AmrothSilverPiece"], BC.Red["AmrothSilverPiece"], BC.Green["AmrothSilverPiece"], BC.Blue["AmrothSilverPiece"] ) );
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
		SOM[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["StarsofMerit"], BC.Red["StarsofMerit"], BC.Green["StarsofMerit"], BC.Blue["StarsofMerit"] ) );
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
		CGSP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["CentralGondorSilverPiece"], BC.Red["CentralGondorSilverPiece"], BC.Green["CentralGondorSilverPiece"], BC.Blue["CentralGondorSilverPiece"] ) );
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
		GGB[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["GiftgiversBrand"], BC.Red["GiftgiversBrand"], BC.Green["GiftgiversBrand"], BC.Blue["GiftgiversBrand"] ) );
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
		BB[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["BingoBadge"], BC.Red["BingoBadge"], BC.Green["BingoBadge"], BC.Blue["BingoBadge"] ) );
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
		LAT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["AnniversaryToken"], BC.Red["AnniversaryToken"], BC.Green["AnniversaryToken"], BC.Blue["AnniversaryToken"] ) );
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
		MOE[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["MotesOfEnchantment"], BC.Red["MotesOfEnchantment"], BC.Green["MotesOfEnchantment"], BC.Blue["MotesOfEnchantment"] ) );
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
		EOE[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BC.Alpha["EmbersOfEnchantment"], BC.Red["EmbersOfEnchantment"], BC.Green["EmbersOfEnchantment"], BC.Blue["EmbersOfEnchantment"] ) );
	end
	EOE[ "Ctr" ]:SetVisible( Show["EmbersOfEnchantment"] );
end

function ShowHideFigmentsOfSplendour()
	ShowFigmentsOfSplendour = not ShowFigmentsOfSplendour;
	settings.FigmentsOfSplendour.V = ShowFigmentsOfSplendour;
	settings.FigmentsOfSplendour.W = string.format( "%.0f", _G.FOSWhere );
	SaveSettings( false );
	ImportCtr( "FOS" );
	if ShowFigmentsOfSplendour then
		FOS[ "Ctr" ]:SetBackColor( Turbine.UI.Color( FOSbcAlpha, FOSbcRed, FOSbcGreen, FOSbcBlue ) );
	end
	FOS[ "Ctr" ]:SetVisible( ShowFigmentsOfSplendour );
end

function ShowHideFallFestivalToken()
	ShowFallFestivalToken = not ShowFallFestivalToken;
	settings.FallFestivalToken.V = ShowFallFestivalToken;
	settings.FallFestivalToken.W = string.format( "%.0f", _G.FFTWhere );
	SaveSettings( false );
	ImportCtr( "FFT" );
	if ShowFallFestivalToken then
		FFT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( FFTbcAlpha, FFTbcRed, FFTbcGreen, FFTbcBlue ) );
	end
	FFT[ "Ctr" ]:SetVisible( ShowFallFestivalToken );
end

function ShowHideFarmersFaireToken()
	ShowFarmersFaireToken = not ShowFarmersFaireToken;
	settings.FarmersFaireToken.V = ShowFarmersFaireToken;
	settings.FarmersFaireToken.W = string.format( "%.0f", _G.FFATWhere );
	SaveSettings( false );
	ImportCtr( "FFAT" );
	if ShowFarmersFaireToken then
		FFAT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( FFATbcAlpha, FFATbcRed, FFATbcGreen, FFATbcBlue ) );
	end
	FFAT[ "Ctr" ]:SetVisible( ShowFarmersFaireToken);
end

function ShowHideSpringLeaf()
	ShowSpringLeaf = not ShowSpringLeaf;
	settings.SpringLeaf.V = ShowSpringLeaf;
	settings.SpringLeaf.W = string.format( "%.0f", _G.SPLWhere );
	SaveSettings( false );
	ImportCtr( "SPL" );
	if ShowSpringLeaf then
		SPL[ "Ctr" ]:SetBackColor( Turbine.UI.Color( SPLbcAlpha, SPLbcRed, SPLbcGreen, SPLbcBlue ) );
	end
	SPL[ "Ctr" ]:SetVisible( ShowSpringLeaf);
end

function ShowHideMidsummerToken()
	ShowMidsummerToken = not ShowMidsummerToken;
	settings.MidsummerToken.V = ShowMidsummerToken;
	settings.MidsummerToken.W = string.format( "%.0f", _G.MSTWhere );
	SaveSettings( false );
	ImportCtr( "MST" );
	if ShowMidsummerToken then
		MST[ "Ctr" ]:SetBackColor( Turbine.UI.Color( MSTbcAlpha, MSTbcRed, MSTbcGreen, MSTbcBlue ) );
	end
	MST[ "Ctr" ]:SetVisible( ShowMidsummerToken);
end

function ShowHideAncientScript()
	ShowAncientScript = not ShowAncientScript;
	settings.AncientScript.V = ShowAncientScript;
	settings.AncientScript.W = string.format( "%.0f", _G.ASWhere );
	SaveSettings( false );
	ImportCtr( "AS" );
	if ShowAncientScript then
		AS[ "Ctr" ]:SetBackColor( Turbine.UI.Color( ASbcAlpha, ASbcRed, ASbcGreen, ASbcBlue ) );
	end
	AS[ "Ctr" ]:SetVisible( ShowAncientScript);
end

function ShowHideBadgeOfTaste()
	ShowBadgeOfTaste = not ShowBadgeOfTaste;
	settings.BadgeOfTaste.V = ShowBadgeOfTaste;
	settings.BadgeOfTaste.W = string.format( "%.0f", _G.BOTWhere );
	SaveSettings( false );
	ImportCtr( "BOT" );
	if ShowBadgeOfTaste then
		BOT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BOTbcAlpha, BOTbcRed, BOTbcGreen, BOTbcBlue ) );
	end
	BOT[ "Ctr" ]:SetVisible( ShowBadgeOfTaste );
end

function ShowHideBadgeOfDishonour()
	ShowBadgeOfDishonour = not ShowBadgeOfDishonour;
	settings.BadgeOfDishonour.V = ShowBadgeOfDishonour;
	settings.BadgeOfDishonour.W = string.format( "%.0f", _G.BODWhere );
	SaveSettings( false );
	ImportCtr( "BOD" );
	if ShowBadgeOfDishonour then
		BOD[ "Ctr" ]:SetBackColor( Turbine.UI.Color( BODbcAlpha, BODbcRed, BODbcGreen, BODbcBlue ) );
	end
	BOD[ "Ctr" ]:SetVisible( ShowBadgeOfDishonour );
end
