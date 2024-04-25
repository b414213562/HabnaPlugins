-- frmMain.lua
-- written by Habna


function frmMain()
	--**v Check if TitanBar Reloader/Unloader is loaded v**
	Turbine.PluginManager.RefreshAvailablePlugins();
	loaded_plugins = Turbine.PluginManager.GetLoadedPlugins();

	TBRChecker = Turbine.UI.Control();
	TBRChecker:SetWantsUpdates( true );
	
	TBRChecker.Update = function( sender, args )
		for k,v in pairs(loaded_plugins) do
			if v.Name == "TitanBar Reloader" then
				Turbine.PluginManager.UnloadScriptState( 'TitanBarReloader' );
				--break;
			end
			if v.Name == "TitanBar Unloader" then
				Turbine.PluginManager.UnloadScriptState( 'TitanBarUnloader' );
				--break;
			end
		end
		TBRChecker:SetWantsUpdates( false );
	end
	--**^
	
	TB["win"] = Turbine.UI.Window();
	if TBTop then TB["win"]:SetPosition( 0, 0 );
	else TB["win"]:SetPosition( 0, screenHeight - TBHeight ); end
	TB["win"]:SetSize( screenWidth, TBHeight );
	--TB["win"]:SetBackground( resources.TitanBar.Background );
	TB["win"]:SetBackColor( Turbine.UI.Color( bcAlpha, bcRed, bcGreen, bcBlue ) );
	--TB["win"]:SetMouseVisible( false ); -- If set to false, menu will not work.
	TB["win"]:SetWantsKeyEvents( true );
	TB["win"]:SetVisible( true );
	--TB["win"]:SetZOrder( 10 );
	TB["win"]:Activate();

	
	--**v TitanBar event handlers v**
	TB["win"].KeyDown = function( sender, args )
		if ( args.Action == 268435635 ) then -- Hide if F12 key is pressed
			if not CSPress then
				TB["win"]:SetVisible( not TB["win"]:IsVisible() );
				if not windowOpen then MouseHoverCtr:SetVisible( not MouseHoverCtr:IsVisible() ); end
			end
			F12Press = not F12Press;
		elseif ( args.Action == 268435579 ) then -- Hide if (Ctrl + \) is pressed
			if not F12Press then
				TB["win"]:SetVisible( not TB["win"]:IsVisible() );
				if not windowOpen then MouseHoverCtr:SetVisible( not MouseHoverCtr:IsVisible() ); end
			end
			CSPress = not CSPress;
		--elseif ( args.Action == 268435635 ) then -- toggle HUD
			
		end
	end

	TB["win"].MouseMove = function( sender, args )
		windowOpen = false;
		AutoHideCtr:SetWantsUpdates( true );
	end

	TB["win"].MouseLeave = function( sender, args )
		if Player:IsInCombat() and windowOpen and TBAutoHide ~= L["OPAHD"] then AutoHideCtr:SetWantsUpdates( true );
		elseif TBAutoHide == L["OPAHE"] then AutoHideCtr:SetWantsUpdates( true ); end
	end

	TB["win"].MouseClick = function( sender, args )
		TB["win"].MouseMove();

		if ( args.Button == Turbine.UI.MouseButton.Right ) then
			mouseXPos, mouseYPos = Turbine.UI.Display.GetMousePosition();
			_G.sFromCtr = "TitanBar";
			TitanBarMenu:ShowMenu();
		--elseif ( args.Button == Turbine.UI.MouseButton.Left ) then
			
		end
	end

	TB["win"].MouseDoubleClick = function( sender, args )
		ReloadTitanBar();
	end
	--**

	MouseHoverCtr = Turbine.UI.Window();
	MouseHoverCtr:SetPosition( (TB["win"]:GetWidth() / 2) - 125 , TB["win"]:GetHeight() );
	MouseHoverCtr:SetSize( 250, 15 );
	--MouseHoverCtr:SetZOrder( 1 );
	--MouseHoverCtr:SetBackColor( Color["red"] ); --debug purpose
	MouseHoverCtr:SetBackground( resources.frmMain ); 

	MouseHoverCtr.MouseHover = function( sender, args )
		AutoHideCtr:SetWantsUpdates( true );
	end
	
	AutoHideCtr = Turbine.UI.Control();
	--AutoHideCtr:SetWantsUpdates( true ); --debug purpose
	AutoHideCtr.Update = function( sender, args )
		if windowOpen then
			MouseHoverCtr:SetVisible( false );
			if TBTop then --TitanBar is at top
				if ( TB["win"]:GetTop() + TB["win"]:GetHeight() == 0 ) then
					AutoHideCtr:SetWantsUpdates( false );
					windowOpen = false;
					MouseHoverCtr:SetVisible( true );
					MouseHoverCtr:SetTop( TB["win"]:GetTop() + TB["win"]:GetHeight() );
				else
					TB["win"]:SetTop( TB["win"]:GetTop() - 1 );
				end
			else  --TitanBar is at bottom
				if ( TB["win"]:GetTop() == screenHeight ) then
					AutoHideCtr:SetWantsUpdates( false );
					windowOpen = false;
					MouseHoverCtr:SetVisible( true );
					MouseHoverCtr:SetTop( TB["win"]:GetTop() - MouseHoverCtr:GetHeight() );
				else
					TB["win"]:SetTop( TB["win"]:GetTop() + 1 );
				end
			end
		else
			MouseHoverCtr:SetVisible( false );
			if TBTop then --TitanBar is at top
				if ( TB["win"]:GetTop() == 0 ) then
					AutoHideCtr:SetWantsUpdates( false );
					windowOpen = true;
				else
					TB["win"]:SetTop( TB["win"]:GetTop() + 1 );
				end
			else --TitanBar is at bottom
				if ( TB["win"]:GetTop() + TB["win"]:GetHeight() == screenHeight ) then
					AutoHideCtr:SetWantsUpdates( false );
					windowOpen = true;
				else
					TB["win"]:SetTop( TB["win"]:GetTop() - 1 );
				end
			end
		end
	end
	
	PlayerCurrency = {};
	PlayerCurrencyHandler = {};

	LoadPlayerWallet();
	LoadPlayerMoney();
	LoadPlayerVault();
	LoadPlayerSharedStorage();
	LoadPlayerBags();
	--LoadPlayerBank();
	--LoadPlayerMount();
	--LoadPlayerPet();
	LoadPlayerReputation();
	LoadPlayerLOTROPoints();
	LoadPlayerItemTrackingList();
	LoadPlayerProfile();

	if TBReloaded and TBReloadedText == "Profile" then opt_profile.Click(); end--TitanBar was reloaded because a profile need to be loaded
	if TBReloaded and TBReloadedText == "Font" then opt_options.Click(); end--TitanBar was reloaded because a font need to be loaded

	if TBAutoHide == L["OPAHE"] then AutoHideCtr:SetWantsUpdates( true ); end --Auto hide if needed

	if PlayerAlign == 1 then
		if PlayerWalletSize ~= nil or PlayerWalletSize ~= 0 then
			if Where["Shards"] ~= 3 then ImportCtr( "SP" ); end
			if Where["SkirmishMarks"] ~= 3 then ImportCtr( "SM" ); end
			if Where["MithrilCoins"] ~= 3 then ImportCtr( "MC" ); end
			if Where["YuleToken"] ~= 3 then ImportCtr( "YT" ); end
			if Where["HytboldTokens"] ~= 3 then ImportCtr( "HT" ); end
			if Where["Medallions"] ~= 3 then ImportCtr( "MP" ); end
			if Where["Seals"] ~= 3 then ImportCtr( "SL" ); end
			if Where["Commendations"] ~= 3 then ImportCtr( "CP" ); end
			if Where["AmrothSilverPiece"] ~= 3 then ImportCtr( "ASP" ); end
			if Where["StarsofMerit"] ~= 3 then ImportCtr( "SOM" ); end
			if Where["CentralGondorSilverPiece"] ~= 3 then ImportCtr( "CGSP" ); end
			if Where["GiftgiversBrand"] ~= 3 then ImportCtr( "GGB" ); end
			if Where["BingoBadge"] ~= 3 then ImportCtr( "BB" ); end
			if Where["AnniversaryToken"] ~= 3 then ImportCtr( "LAT" ); end
			if Where["MotesOfEnchantment"] ~= 3 then ImportCtr( "MOE" ); end
			if Where["EmbersOfEnchantment"] ~= 3 then ImportCtr( "EOE" ); end
			if Where["FigmentsOfSplendour"] ~= 3 then ImportCtr( "FOS" ); end
			if Where["FallFestivalToken"] ~= 3 then ImportCtr( "FFT" ); end
			if Where["FarmersFaireToken"] ~= 3 then ImportCtr( "FFAT" ); end
			if _G.SPLWhere ~= 3 then ImportCtr( "SPL" ); end
			if _G.MSTWhere ~= 3 then ImportCtr( "MST" ); end
			if _G.ASWhere ~= 3 then ImportCtr( "AS" ); end
			if _G.BOTWhere ~= 3 then ImportCtr( "BOT" ); end
			if _G.BODWhere ~= 3 then ImportCtr( "BOD" ); end
		end
	else
		-- Disable infos not useful in Monster Play
		ShowDurabilityInfos, ShowEquipInfos, Show["DestinyPoints"], Show["Shards"] = false, false, false, false;
		Show["YuleToken"], Show["SkirmishMarks"], Show["HytboldTokens"], Show["Medallions"] = false, false, false, false;
		Show["Seals"], ShowVault, ShowSharedStorage, Show["AmrothSilverPiece"] = false, false, false, false;
		Show["StarsofMerit"], Show["CentralGondorSilverPiece"], Show["GiftgiversBrand"] = false, false, false;
		Show["BingoBadge"], Show["AnniversaryToken"], ShowReputation = false, false, false;
		Show["MotesOfEnchantment"] = false;
		Show["EmbersOfEnchantment"] = false;
		Show["FigmentsOfSplendour"] = false;
		Show["FallFestivalToken"] = false;
		Show["FarmersFaireToken"] = false;
		ShowSpringLeaf = false;
		ShowMidsummerToken = false;
		ShowAncientScript = false;
		if PlayerWalletSize ~= nil or PlayerWalletSize ~= 0 then
			if Show["Wallet"] then ImportCtr( "WI" ); end
			if Where["Commendations"] ~= 3 then ImportCtr( "CP" ); end
			if Where["LOTROPoints"] ~= 3 then ImportCtr( "LP" ); end
		end
	end

	if Show["Wallet"] then ImportCtr( "WI" ); end
	if Where["Money"] ~= 3 then ImportCtr( "MI" ); end
	if Where["DestinyPoints"] ~= 3 then ImportCtr( "DP" ); end
	if ShowTrackItems then ImportCtr( "TI" ); end --Track Items
	if ShowInfamy then ImportCtr( "IF" ); end --Infamy/Renown
	if ShowVault then ImportCtr( "VT" ); end --Vault
	if ShowSharedStorage then ImportCtr( "SS" ); end --SharedStorage
	--if ShowBank then ImportCtr( "BK" ); end --Bank
	if ShowDayNight then ImportCtr( "DN" ); end --Day & Night time
	if ShowReputation then ImportCtr( "RP" ); end --Reputation Points
	if Where["LOTROPoints"] ~= 3 then ImportCtr( "LP" ); end --LOTRO Points

	--**v Workaround for the ItemRemoved that fires before the backpack was updated (Turbine API issue) v**
	ItemRemovedTimer = Turbine.UI.Control();
	
	ItemRemovedTimer.Update = function( sender, args )
		ItemRemovedTimer:SetWantsUpdates( false );
		UpdateBackpackInfos();
	end
	--**
	
	if ShowBagInfos then ImportCtr( "BI" );	end
	if ShowPlayerInfos then ImportCtr( "PI" ); end
	if ShowPlayerLoc then ImportCtr( "PL" ); end
	if ShowGameTime then ImportCtr( "GT" ); end

	if ShowDurabilityInfos or ShowEquipInfos then
		GetEquipmentInfos();
		AddCallback(PlayerEquipment, "ItemEquipped", function(sender, args) if ShowEquipInfos then GetEquipmentInfos(); UpdateEquipsInfos(); end if ShowDurabilityInfos then GetEquipmentInfos(); UpdateDurabilityInfos(); end end);
		AddCallback(PlayerEquipment, "ItemUnequipped", function(sender, args) ItemUnEquippedTimer:SetWantsUpdates( true ); end); --Workaround
		--AddCallback(PlayerEquipment, "ItemUnequipped", function(sender, args) if ShowEquipInfos then GetEquipmentInfos(); UpdateEquipsInfos(); end if ShowDurabilityInfos then GetEquipmentInfos(); UpdateDurabilityInfos(); end end);
	end
	
	--**v Workaround for the ItemUnequipped that fires before the equipment was updated (Turbine API issue) v**
	ItemUnEquippedTimer = Turbine.UI.Control();

	ItemUnEquippedTimer.Update = function( sender, args )
		if ShowEquipInfos then GetEquipmentInfos(); UpdateEquipsInfos(); end
		if ShowDurabilityInfos then GetEquipmentInfos(); UpdateDurabilityInfos(); end
		ItemUnEquippedTimer:SetWantsUpdates( false );
	end
	--**
	
	if ShowEquipInfos then ImportCtr( "EI" ); end
	if ShowDurabilityInfos then ImportCtr( "DI" ); end
	
	--**v Run these functions at-startup only once because if TitanBar is loaded with in-game plugin manager some controls do not update properly v**
	OneTimer = Turbine.UI.Control();
	AllTimer = Turbine.UI.Control();
	AllTimer:SetWantsUpdates( true );
	
	if ShowEquipInfos or ShowDurabilityInfos then OneTimer:SetWantsUpdates( true ); AllTimer:SetWantsUpdates( false ); NumSec = 0; Interval = 2; end
	if TBReloaded then OneTimer:SetWantsUpdates( false ); settings.TitanBar.Z = false; settings.TitanBar.ZT = "TB"; SaveSettings( false ); end --TitanBar was reloaded

	OneTimer.Update = function( sender, args )
		local currentdate = Turbine.Engine.GetDate();
		local currentsecond = currentdate.Second;
		if _G.Debug then max = 6; else max = 24; end
		if NumSec < max then -- Run for 24 secs.
			if (oldsecond ~= currentsecond) then
				if Interval == 0 then
					if ShowEquipInfos or ShowDurabilityInfos then GetEquipmentInfos();
						if PlayerEquipment ~= nil then
							if ShowEquipInfos then ImportCtr( "EI" ); end
							if ShowDurabilityInfos then ImportCtr( "DI" ); end
						end
					end

					if _G.Debug then write( "OneTimer: Interval" );	end

					Interval = 2;
				else
					Interval = Interval - 1;
				end
				
				oldsecond = currentsecond;
				NumSec = NumSec + 1;

				if _G.Debug then
					if NumSec <= 1 then seconds = "sec"; else seconds = "secs"; end
					write( "OneTimer: " .. NumSec .. " " .. seconds );
				end
			end
		else
			AllTimer:SetWantsUpdates( true );
			OneTimer:SetWantsUpdates( false );
		end
	end
	--**
	
	--**v Run these functions all the time v**	
	AllTimer.Update = function( sender, args )
		local currentdate = Turbine.Engine.GetDate();
		local currentminute = currentdate.Minute;
		local currentsecond = currentdate.Second;
		
		if (oldminute ~= currentminute) then
			if ShowGameTime then-- Until I find the minute changed event or something similar
				if _G.ShowBT then UpdateGameTime("bt");
				elseif _G.ShowST then UpdateGameTime("st");
				else UpdateGameTime("gt") end
			end
		end
		
		if (oldsecond ~= currentsecond) then
			--Detect if wallet size has changed
			if PlayerWallet:GetSize() ~= PlayerWalletSize then -- Until I find the size changed event or something similar in wallet
				LoadPlayerWallet();
				if Where["Shards"] ~= 3 then ImportCtr( "SP" ); end
				if Where["SkirmishMarks"] ~= 3 then ImportCtr( "SM" ); end
				if Where["MithrilCoins"] ~= 3 then ImportCtr( "MC" ); end
				if Where["YuleToken"] ~= 3 then ImportCtr( "YT" ); end
				if Where["HytboldTokens"] ~= 3 then ImportCtr( "HT" ); end
				if Where["Medallions"] ~= 3 then ImportCtr( "MP" ); end
				if Where["Seals"] ~= 3 then ImportCtr( "SL" ); end
				if Where["LOTROPoints"] ~= 3 then ImportCtr( "CP" ); end
				if Where["AmrothSilverPiece"] ~= 3 then ImportCtr( "ASP" ); end
				if Where["StarsofMerit"] ~= 3 then ImportCtr( "SOM" ); end
				if Where["CentralGondorSilverPiece"] ~= 3 then ImportCtr( "CGSP" ); end
				if Where["GiftgiversBrand"] ~= 3 then ImportCtr( "GGB" ); end
				if Where["BingoBadge"] ~= 3 then ImportCtr( "BB" ); end
				if Where["AnniversaryToken"] ~= 3 then ImportCtr( "LAT" ); end
				if Where["MotesOfEnchantment"] ~= 3 then ImportCtr( "MOE" ); end
				if Where["EmbersOfEnchantment"] ~= 3 then ImportCtr( "EOE" ); end
				if Where["FigmentsOfSplendour"] ~= 3 then ImportCtr( "FOS" ); end
				if Where["FallFestivalToken"] ~= 3 then ImportCtr( "FFT" ); end
				if Where["FarmersFaireToken"] ~= 3 then ImportCtr( "FFAT" ); end
				if _G.SPLWhere ~= 3 then ImportCtr( "SPL" ); end
				if _G.MSTWhere ~= 3 then ImportCtr( "MST" ); end
				if _G.ASWhere ~= 3 then ImportCtr( "AS" ); end
				if _G.BOTWhere ~= 3 then ImportCtr( "BOT" ); end
				if _G.BODWhere ~= 3 then ImportCtr( "BOD" ); end
			end

			screenWidth, screenHeight = Turbine.UI.Display.GetSize();
			if TBWidth ~= screenWidth then ReplaceCtr(); end --Replace control if screen width has changed

			if ShowDayNight then UpdateDayNight(); end
		end

		oldminute = currentminute;
		oldsecond = currentsecond;

		--When player log out & log in with same character, the durability control show -1%
		--Because equipment info are not avail when re-login, weird!
		--if PlayerAlign == 1 and ShowDurabilityInfos then if DI[ "Lbl" ]:GetText() == "-1%" then GetEquipmentInfos(); UpdateDurabilityInfos(); end end
	end
	--**
end