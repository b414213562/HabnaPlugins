-- WalletToolTip.lua
-- written by Habna
-- rewritten by many


function ShowWIToolTip()
	-- ( offsetX, offsetY, width, height, bubble side )
	--x, y, w, h = -5, -15, 100, 0;
	--mouseX, mouseY = Turbine.UI.Display.GetMousePosition();
	
	--if w + mouseX > screenWidth then x = w - 10; end
	
	_G.ToolTipWin = Turbine.UI.Window();
	_G.ToolTipWin:SetZOrder( 1 );
	--_G.ToolTipWin.xOffset = x;
	--_G.ToolTipWin.yOffset = y;
	_G.ToolTipWin:SetWidth( 100 );
	_G.ToolTipWin:SetVisible( true );

	WITTListBox = Turbine.UI.ListBox();
	WITTListBox:SetParent( _G.ToolTipWin );
	WITTListBox:SetZOrder( 1 );
	WITTListBox:SetPosition( 20, 17 );
	--WITTListBox:SetWidth( _G.ToolTipWin:GetWidth()-30 );
	WITTListBox:SetMaxItemsPerLine( 1 );
	WITTListBox:SetOrientation( Turbine.UI.Orientation.Horizontal );
	--WITTListBox:Se0tBackColor( Color["darkgrey"] ); --debug purpose

	RefreshWITTListBox();

	ApplySkin();
end

function RefreshWITTListBox()
    local PlayerAtt = Turbine.Gameplay.LocalPlayer.GetInstance():GetAttributes();
	WITTListBox:ClearItems();
	WITTPosY, totWidth = 0, 0;
	local bFound = false;
	
	for i = 1, #MenuItem do
		wttcur = MenuItem[i];
		if wttcur == L["Money"] then ttw = Where["Money"];
		elseif wttcur == L["DestinyPoints"] then ttw = Where["DestinyPoints"]; CtrIconCodeIs=WalletItem.DestinyPoints.Icon; CtrQteIs=PlayerAtt:GetDestinyPoints();
		elseif wttcur == L["Shards"] then ttw = Where["Shards"]; CtrIconCodeIs=WalletItem.Shard.Icon; CtrQteIs=GetCurrency( L[ "Shards" ] );
		elseif wttcur == L["SkirmishMarks"] then ttw = Where["SkirmishMarks"]; CtrIconCodeIs=WalletItem.Mark.Icon; CtrQteIs=GetCurrency( L[ "SkirmishMarks" ] );
		elseif wttcur == L["MithrilCoins"] then ttw = Where["MithrilCoins"]; CtrIconCodeIs=WalletItem.Mithril.Icon; CtrQteIs=GetCurrency( L[ "MithrilCoins" ] );
		elseif wttcur == L["YuleToken"] then ttw = Where["YuleToken"]; CtrIconCodeIs=WalletItem.YuleToken.Icon; CtrQteIs=GetCurrency( L[ "YuleToken" ] );
		elseif wttcur == L["HytboldTokens"] then ttw = Where["HytboldTokens"]; CtrIconCodeIs=WalletItem.TokensOfHytbold.Icon; CtrQteIs=GetCurrency( L[ "HytboldTokens" ] );
		elseif wttcur == L["Medallions"] then ttw = Where["Medallions"]; CtrIconCodeIs=WalletItem.Medallion.Icon; CtrQteIs=GetCurrency( L[ "Medallions" ] );
		elseif wttcur == L["Seals"] then ttw = Where["Seals"]; CtrIconCodeIs=WalletItem.Seal.Icon; CtrQteIs=GetCurrency( L[ "Seals" ] );
		elseif wttcur == L["Commendations"] then ttw = Where["Commendations"]; CtrIconCodeIs=WalletItem.Commendation.Icon; CtrQteIs=GetCurrency( L[ "Commendations" ] );
		elseif wttcur == L["LOTROPoints"] then ttw = Where["LOTROPoints"]; CtrIconCodeIs=WalletItem.LOTROPTS.Icon; CtrQteIs=_G.LOTROPTS;
		elseif wttcur == L["AmrothSilverPiece"] then ttw = Where["AmrothSilverPiece"]; CtrIconCodeIs=WalletItem.AmrothSilverPiece.Icon; CtrQteIs=GetCurrency( L[ "AmrothSilverPiece" ] );
		elseif wttcur == L["StarsofMerit"] then ttw = Where["StarsofMerit"]; CtrIconCodeIs=WalletItem.StarsofMerit.Icon; CtrQteIs=GetCurrency( L[ "StarsofMerit" ] );
		elseif wttcur == L["CentralGondorSilverPiece"] then ttw = Where["CentralGondorSilverPiece"]; CtrIconCodeIs=WalletItem.CentralGondorSilverPiece.Icon; CtrQteIs=GetCurrency( L[ "CentralGondorSilverPiece" ] );
		elseif wttcur == L["GiftgiversBrand"] then ttw = Where["GiftgiversBrand"]; CtrIconCodeIs=WalletItem.GiftgiversBrand.Icon; CtrQteIs=GetCurrency( L[ "GiftgiversBrand" ] );
		elseif wttcur == L["MAOE"] then ttw = _G.AOEWhere; CtrIconCodeIs=WalletItem.AshOfEnchantment.Icon; CtrQteIs=GetCurrency( L[ "MAOE" ] );
		elseif wttcur == L["BingoBadge"] then ttw = Where["BingoBadge"]; CtrIconCodeIs=WalletItem.BingoBadge.Icon; CtrQteIs=GetCurrency( L[ "BingoBadge" ] );
		elseif wttcur == L["AnniversaryToken"] then ttw = Where["AnniversaryToken"]; CtrIconCodeIs=WalletItem.AnniversaryToken.Icon; CtrQteIs=GetCurrency( L[ "AnniversaryToken" ] );
		elseif wttcur == L["MotesOfEnchantment"] then ttw = Where["MotesOfEnchantment"]; CtrIconCodeIs=WalletItem.MotesOfEnchantment.Icon; CtrQteIs=GetCurrency( L[ "MotesOfEnchantment" ] );
		elseif wttcur == L["EmbersOfEnchantment"] then ttw = Where["EmbersOfEnchantment"]; CtrIconCodeIs=WalletItem.EmbersOfEnchantment.Icon; CtrQteIs=GetCurrency( L[ "EmbersOfEnchantment" ] );
		elseif wttcur == L["FigmentsOfSplendour"] then ttw = Where["FigmentsOfSplendour"]; CtrIconCodeIs=WalletItem.FigmentsOfSplendour.Icon; CtrQteIs=GetCurrency( L[ "FigmentsOfSplendour" ] );
		elseif wttcur == L["FallFestivalToken"] then ttw = Where["FallFestivalToken"]; CtrIconCodeIs=WalletItem.FallFestivalToken.Icon; CtrQteIs=GetCurrency( L[ "FallFestivalToken" ] );
		elseif wttcur == L["FarmersFaireToken"] then ttw = Where["FarmersFaireToken"]; CtrIconCodeIs=WalletItem.FarmersFaireToken.Icon; CtrQteIs=GetCurrency( L[ "FarmersFaireToken" ] );	
		elseif wttcur == L["SpringLeaf"] then ttw = Where["SpringLeaf"]; CtrIconCodeIs=WalletItem.SpringLeaf.Icon; CtrQteIs=GetCurrency( L[ "SpringLeaf" ] );
		elseif wttcur == L["MidsummerToken"] then ttw = Where["MidsummerToken"]; CtrIconCodeIs=WalletItem.MidsummerToken.Icon; CtrQteIs=GetCurrency( L[ "MidsummerToken" ] );
		elseif wttcur == L["AncientScript"] then ttw = Where["AncientScript"]; CtrIconCodeIs=WalletItem.AncientScript.Icon; CtrQteIs=GetCurrency( L[ "AncientScript" ] );	
		elseif wttcur == L["BadgeOfTaste"] then ttw = Where["BadgeOfTaste"]; CtrIconCodeIs=WalletItem.BadgeOfTaste.Icon; CtrQteIs=GetCurrency( L[ "BadgeOfTaste" ] );
		elseif wttcur == L["BadgeOfDishonour"] then ttw = Where["BadgeOfDishonour"]; CtrIconCodeIs=WalletItem.BadgeOfDishonour.Icon; CtrQteIs=GetCurrency( L[ "BadgeOfDishonour" ] );
		end
		
		if tonumber(ttw) == 2 then
			WITTPosY = WITTPosY + 32;
			bFound = true;
		
			--**v Control of all data v**
			local WITTCtr = Turbine.UI.Control();
			WITTCtr:SetParent( WITTListBox );
			WITTCtr:SetHeight( 32 );
			--WITTCtr:SetBackColor( Color["red"] ); -- Debug purpose
			--**^

			if wttcur == L["Money"] then --Money control
				local wiPosX, tmWidth = 0, 0;
				local wmoney = PlayerAtt:GetMoney();
				DecryptMoney(wmoney);
				local twmoney = { gold, silver, copper };
				--local twmoneyi = { 0x41007e7b, 0x41007e7c, 0x41007e7d }; --gold, silver, copper icon 27x21
				for w = 1, 3 do
					--**v Quantity v**
					local lblQte = Turbine.UI.Label();
					lblQte:SetParent( WITTCtr );
					lblQte:SetPosition( wiPosX+5, 0 );
					lblQte:SetText( twmoney[w] );
					lblQte:SetSize( lblQte:GetTextLength() * NM, WITTCtr:GetHeight() );
					--lblQte:SetForeColor( Color["green"] );
					lblQte:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleRight );
					tmWidth = tmWidth + lblQte:GetWidth()+5;
					--lblQte:SetBackColor( Color["red"] ); -- debug purpose
					--**^
					--**v Icon v**
					local ttIcon = Turbine.UI.Control();
					ttIcon:SetParent( WITTCtr );
					ttIcon:SetPosition( lblQte:GetLeft()+lblQte:GetWidth()-2, 5 );
					ttIcon:SetSize( 27, 21 );
					ttIcon:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
					ttIcon:SetBackground( resources.MoneyIcon[w] ); --tonumber(twmoneyi[w]) );
					tmWidth = tmWidth + ttIcon:GetWidth()-2;
					--ttIcon:SetBackColor( Color["blue"] ); -- Debug purpose
					--**^
					wiPosX = wiPosX + (lblQte:GetWidth()+ttIcon:GetWidth()+7);
					tmWidth = tmWidth + 5;
				end
				--** Get width - set tooltip width **--
				if tmWidth > totWidth then totWidth = tmWidth; end
				WITTCtr:SetWidth( totWidth );
				WITTListBox:SetWidth( totWidth );
				_G.ToolTipWin:SetWidth( totWidth + 40 );
				--**
			else --All other control
				--**v Icon v**
				local ttIcon = Turbine.UI.Control();
				ttIcon:SetParent( WITTCtr );
				ttIcon:SetPosition( 0, 0 );
				ttIcon:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
			
				if wttcur == L["Seals"] or wttcur == L["LOTROPoints"] then ttIcon:SetBackground( CtrIconCodeIs );
				else ttIcon:SetBackground( tonumber(CtrIconCodeIs) ); end
				--ttIcon:SetBackColor( Color["blue"] ); -- Debug purpose
				--**^
				--**v Quantity v**
				local lblQte = Turbine.UI.Label();
				lblQte:SetParent( WITTCtr );
				lblQte:SetPosition( 35, 0 );
				lblQte:SetText( CtrQteIs );
				lblQte:SetSize( lblQte:GetTextLength() * NM, WITTCtr:GetHeight() );
				--lblQte:SetForeColor( Color["green"] );
				lblQte:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft );
				--lblQte:SetBackColor( Color["red"] ); -- debug purpose
				--**^
				--** Get width - set tooltip width **--
				local tWidth = lblQte:GetWidth() +35;
				if tWidth > totWidth then totWidth = tWidth; end
				WITTCtr:SetWidth(totWidth);
				WITTListBox:SetWidth(totWidth);
				_G.ToolTipWin:SetWidth( totWidth+40 );
				--**
				--** Resize Destiny points & LOTRO points icon since it's not in 32x32 **--
				if wttcur == L["DestinyPoints"] then
					ttIcon:SetSize( 21, 22 );
					ttIcon:SetStretchMode( 1 );
					ttIcon:SetSize( 32, 32 );
					ttIcon:SetStretchMode( 3 );
				elseif wttcur == L["LOTROPoints"] then
					ttIcon:SetSize( 30, 32 )
					ttIcon:SetStretchMode( 1 );
					ttIcon:SetSize( 32, 32 );
					ttIcon:SetStretchMode( 2 );
				else ttIcon:SetSize( 32, 32 ); end
				--**
			end
			WITTListBox:AddItem( WITTCtr );
		end
	end
	if not bFound then --If not showing any control
		WITTPosY = WITTPosY + 32;

		_G.ToolTipWin:SetWidth( 300 );
		WITTListBox:SetWidth( _G.ToolTipWin:GetWidth()-40 );

		local lblName = Turbine.UI.Label();
		lblName:SetParent( _G.ToolTipWin );
		lblName:SetText( L["WInc"] );
		lblName:SetPosition( 0, 0 );
		lblName:SetSize( WITTListBox:GetWidth(), 32 );
		lblName:SetForeColor( Color["green"] );
		lblName:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		--lblName:SetBackColor( Color["red"] ); -- debug purpose

		WITTListBox:AddItem( lblName );
	end

	WITTListBox:SetHeight( WITTPosY );
	_G.ToolTipWin:SetHeight( WITTPosY + 37 );

	local mouseX, mouseY = Turbine.UI.Display.GetMousePosition();
			
	if _G.ToolTipWin:GetWidth() + mouseX + 5 > screenWidth then x = _G.ToolTipWin:GetWidth() - 10;
	else x = -5; end
			
	if TBTop then y = -15;
	else y = _G.ToolTipWin:GetHeight() end

	_G.ToolTipWin:SetPosition( mouseX - x, mouseY - y);
end