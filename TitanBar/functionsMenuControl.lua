-- functionsMenuControl.lua
-- Written By Habna
-- Rewritten by many


--**v Functions for the menu of control v**
--**v Unload control v**
function UnloadControl( value )
	if value == "ctr" then
		if Show["Wallet"] then ShowHideWallet(); end
		if Show["Money"] then Where["Money"] = 3; ShowHideMoney(); end
		if Show["DestinyPoints"] then Where["DestinyPoints"] = 3; ShowHideDestinyPoints(); end
		if Show["Shards"] then Where["Shards"] = 3; ShowHideShards(); end
		if Show["SkirmishMarks"] then Where["SkirmishMarks"] = 3; ShowHideSkirmishMarks(); end
		if Show["MithrilCoins"] then Where["MithrilCoins"] = 3; ShowHideMithrilCoins(); end
		if Show["YuleToken"] then Where["YuleToken"] = 3; ShowHideYuleToken(); end
		if Show["HytboldTokens"] then Where["HytboldTokens"] = 3; ShowHideHytboldTokens(); end
		if Show["Medallions"] then Where["Medallions"] = 3; ShowHideMedallions(); end
		if Show["Seals"] then Where["Seals"] = 3; ShowHideSeals(); end
		if Show["Commendations"] then Where["Commendations"] = 3; ShowHideCommendations(); end
		if ShowBagInfos then ShowHideBackpackInfos(); opt_BI:SetChecked( false ); end
		if ShowPlayerInfos then ShowHidePlayerInfos(); opt_PI:SetChecked( false ); end
		if ShowEquipInfos then ShowHideEquipInfos(); opt_EI:SetChecked( false ); end
		if ShowDurabilityInfos then ShowHideDurabilityInfos(); opt_DI:SetChecked( false ); end
		if ShowTrackItems then ShowHideTrackItems(); opt_TI:SetChecked( false ); end
		if ShowInfamy then ShowHideInfamy(); opt_IF:SetChecked( false ); end
		if ShowVault then ShowHideVault(); opt_VT:SetChecked( false ); end
		if ShowSharedStorage then ShowHideSharedStorage(); opt_SS:SetChecked( false ); end
		--if ShowBank then ShowHideBank(); opt_BK:SetChecked( false ); end
		if ShowDayNight then ShowHideDayNight(); opt_DN:SetChecked( false ); end
		if ShowReputation then ShowHideReputation(); opt_RP:SetChecked( false ); end
		if Show["LOTROPoints"] then Where["LOTROPoints"] = 3; ShowHideLOTROPoints(); end
		if ShowPlayerLoc then ShowHidePlayerLoc(); opt_PL:SetChecked( false ); end
		if ShowGameTime then ShowHideGameTime(); opt_GT:SetChecked( false ); end
		if Show["AmrothSilverPiece"] then Where["AmrothSilverPiece"] = 3; ShowHideAmrothSilverPiece(); end
		if Show["StarsofMerit"] then Where["StarsofMerit"] = 3; ShowHideStarsofMerit(); end
		if Show["CentralGondorSilverPiece"] then Where["CentralGondorSilverPiece"] = 3; ShowHideCentralGondorSilverPiece(); end
		if Show["GiftgiversBrand"] then Where["GiftgiversBrand"] = 3; ShowHideGiftgiversBrand(); end
		if Show["BingoBadge"] then Where["BingoBadge"] = 3; ShowHideBingoBadge(); end
		if Show["AnniversaryToken"] then Where["AnniversaryToken"] = 3; ShowHideAnniversaryToken(); end
		if Show["MotesOfEnchantment"] then Where["MotesOfEnchantment"] = 3; ShowHideMotesOfEnchantment(); end
		if Show["EmbersOfEnchantment"] then Where["EmbersOfEnchantment"] = 3; ShowHideEmbersOfEnchantment(); end
		if Show["FigmentsOfSplendour"] then Where["FigmentsOfSplendour"] = 3; ShowHideFigmentsOfSplendour(); end
		if ShowFallFestivalToken then _G.FFTWhere = 3; ShowHideFallFestivalToken(); end
		if ShowFarmersFaireToken then _G.FFATWhere = 3; ShowHideFarmersFaireToken(); end
		if ShowSpringLeaf then _G.SPLWhere = 3; ShowHideSpringLeaf(); end
		if ShowMidsummerToken then _G.MSTWhere = 3; ShowHideMidsummerToken(); end
		if ShowAncientScript then _G.ASWhere = 3; ShowHideAncientScript(); end
		if ShowBadgeOfTaste then _G.BOTWhere = 3; ShowHideBadgeOfTaste(); end
		if ShowBadgeOfDishonour then _G.BODWhere = 3; ShowHideBadgeOfDishonour(); end
		elseif value == "this" then
			if _G.sFromCtr == "WI" then ShowHideWallet();
			elseif _G.sFromCtr == "Money" then Where["Money"] = 3; ShowHideMoney();
			elseif _G.sFromCtr == "DP" then Where["DestinyPoints"] = 3; ShowHideDestinyPoints();
			elseif _G.sFromCtr == "SP" then Where["Shards"] = 3; ShowHideShards();
			elseif _G.sFromCtr == "SM" then Where["SkirmishMarks"] = 3; ShowHideSkirmishMarks();
			elseif _G.sFromCtr == "MC" then Where["MithrilCoins"] = 3; ShowHideMithrilCoins();
			elseif _G.sFromCtr == "YT" then Where["YuleToken"] = 3; ShowHideYuleToken();
			elseif _G.sFromCtr == "HT" then Where["HytboldTokens"] = 3; ShowHideHytboldTokens();
			elseif _G.sFromCtr == "MP" then Where["Medallions"] = 3; ShowHideMedallions();
			elseif _G.sFromCtr == "SL" then Where["Seals"] = 3; ShowHideSeals();
			elseif _G.sFromCtr == "CP" then Where["Commendations"] = 3; ShowHideCommendations();
			elseif _G.sFromCtr == "BI" then ShowHideBackpackInfos(); opt_BI:SetChecked( false );
			elseif _G.sFromCtr == "PI" then ShowHidePlayerInfos(); opt_PI:SetChecked( false );
			elseif _G.sFromCtr == "EI" then ShowHideEquipInfos(); opt_EI:SetChecked( false );
			elseif _G.sFromCtr == "DI" then ShowHideDurabilityInfos(); opt_DI:SetChecked( false );
			elseif _G.sFromCtr == "TI" then ShowHideTrackItems(); opt_TI:SetChecked( false );
			elseif _G.sFromCtr == "IF" then ShowHideInfamy(); opt_IF:SetChecked( false );
			elseif _G.sFromCtr == "VT" then ShowHideVault(); opt_VT:SetChecked( false );
			elseif _G.sFromCtr == "SS" then ShowHideSharedStorage(); opt_SS:SetChecked( false );
			--elseif _G.sFromCtr == "BK" then ShowHideBank(); opt_BK:SetChecked( false );
			elseif _G.sFromCtr == "DN" then ShowHideDayNight(); opt_DN:SetChecked( false );
			elseif _G.sFromCtr == "RP" then ShowHideReputation(); opt_RP:SetChecked( false );
			elseif _G.sFromCtr == "LP" then Where["LOTROPoints"] = 3; ShowHideLOTROPoints();
			elseif _G.sFromCtr == "PL" then ShowHidePlayerLoc(); opt_PL:SetChecked( false );
			elseif _G.sFromCtr == "GT" then ShowHideGameTime(); opt_GT:SetChecked( false );
			elseif _G.sFromCtr == "ASP" then Where["AmrothSilverPiece"] = 3; ShowHideAmrothSilverPiece();
			elseif _G.sFromCtr == "SOM" then Where["StarsofMerit"] = 3; ShowHideStarsofMerit();
			elseif _G.sFromCtr == "CGSP" then Where["CentralGondorSilverPiece"] = 3; ShowHideCentralGondorSilverPiece();
			elseif _G.sFromCtr == "GGB" then Where["GiftgiversBrand"] = 3; ShowHideGiftgiversBrand();
			elseif _G.sFromCtr == "BB" then	Where["BingoBadge"] = 3; ShowHideBingoBadge();
			elseif _G.sFromCtr == "LAT" then Where["AnniversaryToken"] = 3; ShowHideAnniversaryToken();
			elseif _G.sFromCtr == "MOE" then Where["MotesOfEnchantment"] = 3; ShowHideMotesOfEnchantment();
			elseif _G.sFromCtr == "EOE" then Where["EmbersOfEnchantment"] = 3; ShowHideEmbersOfEnchantment();
			elseif _G.sFromCtr == "FOS" then Where["FigmentsOfSplendour"] = 3; ShowHideFigmentsOfSplendour();
			elseif _G.sFromCtr == "FFT" then _G.FFTWhere = 3; ShowHideFallFestivalToken();
			elseif _G.sFromCtr == "FFAT" then _G.FFATWhere = 3; ShowHideFarmersFaireToken();
			elseif _G.sFromCtr == "SPL" then _G.SPLWhere = 3; ShowHideSpringLeaf();
			elseif _G.sFromCtr == "MST" then _G.MSTWhere = 3; ShowHideMidsummerToken();
			elseif _G.sFromCtr == "AS" then _G.ASWhere = 3; ShowHideAncientScript();
			elseif _G.sFromCtr == "BOT" then _G.BOTWhere = 3; ShowHideBadgeOfTaste();
			elseif _G.sFromCtr == "BOD" then _G.BODWhere = 3; ShowHideBadgeOfDishonour();
			end
		end

	TB["win"].MouseLeave();
end
--**^

--**v Match/Reset/Apply back color v**
function BGColor( cmd, value )
	if cmd == "reset" then
		if GLocale == "en" then tA, tR, tG, tB = 0.3, 0.3, 0.3, 0.3;
		else tA, tR, tG, tB = tonumber("0,3"), tonumber("0,3"), tonumber("0,3"), tonumber("0,3"); end
	elseif cmd == "match" then
		tA, tR, tG, tB = bcAlpha, bcRed, bcGreen, bcBlue;
	elseif cmd == "apply" then
		if _G.sFromCtr == "WI" then tA, tR, tG, tB = BC.Alpha["Wallet"], BC.Red["Wallet"], BC.Green["Wallet"], BC.Blue["Wallet"];
		elseif _G.sFromCtr == "Money" then tA, tR, tG, tB = BC.Alpha["Money"], BC.Red["Money"], BC.Green["Money"], BC.Blue["Money"];
		elseif _G.sFromCtr == "DP" then tA, tR, tG, tB = BC.Alpha["DestinyPoints"], BC.Red["DestinyPoints"], BC.Green["DestinyPoints"], BC.Blue["DestinyPoints"];
		elseif _G.sFromCtr == "SP" then tA, tR, tG, tB = BC.Alpha["Shards"], BC.Red["Shards"], BC.Green["Shards"], BC.Blue["Shards"];
		elseif _G.sFromCtr == "SM" then tA, tR, tG, tB = BC.Alpha["SkirmishMarks"], BC.Red["SkirmishMarks"], BC.Green["SkirmishMarks"], BC.Blue["SkirmishMarks"];
		elseif _G.sFromCtr == "MC" then tA, tR, tG, tB = BC.Alpha["MithrilCoins"], BC.Red["MithrilCoins"], BC.Green["MithrilCoins"], BC.Blue["MithrilCoins"];
		elseif _G.sFromCtr == "YT" then tA, tR, tG, tB = BC.Alpha["YuleToken"], BC.Red["YuleToken"], BC.Green["YuleToken"], BC.Blue["YuleToken"];
		elseif _G.sFromCtr == "HT" then tA, tR, tG, tB = BC.Alpha["HytboldTokens"], BC.Red["HytboldTokens"], BC.Green["HytboldTokens"], BC.Blue["HytboldTokens"];
		elseif _G.sFromCtr == "MP" then tA, tR, tG, tB = BC.Alpha["Medallions"], BC.Red["Medallions"], BC.Green["Medallions"], BC.Blue["Medallions"];
		elseif _G.sFromCtr == "SL" then tA, tR, tG, tB = BC.Alpha["Seals"], BC.Red["Seals"], BC.Green["Seals"], BC.Blue["Seals"];
		elseif _G.sFromCtr == "CP" then tA, tR, tG, tB = BC.Alpha["Commendations"], BC.Red["Commendations"], BC.Green["Commendations"], BC.Blue["Commendations"];
		elseif _G.sFromCtr == "BI" then tA, tR, tG, tB = BIbcAlpha, BIbcRed, BIbcGreen, BIbcBlue;
		elseif _G.sFromCtr == "PI" then tA, tR, tG, tB = PIbcAlpha, PIbcRed, PIbcGreen, PIbcBlue;
		elseif _G.sFromCtr == "EI" then tA, tR, tG, tB = EIbcAlpha, EIbcRed, EIbcGreen, EIbcBlue;
		elseif _G.sFromCtr == "DI" then tA, tR, tG, tB = DIbcAlpha, DIbcRed, DIbcGreen, DIbcBlue;
		elseif _G.sFromCtr == "TI" then tA, tR, tG, tB = TIbcAlpha, TIbcRed, TIbcGreen, TIbcBlue;
		elseif _G.sFromCtr == "IF" then tA, tR, tG, tB = IFbcAlpha, IFbcRed, IFbcGreen, IFbcBlue;
		elseif _G.sFromCtr == "VT" then tA, tR, tG, tB = VTbcAlpha, VTbcRed, VTbcGreen, VTbcBlue;
		elseif _G.sFromCtr == "SS" then tA, tR, tG, tB = SSbcAlpha, SSbcRed, SSbcGreen, SSbcBlue;
--		elseif _G.sFromCtr == "BK" then tA, tR, tG, tB = BKbcAlpha, BKbcRed, BKbcGreen, BKbcBlue;
		elseif _G.sFromCtr == "DN" then tA, tR, tG, tB = DNbcAlpha, DNbcRed, DNbcGreen, DNbcBlue;
		elseif _G.sFromCtr == "RP" then tA, tR, tG, tB = RPbcAlpha, RPbcRed, RPbcGreen, RPbcBlue;
		elseif _G.sFromCtr == "LP" then tA, tR, tG, tB = BC.Alpha["LOTROPoints"], BC.Red["LOTROPoints"], BC.Green["LOTROPoints"], BC.Blue["LOTROPoints"];
		elseif _G.sFromCtr == "PL" then tA, tR, tG, tB = PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue;
		elseif _G.sFromCtr == "GT" then tA, tR, tG, tB = GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue;
		elseif _G.sFromCtr == "ASP" then tA, tR, tG, tB = BC.Alpha["AmrothSilverPiece"], BC.Red["AmrothSilverPiece"], BC.Green["AmrothSilverPiece"], BC.Blue["AmrothSilverPiece"];
		elseif _G.sFromCtr == "SOM" then tA, tR, tG, tB = BC.Alpha["StarsofMerit"], BC.Red["StarsofMerit"], BC.Green["StarsofMerit"], BC.Blue["StarsofMerit"];
		elseif _G.sFromCtr == "CGSP" then tA, tR, tG, tB = BC.Alpha["CentralGondorSilverPiece"], BC.Red["CentralGondorSilverPiece"], BC.Green["CentralGondorSilverPiece"], BC.Blue["CentralGondorSilverPiece"];
		elseif _G.sFromCtr == "GGB" then tA, tR, tG, tB = BC.Alpha["GiftgiversBrand"], BC.Red["GiftgiversBrand"], BC.Green["GiftgiversBrand"], BC.Blue["GiftgiversBrand"];
		elseif _G.sFromCtr == "BB" then tA, tR, tG, tB = BC.Alpha["BingoBadge"], BC.Red["BingoBadge"], BC.Green["BingoBadge"], BC.Blue["BingoBadge"];
		elseif _G.sFromCtr == "LAT" then tA, tR, tG, tB = BC.Alpha["AnniversaryToken"], BC.Red["AnniversaryToken"], BC.Green["AnniversaryToken"], BC.Blue["AnniversaryToken"];
		elseif _G.sFromCtr == "MOE" then tA, tR, tG, tB = BC.Alpha["MotesOfEnchantment"], BC.Red["MotesOfEnchantment"], BC.Green["MotesOfEnchantment"], BC.Blue["MotesOfEnchantment"];
		elseif _G.sFromCtr == "EOE" then tA, tR, tG, tB = BC.Alpha["EmbersOfEnchantment"], BC.Red["EmbersOfEnchantment"], BC.Green["EmbersOfEnchantment"], BC.Blue["EmbersOfEnchantment"];
		elseif _G.sFromCtr == "FOS" then tA, tR, tG, tB = BC.Alpha["FigmentsOfSplendour"], BC.Red["FigmentsOfSplendour"], BC.Green["FigmentsOfSplendour"], BC.Blue["FigmentsOfSplendour"];
		elseif _G.sFromCtr == "FFT" then tA, tR, tG, tB = FFTbcAlpha, FFTbcRed, FFTbcGreen, FFTbcBlue;
		elseif _G.sFromCtr == "FFAT" then tA, tR, tG, tB = FFATbcAlpha, FFATbcRed, FFATbcGreen, FFATbcBlue;
		elseif _G.sFromCtr == "SPL" then tA, tR, tG, tB = SPLbcAlpha, SPLbcRed, SPLbcGreen, SPLbcBlue;
		elseif _G.sFromCtr == "MST" then tA, tR, tG, tB = MSTbcAlpha, MSTbcRed, MSTbcGreen, MSTbcBlue;
		elseif _G.sFromCtr == "AS" then tA, tR, tG, tB = ASbcAlpha, ASbcRed, ASbcGreen, ASbcBlue;
		elseif _G.sFromCtr == "BOT" then tA, tR, tG, tB = BOTbcAlpha, BOTbcRed, BOTbcGreen, BOTbcBlue;
		elseif _G.sFromCtr == "BOD" then tA, tR, tG, tB = BODbcAlpha, BODbcRed, BODbcGreen, BODbcBlue;
		end
	end
	
	if value == "ctr" then
		BC.Alpha["Wallet"], BC.Red["Wallet"], BC.Green["Wallet"], BC.Blue["Wallet"] = tA, tR, tG, tB;
		if Show["Wallet"] then WI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["Money"], BC.Red["Money"], BC.Green["Money"], BC.Blue["Money"] = tA, tR, tG, tB;
		if Show["Money"] then MI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["DestinyPoints"], BC.Red["DestinyPoints"], BC.Green["DestinyPoints"], BC.Blue["DestinyPoints"] = tA, tR, tG, tB;
		if Show["DestinyPoints"] then DP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["Shards"], BC.Red["Shards"], BC.Green["Shards"], BC.Blue["Shards"] = tA, tR, tG, tB;
		if Show["Shards"] then SP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["SkirmishMarks"], BC.Red["SkirmishMarks"], BC.Green["SkirmishMarks"], BC.Blue["SkirmishMarks"] = tA, tR, tG, tB;
		if Show["SkirmishMarks"] then SM[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["MithrilCoins"], BC.Red["MithrilCoins"], BC.Green["MithrilCoins"], BC.Blue["MithrilCoins"] = tA, tR, tG, tB;
		if Show["MithrilCoins"] then MC[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["YuleToken"], BC.Red["YuleToken"], BC.Green["YuleToken"], BC.Blue["YuleToken"] = tA, tR, tG, tB;
		if Show["YuleToken"] then YT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["HytboldTokens"], BC.Red["HytboldTokens"], BC.Green["HytboldTokens"], BC.Blue["HytboldTokens"] = tA, tR, tG, tB;
		if Show["HytboldTokens"] then HT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["Medallions"], BC.Red["Medallions"], BC.Green["Medallions"], BC.Blue["Medallions"] = tA, tR, tG, tB;
		if Show["Medallions"] then MP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["Seals"], BC.Red["Seals"], BC.Green["Seals"], BC.Blue["Seals"] = tA, tR, tG, tB;
		if Show["Seals"] then SL[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["Commendations"], BC.Red["Commendations"], BC.Green["Commendations"], BC.Blue["Commendations"] = tA, tR, tG, tB;
		if Show["Commendations"] then CP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BIbcAlpha, BIbcRed, BIbcGreen, BIbcBlue = tA, tR, tG, tB;
		if ShowBagInfos then BI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		PIbcAlpha, PIbcRed, PIbcGreen, PIbcBlue = tA, tR, tG, tB;
		if ShowPlayerInfos then PI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		EIbcAlpha, EIbcRed, EIbcGreen, EIbcBlue = tA, tR, tG, tB;
		if ShowEquipInfos then EI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		DIbcAlpha, DIbcRed, DIbcGreen, DIbcBlue = tA, tR, tG, tB;
		if ShowDurabilityInfos then DI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		TIbcAlpha, TIbcRed, TIbcGreen, TIbcBlue = tA, tR, tG, tB;
		if ShowTrackItems then TI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		IFbcAlpha, IFbcRed, IFbcGreen, IFbcBlue = tA, tR, tG, tB;
		if ShowInfamy then IF[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		VTbcAlpha, VTbcRed, VTbcGreen, VTbcBlue = tA, tR, tG, tB;
		if ShowVault then VT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		SSbcAlpha, SSbcRed, SSbcGreen, SSbcBlue = tA, tR, tG, tB;
		if ShowSharedStorage then SS[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
--		BKbcAlpha, BKbcRed, BKbcGreen, BKbcBlue = tA, tR, tG, tB;
--		if ShowBank then BK[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		DNbcAlpha, DNbcRed, DNbcGreen, DNbcBlue = tA, tR, tG, tB;
		if ShowDayNight then DN[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		RPbcAlpha, RPbcRed, RPbcGreen, RPbcBlue = tA, tR, tG, tB;
		if ShowReputation then RP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["LOTROPoints"], BC.Red["LOTROPoints"], BC.Green["LOTROPoints"], BC.Blue["LOTROPoints"] = tA, tR, tG, tB;
		if Show["LOTROPoints"] then LP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue = tA, tR, tG, tB;
		if ShowPlayerLoc then PL[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue = tA, tR, tG, tB;
		if ShowGameTime then GT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );	end
		BC.Alpha["AmrothSilverPiece"], BC.Red["AmrothSilverPiece"], BC.Green["AmrothSilverPiece"], BC.Blue["AmrothSilverPiece"] = tA, tR, tG, tB;
		if Show["AmrothSilverPiece"] then ASP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["StarsofMerit"], BC.Red["StarsofMerit"], BC.Green["StarsofMerit"], BC.Blue["StarsofMerit"] = tA, tR, tG, tB;
		if Show["StarsofMerit"] then SOM[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["CentralGondorSilverPiece"], BC.Red["CentralGondorSilverPiece"], BC.Green["CentralGondorSilverPiece"], BC.Blue["CentralGondorSilverPiece"] = tA, tR, tG, tB;
		if Show["CentralGondorSilverPiece"] then CGSP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["GiftgiversBrand"], BC.Red["GiftgiversBrand"], BC.Green["GiftgiversBrand"], BC.Blue["GiftgiversBrand"] = tA, tR, tG, tB;
		if Show["GiftgiversBrand"] then GGB[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["BingoBadge"], BC.Red["BingoBadge"], BC.Green["BingoBadge"], BC.Blue["BingoBadge"] = tA, tR, tG, tB;
		if Show["BingoBadge"] then BB[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["AnniversaryToken"], BC.Red["AnniversaryToken"], BC.Green["AnniversaryToken"], BC.Blue["AnniversaryToken"] = tA, tR, tG, tB;
		if Show["AnniversaryToken"] then LAT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["MotesOfEnchantment"], BC.Red["MotesOfEnchantment"], BC.Green["MotesOfEnchantment"], BC.Blue["MotesOfEnchantment"] = tA, tR, tG, tB;
		if Show["MotesOfEnchantment"] then MOE[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["EmbersOfEnchantment"], BC.Red["EmbersOfEnchantment"], BC.Green["EmbersOfEnchantment"], BC.Blue["EmbersOfEnchantment"] = tA, tR, tG, tB;
		if Show["EmbersOfEnchantment"] then EOE[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BC.Alpha["FigmentsOfSplendour"], BC.Red["FigmentsOfSplendour"], BC.Green["FigmentsOfSplendour"], BC.Blue["FigmentsOfSplendour"] = tA, tR, tG, tB;
		if Show["FigmentsOfSplendour"] then FOS[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		FFTbcAlpha, FFTbcRed, FFTbcGreen, FFTbcBlue = tA, tR, tG, tB;
		if ShowFallFestivalToken then FFT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		FFATbcAlpha, FFATbcRed, FFATbcGreen, FFATbcBlue = tA, tR, tG, tB;
		if ShowFarmersFaireToken then FFAT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		SPLbcAlpha, SPLbcRed, SPLbcGreen, SPLbcBlue = tA, tR, tG, tB;
		if ShowSpringLeaf then SPL[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		MSTbcAlpha, MSTbcRed, MSTbcGreen, MSTbcBlue = tA, tR, tG, tB;
		if ShowMidsummerToken then MST[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		ASbcAlpha, ASbcRed, ASbcGreen, ASbcBlue = tA, tR, tG, tB;
		if ShowAncientScript then AS[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BOTbcAlpha, BOTbcRed, BOTbcGreen, BOTbcBlue = tA, tR, tG, tB;
		if ShowBadgeOfTaste then BOT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
		BODbcAlpha, BODbcRed, BODbcGreen, BODbcBlue = tA, tR, tG, tB;
		if ShowBadgeOfDishonour then BOD[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) ); end
	elseif value == "all" then
		BGColor( cmd, "ctr" );
		BGColor( cmd, "TitanBar" );
	elseif value == "this" then
		if _G.sFromCtr == "WI" then
			WI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "Money" then
			BC.Alpha["Money"], BC.Red["Money"], BC.Green["Money"], BC.Blue["Money"] = tA, tR, tG, tB;
			MI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "DP" then
			BC.Alpha["DestinyPoints"], BC.Red["DestinyPoints"], BC.Green["DestinyPoints"], BC.Blue["DestinyPoints"] = tA, tR, tG, tB;
			DP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "SP" then
			BC.Alpha["Shards"], BC.Red["Shards"], BC.Green["Shards"], BC.Blue["Shards"] = tA, tR, tG, tB;
			SP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "SM" then
			BC.Alpha["SkirmishMarks"], BC.Red["SkirmishMarks"], BC.Green["SkirmishMarks"], BC.Blue["SkirmishMarks"] = tA, tR, tG, tB;
			SM[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "MC" then
			BC.Alpha["MithrilCoins"], BC.Red["MithrilCoins"], BC.Green["MithrilCoins"], BC.Blue["MithrilCoins"] = tA, tR, tG, tB;
			MC[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "YT" then
			BC.Alpha["YuleToken"], BC.Red["YuleToken"], BC.Green["YuleToken"], BC.Blue["YuleToken"] = tA, tR, tG, tB;
			YT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "HT" then
			BC.Alpha["HytboldTokens"], BC.Red["HytboldTokens"], BC.Green["HytboldTokens"], BC.Blue["HytboldTokens"] = tA, tR, tG, tB;
			HT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "MP" then
			BC.Alpha["Medallions"], BC.Red["Medallions"], BC.Green["Medallions"], BC.Blue["Medallions"] = tA, tR, tG, tB;
			MP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "SL" then
			BC.Alpha["Seals"], BC.Red["Seals"], BC.Green["Seals"], BC.Blue["Seals"] = tA, tR, tG, tB;
			SL[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "CP" then
			BC.Alpha["Commendations"], BC.Red["Commendations"], BC.Green["Commendations"], BC.Blue["Commendations"] = tA, tR, tG, tB;
			CP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "BI" then
			BIbcAlpha, BIbcRed, BIbcGreen, BIbcBlue = tA, tR, tG, tB;
			BI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "PI" then
			PIbcAlpha, PIbcRed, PIbcGreen, PIbcBlue = tA, tR, tG, tB;
			PI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "EI" then
			EIbcAlpha, EIbcRed, EIbcGreen, EIbcBlue = tA, tR, tG, tB;
			EI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "DI" then
			DIbcAlpha, DIbcRed, DIbcGreen, DIbcBlue = tA, tR, tG, tB;
			DI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "TI" then
			TIbcAlpha, TIbcRed, TIbcGreen, TIbcBlue = tA, tR, tG, tB;
			TI[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "IF" then
			IFbcAlpha, IFbcRed, IFbcGreen, IFbcBlue = tA, tR, tG, tB;
			IF[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "VT" then
			VTbcAlpha, VTbcRed, VTbcGreen, VTbcBlue = tA, tR, tG, tB;
			VT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "SS" then
			SSbcAlpha, SSbcRed, SSbcGreen, SSbcBlue = tA, tR, tG, tB;
			SS[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
--[[		elseif _G.sFromCtr == "BK" then
			BKbcAlpha, BKbcRed, BKbcGreen, BKbcBlue = tA, tR, tG, tB;
			BK[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );]]
		elseif _G.sFromCtr == "DN" then
			DNbcAlpha, DNbcRed, DNbcGreen, DNbcBlue = tA, tR, tG, tB;
			DN[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "RP" then
			RPbcAlpha, RPbcRed, RPbcGreen, RPbcBlue = tA, tR, tG, tB;
			RP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "LP" then
			BC.Alpha["LOTROPoints"], BC.Red["LOTROPoints"], BC.Green["LOTROPoints"], BC.Blue["LOTROPoints"] = tA, tR, tG, tB;
			LP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );

		elseif _G.sFromCtr == "PL" then
			PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue = tA, tR, tG, tB;
			PL[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "GT" then
			GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue = tA, tR, tG, tB;
			GT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "ASP" then
			BC.Alpha["AmrothSilverPiece"], BC.Red["AmrothSilverPiece"], BC.Green["AmrothSilverPiece"], BC.Blue["AmrothSilverPiece"] = tA, tR, tG, tB;
			ASP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "SOM" then
			BC.Alpha["StarsofMerit"], BC.Red["StarsofMerit"], BC.Green["StarsofMerit"], BC.Blue["StarsofMerit"] = tA, tR, tG, tB;
			SOM[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "CGSP" then
			BC.Alpha["CentralGondorSilverPiece"], BC.Red["CentralGondorSilverPiece"], BC.Green["CentralGondorSilverPiece"], BC.Blue["CentralGondorSilverPiece"] = tA, tR, tG, tB;
			CGSP[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "GGB" then
			BC.Alpha["GiftgiversBrand"], BC.Red["GiftgiversBrand"], BC.Green["GiftgiversBrand"], BC.Blue["GiftgiversBrand"] = tA, tR, tG, tB;
			GGB[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "BB" then
			BC.Alpha["BingoBadge"], BC.Red["BingoBadge"], BC.Green["BingoBadge"], BC.Blue["BingoBadge"] = tA, tR, tG, tB;
			BB[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "LAT" then
			BC.Alpha["AnniversaryToken"], BC.Red["AnniversaryToken"], BC.Green["AnniversaryToken"], BC.Blue["AnniversaryToken"] = tA, tR, tG, tB;
			LAT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "MOE" then
			BC.Alpha["MotesOfEnchantment"], BC.Red["MotesOfEnchantment"], BC.Green["MotesOfEnchantment"], BC.Blue["MotesOfEnchantment"] = tA, tR, tG, tB;
			MOE[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );	
		elseif _G.sFromCtr == "EOE" then
			BC.Alpha["EmbersOfEnchantment"], BC.Red["EmbersOfEnchantment"], BC.Green["EmbersOfEnchantment"], BC.Blue["EmbersOfEnchantment"] = tA, tR, tG, tB;
			EOE[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "FOS" then
			BC.Alpha["FigmentsOfSplendour"], BC.Red["FigmentsOfSplendour"], BC.Green["FigmentsOfSplendour"], BC.Blue["FigmentsOfSplendour"] = tA, tR, tG, tB;
			FOS[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "FFT" then
			FFTbcAlpha, FFTbcRed, FFTbcGreen, FFTbcBlue = tA, tR, tG, tB;
			FFT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "FFAT" then
			FFATbcAlpha, FFATbcRed, FFATbcGreen, FFATbcBlue = tA, tR, tG, tB;
			FFAT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "SPL" then
			SPLbcAlpha, SPLbcRed, SPLbcGreen, SPLbcBlue = tA, tR, tG, tB;
			SPL[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "MST" then
			MSTbcAlpha, MSTbcRed, MSTbcGreen, MSTbcBlue = tA, tR, tG, tB;
			MST[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "AS" then
			ASbcAlpha, ASbcRed, ASbcGreen, ASbcBlue = tA, tR, tG, tB;
			AS[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );	
		elseif _G.sFromCtr == "BOT" then
			BOTbcAlpha, BOTbcRed, BOTbcGreen, BOTbcBlue = tA, tR, tG, tB;
			BOT[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		elseif _G.sFromCtr == "BOD" then
			BODbcAlpha, BODbcRed, BODbcGreen, BODbcBlue = tA, tR, tG, tB;
			BOD[ "Ctr" ]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
		end
	elseif value == "TitanBar" then
		bcAlpha, bcRed, bcGreen, bcBlue = tA, tR, tG, tB;
		TB["win"]:SetBackColor( Turbine.UI.Color( tA, tR, tG, tB ) );
	end

	SaveSettings( true );
	TB["win"].MouseLeave();
end