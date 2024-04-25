-- background.lua
-- Written by Habna
-- Rewritten by many


function frmBackground()
	sFrom = _G.sFromCtr;
	curColor = {};
	bClick = false;
	
	-- **v Set some window stuff v**
	wBackground = Turbine.UI.Lotro.Window();
	wBackground.Opacity = 1;
	wBackground:SetText( L["BWTitle"] );
	wBackground:SetSize( 400, 210 );
	wBackground:SetPosition( BGWLeft, BGWTop );
	wBackground:SetVisible( true );
	wBackground:SetWantsKeyEvents( true );
	--wBackground:SetZOrder( 2 );
	--wBackground:Activate();
	-- **^
	-- **v Check box - label v**
	local SetToAllCtr = Turbine.UI.Lotro.CheckBox();
	SetToAllCtr:SetParent( wBackground );
	SetToAllCtr:SetPosition( 40, wBackground:GetHeight() - 70 );
	SetToAllCtr:SetText( L["BWApply"] );
	SetToAllCtr:SetSize( SetToAllCtr:GetTextLength() * 8, 30 );
	SetToAllCtr:SetVisible( true );
	--SetToAllCtr:SetEnabled( false );
	SetToAllCtr:SetChecked( BGWToAll );
	SetToAllCtr:SetForeColor( Color["rustedgold"] );

	SetToAllCtr.CheckedChanged = function( sender, args )
		BGWToAll = SetToAllCtr:IsChecked();
		--if BGWToAll then ChangeColor(mColor); end
		settings.Background.A = BGWToAll;
		SaveSettings( false );
	end
	-- **^

	-- **v Currently set color - label v**
	local CurSetColorLbl = Turbine.UI.Label();
	CurSetColorLbl:SetParent( wBackground );
	CurSetColorLbl:SetPosition( 305, 35 );
	CurSetColorLbl:SetSize( 80, 30 );
	CurSetColorLbl:SetText( L["BWCurSetColor"] );
	CurSetColorLbl:SetVisible( true );
	CurSetColorLbl:SetForeColor( Color["rustedgold"] );
	-- **^
	-- **v Currently Selected color - box v**
	curSelColorBorder = Turbine.UI.Label();
	curSelColorBorder:SetParent( wBackground );
	curSelColorBorder:SetSize( 73, 73 );
	curSelColorBorder:SetPosition( 305, 60 );
	curSelColorBorder:SetBackColor( Color["white"] );

	curSelColor = Turbine.UI.Label();
	curSelColor:SetParent( curSelColorBorder );
	curSelColor:SetSize( 71, 71 );
	curSelColor:SetPosition( 1, 1 );
	
	-- Set backcolor window setting to currently control color
	if sFrom == "TitanBar" then curSelAlpha = bcAlpha; curSelRed = bcRed; curSelGreen = bcGreen; curSelBlue = bcBlue; end
	if sFrom == "WI" then curSelAlpha = BC.Alpha["Wallet"]; curSelRed = BC.Red["Wallet"]; curSelGreen = BC.Green["Wallet"]; curSelBlue = BC.Blue["Wallet"]; end
	if sFrom == "Money" then curSelAlpha = BC.Alpha["Money"]; curSelRed = BC.Red["Money"]; curSelGreen = BC.Green["Money"]; curSelBlue = BC.Blue["Money"]; end
	if sFrom == "DP" then curSelAlpha = BC.Alpha["DestinyPoints"]; curSelRed = BC.Red["DestinyPoints"]; curSelGreen = BC.Green["DestinyPoints"]; curSelBlue = BC.Blue["DestinyPoints"]; end
	if sFrom == "SP" then curSelAlpha = BC.Alpha["Shards"]; curSelRed = BC.Red["Shards"]; curSelGreen = BC.Green["Shards"]; curSelBlue = BC.Blue["Shards"]; end
	if sFrom == "SM" then curSelAlpha = BC.Alpha["SkirmishMarks"]; curSelRed = BC.Red["SkirmishMarks"]; curSelGreen = BC.Green["SkirmishMarks"]; curSelBlue = BC.Blue["SkirmishMarks"]; end
	if sFrom == "MC" then curSelAlpha = BC.Alpha["MithrilCoins"]; curSelRed = BC.Red["MithrilCoins"]; curSelGreen = BC.Green["MithrilCoins"]; curSelBlue = BC.Blue["MithrilCoins"]; end
	if sFrom == "YT" then curSelAlpha = BC.Alpha["YuleToken"]; curSelRed = BC.Red["YuleToken"]; curSelGreen = BC.Green["YuleToken"]; curSelBlue = BC.Blue["YuleToken"]; end
	if sFrom == "HT" then curSelAlpha = BC.Alpha["HytboldTokens"]; curSelRed = BC.Red["HytboldTokens"]; curSelGreen = BC.Green["HytboldTokens"]; curSelBlue = BC.Blue["HytboldTokens"]; end
	if sFrom == "MP" then curSelAlpha = BC.Alpha["Medallions"]; curSelRed = BC.Red["Medallions"]; curSelGreen = BC.Green["Medallions"]; curSelBlue = BC.Blue["Medallions"]; end
	if sFrom == "SL" then curSelAlpha = BC.Alpha["Seals"]; curSelRed = BC.Red["Seals"]; curSelGreen = BC.Green["Seals"]; curSelBlue = BC.Blue["Seals"]; end
	if sFrom == "CP" then curSelAlpha = BC.Alpha["Commendations"]; curSelRed = BC.Red["Commendations"]; curSelGreen = BC.Green["Commendations"]; curSelBlue = BC.Blue["Commendations"]; end
	if sFrom == "BI" then curSelAlpha = BIbcAlpha; curSelRed = BIbcRed; curSelGreen = BIbcGreen; curSelBlue = BIbcBlue; end
	if sFrom == "PI" then curSelAlpha = PIbcAlpha; curSelRed = PIbcRed; curSelGreen = PIbcGreen; curSelBlue = PIbcBlue; end
	if sFrom == "EI" then curSelAlpha = EIbcAlpha; curSelRed = EIbcRed; curSelGreen = EIbcGreen; curSelBlue = EIbcBlue; end
	if sFrom == "DI" then curSelAlpha = DIbcAlpha; curSelRed = DIbcRed; curSelGreen = DIbcGreen; curSelBlue = DIbcBlue; end
	if sFrom == "TI" then curSelAlpha = TIbcAlpha; curSelRed = TIbcRed; curSelGreen = TIbcGreen; curSelBlue = TIbcBlue; end
	if sFrom == "IF" then curSelAlpha = IFbcAlpha; curSelRed = IFbcRed; curSelGreen = IFbcGreen; curSelBlue = IFbcBlue; end
	if sFrom == "VT" then curSelAlpha = VTbcAlpha; curSelRed = VTbcRed; curSelGreen = VTbcGreen; curSelBlue = VTbcBlue; end
	if sFrom == "SS" then curSelAlpha = SSbcAlpha; curSelRed = SSbcRed; curSelGreen = SSbcGreen; curSelBlue = SSbcBlue; end
	if sFrom == "BK" then curSelAlpha = BKbcAlpha; curSelRed = BKbcRed; curSelGreen = BKbcGreen; curSelBlue = BKbcBlue; end
	if sFrom == "DN" then curSelAlpha = DNbcAlpha; curSelRed = DNbcRed; curSelGreen = DNbcGreen; curSelBlue = DNbcBlue; end
	if sFrom == "RP" then curSelAlpha = RPbcAlpha; curSelRed = RPbcRed; curSelGreen = RPbcGreen; curSelBlue = RPbcBlue; end
	if sFrom == "LP" then curSelAlpha = BC.Alpha["LOTROPoints"]; curSelRed = BC.Red["LOTROPoints"]; curSelGreen = BC.Green["LOTROPoints"]; curSelBlue = BC.Blue["LOTROPoints"]; end
	if sFrom == "PL" then curSelAlpha = PLbcAlpha; curSelRed = PLbcRed; curSelGreen = PLbcGreen; curSelBlue = PLbcBlue; end
	if sFrom == "GT" then curSelAlpha = GTbcAlpha; curSelRed = GTbcRed; curSelGreen = GTbcGreen; curSelBlue = GTbcBlue; end
	if sFrom == "ASP" then curSelAlpha =BC.Alpha["AmrothSilverPiece"]; curSelRed = BC.Red["AmrothSilverPiece"]; curSelGreen = BC.Green["AmrothSilverPiece"]; curSelBlue = BC.Blue["AmrothSilverPiece"]; end
	if sFrom == "SOM" then curSelAlpha =BC.Alpha["StarsofMerit"]; curSelRed = BC.Red["StarsofMerit"]; curSelGreen = BC.Green["StarsofMerit"]; curSelBlue = BC.Blue["StarsofMerit"]; end
	if sFrom == "CGSP" then curSelAlpha = BC.Alpha["CentralGondorSilverPiece"]; curSelRed = BC.Red["CentralGondorSilverPiece"]; curSelGreen = BC.Green["CentralGondorSilverPiece"]; curSelBlue = BC.Blue["CentralGondorSilverPiece"]; end
	if sFrom == "GGB" then curSelAlpha = BC.Alpha["GiftgiversBrand"]; curSelRed = BC.Red["GiftgiversBrand"]; curSelGreen = BC.Green["GiftgiversBrand"]; curSelBlue = BC.Blue["GiftgiversBrand"]; end
	if sFrom == "BB" then curSelAlpha = BC.Alpha["BingoBadge"]; curSelRed = BC.Red["BingoBadge"]; curSelGreen = BC.Green["BingoBadge"]; curSelBlue = BC.Blue["BingoBadge"]; end
	if sFrom == "LAT" then curSelAlpha = BC.Alpha["AnniversaryToken"]; curSelRed = BC.Red["AnniversaryToken"]; curSelGreen = BC.Green["AnniversaryToken"]; curSelBlue = BC.Blue["AnniversaryToken"]; end
	if sFrom == "MOE" then curSelAlpha = BC.Alpha["MotesOfEnchantment"]; curSelRed = BC.Red["MotesOfEnchantment"]; curSelGreen = BC.Green["MotesOfEnchantment"]; curSelBlue = BC.Blue["MotesOfEnchantment"]; end
	if sFrom == "EOE" then curSelAlpha = BC.Alpha["EmbersOfEnchantment"]; curSelRed = BC.Red["EmbersOfEnchantment"]; curSelGreen = BC.Green["EmbersOfEnchantment"]; curSelBlue = BC.Blue["EmbersOfEnchantment"]; end
	if sFrom == "FOS" then curSelAlpha = BC.Alpha["FigmentsOfSplendour"]; curSelRed = BC.Red["FigmentsOfSplendour"]; curSelGreen = BC.Green["FigmentsOfSplendour"]; curSelBlue = BC.Blue["FigmentsOfSplendour"]; end
	if sFrom == "FFT" then curSelAlpha = BC.Alpha["FallFestivalToken"]; curSelRed = BC.Red["FallFestivalToken"]; curSelGreen = BC.Green["FallFestivalToken"]; curSelBlue = BC.Blue["FallFestivalToken"]; end
	if sFrom == "FFAT" then curSelAlpha = BC.Alpha["FarmersFaireToken"]; curSelRed = BC.Red["FarmersFaireToken"]; curSelGreen = BC.Green["FarmersFaireToken"]; curSelBlue = BC.Blue["FarmersFaireToken"]; end
	if sFrom == "SPL" then curSelAlpha = BC.Alpha["SpringLeaf"]; curSelRed = BC.Red["SpringLeaf"]; curSelGreen = BC.Green["SpringLeaf"]; curSelBlue = BC.Blue["SpringLeaf"]; end
	if sFrom == "MST" then curSelAlpha = BC.Alpha["MidsummerToken"]; curSelRed = BC.Red["MidsummerToken"]; curSelGreen = BC.Green["MidsummerToken"]; curSelBlue = BC.Blue["MidsummerToken"]; end
	if sFrom == "AS" then curSelAlpha = BC.Alpha["AncientScript"]; curSelRed = BC.Red["AncientScript"]; curSelGreen = BC.Green["AncientScript"]; curSelBlue = BC.Blue["AncientScript"]; end
	if sFrom == "BOT" then curSelAlpha = BC.Alpha["BadgeOfTaste"]; curSelRed = BC.Red["BadgeOfTaste"]; curSelGreen = BC.Green["BadgeOfTaste"]; curSelBlue = BC.Blue["BadgeOfTaste"]; end
	if sFrom == "BOD" then curSelAlpha = BC.Alpha["BadgeOfDishonour"]; curSelRed = BC.Red["BadgeOfDishonour"]; curSelGreen = BC.Green["BadgeOfDishonour"]; curSelBlue = BC.Blue["BadgeOfDishonour"]; end
	curAlpha, curColor.R, curColor.G, curColor.B = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
	curSelColor:SetBackColor( Turbine.UI.Color( curSelAlpha, curSelRed, curSelGreen, curSelBlue ) );
	-- **^
	-- **v Save button v**
	local buttonSave = Turbine.UI.Lotro.Button();
	buttonSave:SetParent( wBackground );
	buttonSave:SetText( L["BWSave"] );
	buttonSave:SetSize( buttonSave:GetTextLength() * 10, 15 ); --Auto size with text length
	buttonSave:SetPosition( wBackground:GetWidth() - buttonSave:GetWidth() - 15 , wBackground:GetHeight() - 34 );
	buttonSave:SetVisible( true );

	buttonSave.Click = function( sender, args )
		BGWToAll = SetToAllCtr:IsChecked();
		
		UpdateBCvariable();
		
		ChangeColor(curSelColor:GetBackColor());
		SaveSettings( true );
	end
	-- **^
	-- Create alpha label and slider.
	local alphalabel = Turbine.UI.Label();
	alphalabel:SetParent( wBackground );
	alphalabel:SetText( L["BWAlpha"] .. " @ " .. ( curSelAlpha * 100 ) .. "%" );
	alphalabel:SetPosition( 40, 40 );
	alphalabel:SetSize( 242, 10 );
	alphalabel:SetBackColor( Color["black"] );
	alphalabel:SetTextAlignment( Turbine.UI.ContentAlignment.TopCenter );
	
	local alphaScrollBar = Turbine.UI.Lotro.ScrollBar();
	alphaScrollBar:SetParent( alphalabel );
	alphaScrollBar:SetPosition( 0, 0 );
	alphaScrollBar:SetSize( 242, 10 );
	alphaScrollBar:SetMinimum( 0 );
	alphaScrollBar:SetMaximum( 100 );
	alphaScrollBar:SetValue( curSelAlpha * 100);
	
	alphaScrollBar.ValueChanged = function(sender, args)
		curAlpha = alphaScrollBar:GetValue() / 100;
		alphalabel:SetText( L["BWAlpha"] .. " @ " .. ( curAlpha * 100 ) .. "%" );
		BGWToAll = SetToAllCtr:IsChecked();
		if bClick then ChangeColor(Turbine.UI.Color( curAlpha, curSelRed, curSelGreen, curSelBlue ));
		else ChangeColor(Turbine.UI.Color( curAlpha, curColor.R, curColor.G, curColor.B )); end
		curSelColor:SetBackColor( Turbine.UI.Color( curAlpha, curSelRed, curSelGreen, curSelBlue ) )
	end
	-- **^
	-- **v Default button v**
	local buttonDefault = Turbine.UI.Lotro.Button();
	buttonDefault:SetParent( wBackground );
	buttonDefault:SetPosition( 23, wBackground:GetHeight() - 34 );
	buttonDefault:SetText( L["BWDef"] );
	buttonDefault:SetSize( buttonDefault:GetTextLength() * 10, 15 ); --Auto size with text length
	buttonDefault:SetVisible( true );

	buttonDefault.Click = function(sender, args)
		BGWToAll = SetToAllCtr:IsChecked();
		alphaScrollBar:SetValue( 30 );
		curSelAlpha = ( 0.3 );
		curSelRed = ( 0.3 );
		curSelGreen = ( 0.3 );
		curSelBlue = ( 0.3 );
		curSelColor:SetBackColor( Turbine.UI.Color( curSelAlpha, curSelRed, curSelGreen, curSelBlue ) );
		ChangeColor(curSelColor:GetBackColor());
		bClick = true;
	end
	-- **^
	-- **v Black button v**
	local buttonBlack = Turbine.UI.Lotro.Button();
	buttonBlack:SetParent( wBackground );
	buttonBlack:SetPosition( buttonDefault:GetLeft() + buttonDefault:GetWidth() + 5, wBackground:GetHeight() - 34 );
	buttonBlack:SetText( L["BWBlack"] );
	buttonBlack:SetSize( buttonBlack:GetTextLength() * 10, 15 ); --Auto size with text length
	buttonBlack:SetVisible( true );

	buttonBlack.Click = function(sender, args)
		BGWToAll = SetToAllCtr:IsChecked();
		alphaScrollBar:SetValue ( 100 );
		curSelAlpha = ( 1 );
		curSelRed = ( 0 );
		curSelGreen = ( 0 );
		curSelBlue = ( 0 );
		curSelColor:SetBackColor( Turbine.UI.Color( curSelAlpha, curSelRed, curSelGreen, curSelBlue ) );
		ChangeColor(curSelColor:GetBackColor());
		bClick = true;
	end
	-- **^
	-- **v Transparent button v**
	local buttonTrans = Turbine.UI.Lotro.Button();
	buttonTrans:SetParent( wBackground );
	buttonTrans:SetPosition( buttonBlack:GetLeft() + buttonBlack:GetWidth() + 5, wBackground:GetHeight() - 34 );
	buttonTrans:SetText( L["BWTrans"] );
	buttonTrans:SetSize( buttonTrans:GetTextLength() * 10, 15 ); --Auto size with text length
	buttonTrans:SetVisible( true );

	buttonTrans.Click = function(sender, args)
		BGWToAll = SetToAllCtr:IsChecked();
		alphaScrollBar:SetValue ( 0 );
		curSelAlpha = ( 0 );
		curSelRed = ( 0 );
		curSelGreen = ( 0 );
		curSelBlue = ( 0 );
		curSelColor:SetBackColor( Turbine.UI.Color( curSelAlpha, curSelRed, curSelGreen, curSelBlue ) );
		ChangeColor(curSelColor:GetBackColor());
		bClick = true;
	end
	-- **^
	-- Create Colour Picker window/border.
	ColourPickerBorder = Turbine.UI.Label();
	ColourPickerBorder:SetParent( wBackground );
	ColourPickerBorder:SetPosition( 40, 60 );
	ColourPickerBorder:SetSize( 242, 73 );
	ColourPickerBorder:SetBackColor( Turbine.UI.Color( 1, .2, .2, .2  ) );
	ColourPickerBorder:SetVisible( true );
	
	-- Create Colour Picker.
	ColourPicker = Turbine.UI.Label();
	ColourPicker:SetParent( ColourPickerBorder );
	ColourPicker:SetPosition( 1, 1 );
	ColourPicker:SetSize( 240, 71 );
	ColourPicker:SetBackground( resources.Picker ); -- 0x41007e13 / resources.Picker.Background

	ColourPicker.GetColorFromCoord = function( sender, X, Y )
		-- Controls the visibility of the cursor window
		local blockXvalue = (round(ColourPicker:GetWidth()/3));
		local blockYvalue = (round(ColourPicker:GetHeight()/2));

		curColor = Turbine.UI.Color();
		--curColor.A = 1.0;
		local myX = X;
		local myY = Y;
		local curRed = 0;
		local curGreen = 0;
		local curBlue = 0;

		if (myX >= 0) and (myX < blockXvalue) then

			-- First color block = red to green
			curRed = 100-((100/blockXvalue)*myX);
			curGreen = (100/blockXvalue)*myX;
			curBlue = 0;

		elseif (myX >= blockXvalue) and (myX < (2*blockXvalue)) then

			-- Second color block = green to blue
			curRed = 0;
			curGreen = 100-((100/blockXvalue)*(myX - blockXvalue));
			curBlue = (100/blockXvalue)*(myX - blockXvalue);

		elseif (myX >= (2*blockXvalue)) then

			-- Third color block = blue to red
			curRed = (100/blockXvalue)*(myX - 2*blockXvalue);
			curGreen = 0;
			curBlue = 100-((100/blockXvalue)*(myX - 2*blockXvalue));

		end

		if myY <= blockYvalue then

			-- In the top block, so fade from black to full color
			curRed = curRed * (myY/blockYvalue);
			curGreen = curGreen * (myY/blockYvalue);
			curBlue = curBlue * (myY/blockYvalue);

		else

			-- In the bottom block, so fade from full color to white
			curRed = curRed + ((myY - blockYvalue) * ((100 - curRed)/(blockYvalue)));
			curGreen = curGreen + ((myY - blockYvalue) * ((100 - curGreen)/(blockYvalue)));
			curBlue = curBlue + ((myY - blockYvalue) * ((100 - curBlue)/(blockYvalue)));

		end

		curColor.A = curAlpha;
		curColor.R = (1/100) * curRed;
		curColor.G = (1/100) * curGreen;
		curColor.B = (1/100) * curBlue;

		return curColor;
	end

	ColourPicker.MouseMove = function( sender, args )
		mColor = ColourPicker:GetColorFromCoord( args.X, args.Y );
		BGWToAll = SetToAllCtr:IsChecked();
		ChangeColor(mColor);
	end
	
	ColourPicker.MouseClick = function( sender, args )
		curSelRed = curColor.R;
		curSelGreen = curColor.G;
		curSelBlue = curColor.B;
		curSelColor:SetBackColor( mColor );
		bClick = true;
	end
	
	wBackground.KeyDown = function( sender, args )
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			wBackground:Close();
		elseif ( args.Action == 268435635 ) or ( args.Action == 268435579 ) then -- Hide if F12 key is press or reposition UI
			wBackground:SetVisible( not wBackground:IsVisible() );
		end
	end

	wBackground.MouseUp = function( sender, args )
		settings.Background.L = string.format("%.0f", wBackground:GetLeft());
		settings.Background.T = string.format("%.0f", wBackground:GetTop());
		BGWLeft, BGWTop = wBackground:GetPosition();
		SaveSettings( false );
	end

	wBackground.Closing = function( sender, args )
		wBackground:SetWantsKeyEvents( false );
		TB["win"].MouseLeave();
		BGWToAll = SetToAllCtr:IsChecked();

		UpdateBCvariable();
		
		ChangeColor(curSelColor:GetBackColor());
		wBackground = nil;
		option_backcolor:SetEnabled( true );
	end
end

function UpdateBCvariable()
	curSelAlpha = curAlpha;
	if BGWToAll then
		bcAlpha, bcRed, bcGreen, bcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["Wallet"], BC.Red["Wallet"], BC.Green["Wallet"], BC.Blue["Wallet"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["Money"], BC.Red["Money"], BC.Green["Money"], BC.Blue["Money"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["DestinyPoints"], BC.Red["DestinyPoints"], BC.Green["DestinyPoints"], BC.Blue["DestinyPoints"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["Shards"], BC.Red["Shards"], BC.Green["Shards"], BC.Blue["Shards"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["SkirmishMarks"], BC.Red["SkirmishMarks"], BC.Green["SkirmishMarks"], BC.Blue["SkirmishMarks"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["MithrilCoins"], BC.Red["MithrilCoins"], BC.Green["MithrilCoins"], BC.Blue["MithrilCoins"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["HytboldTokens"], BC.Red["HytboldTokens"], BC.Green["HytboldTokens"], BC.Blue["HytboldTokens"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["Medallions"], BC.Red["Medallions"], BC.Green["Medallions"], BC.Blue["Medallions"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["Seals"], BC.Red["Seals"], BC.Green["Seals"], BC.Blue["Seals"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["Commendations"], BC.Red["Commendations"], BC.Green["Commendations"], BC.Blue["Commendations"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BIbcAlpha, BIbcRed, BIbcGreen, BIbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		PIbcAlpha, PIbcRed, PIbcGreen, PIbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		EIbcAlpha, EIbcRed, EIbcGreen, EIbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		DIbcAlpha, DIbcRed, DIbcGreen, DIbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		TIbcAlpha, TIbcRed, TIbcGreen, TIbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		IFbcAlpha, IFbcRed, IFbcGreen, IFbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		VTbcAlpha, VTbcRed, VTbcGreen, VTbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		SSbcAlpha, SSbcRed, SSbcGreen, SSbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BKbcAlpha, BKbcRed, BKbcGreen, BKbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		DNbcAlpha, DNbcRed, DNbcGreen, DNbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		RPbcAlpha, RPbcRed, RPbcGreen, RPbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["LOTROPoints"], BC.Red["LOTROPoints"], BC.Green["LOTROPoints"], BC.Blue["LOTROPoints"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["YuleToken"], BC.Red["YuleToken"], BC.Green["YuleToken"], BC.Blue["YuleToken"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["AmrothSilverPiece"], BC.Red["AmrothSilverPiece"], BC.Green["AmrothSilverPiece"], BC.Blue["AmrothSilverPiece"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["StarsofMerit"], BC.Red["StarsofMerit"], BC.Green["StarsofMerit"], BC.Blue["StarsofMerit"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["CentralGondorSilverPiece"], BC.Red["CentralGondorSilverPiece"], BC.Green["CentralGondorSilverPiece"], BC.Blue["CentralGondorSilverPiece"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["GiftgiversBrand"], BC.Red["GiftgiversBrand"], BC.Green["GiftgiversBrand"], BC.Blue["GiftgiversBrand"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["BingoBadge"], BC.Red["BingoBadge"], BC.Green["BingoBadge"], BC.Blue["BingoBadge"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["AnniversaryToken"], BC.Red["AnniversaryToken"], BC.Green["AnniversaryToken"], BC.Blue["AnniversaryToken"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["MotesOfEnchantment"], BC.Red["MotesOfEnchantment"], BC.Green["MotesOfEnchantment"], BC.Blue["MotesOfEnchantment"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["EmbersOfEnchantment"], BC.Red["EmbersOfEnchantment"], BC.Green["EmbersOfEnchantment"], BC.Blue["EmbersOfEnchantment"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["FigmentsOfSplendour"], BC.Red["FigmentsOfSplendour"], BC.Green["FigmentsOfSplendour"], BC.Blue["FigmentsOfSplendour"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["FallFestivalToken"], BC.Red["FallFestivalToken"], BC.Green["FallFestivalToken"], BC.Blue["FallFestivalToken"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["FarmersFaireToken"], BC.Red["FarmersFaireToken"], BC.Green["FarmersFaireToken"], BC.Blue["FarmersFaireToken"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["SpringLeaf"], BC.Red["SpringLeaf"], BC.Green["SpringLeaf"], BC.Blue["SpringLeaf"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["MidsummerToken"], BC.Red["MidsummerToken"], BC.Green["MidsummerToken"], BC.Blue["MidsummerToken"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["AncientScript"], BC.Red["AncientScript"], BC.Green["AncientScript"], BC.Blue["AncientScript"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["BadgeOfTaste"], BC.Red["BadgeOfTaste"], BC.Green["BadgeOfTaste"], BC.Blue["BadgeOfTaste"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		BC.Alpha["BadgeOfDishonour"], BC.Red["BadgeOfDishonour"], BC.Green["BadgeOfDishonour"], BC.Blue["BadgeOfDishonour"] = curSelAlpha, curSelRed, curSelGreen, curSelBlue;

	else
		if sFrom == "TitanBar" then bcAlpha = curSelAlpha; bcRed = curSelRed; bcGreen = curSelGreen; bcBlue = curSelBlue; end
		if sFrom == "WI" then BC.Alpha["Wallet"] = curSelAlpha; BC.Red["Wallet"] = curSelRed; BC.Green["Wallet"] = curSelGreen; BC.Blue["Wallet"] = curSelBlue; end
		if sFrom == "Money" then BC.Alpha["Money"] = curSelAlpha; BC.Red["Money"] = curSelRed; BC.Green["Money"] = curSelGreen; BC.Blue["Money"] = curSelBlue; end
		if sFrom == "DP" then BC.Alpha["DestinyPoints"] = curSelAlpha; BC.Red["DestinyPoints"] = curSelRed; BC.Green["DestinyPoints"] = curSelGreen; BC.Blue["DestinyPoints"] = curSelBlue; end
		if sFrom == "SP" then BC.Alpha["Shards"] = curSelAlpha; BC.Red["Shards"] = curSelRed; BC.Green["Shards"] = curSelGreen; BC.Blue["Shards"] = curSelBlue; end
		if sFrom == "SM" then BC.Alpha["SkirmishMarks"] = curSelAlpha; BC.Red["SkirmishMarks"] = curSelRed; BC.Green["SkirmishMarks"] = curSelGreen; BC.Blue["SkirmishMarks"] = curSelBlue; end
		if sFrom == "MC" then BC.Alpha["MithrilCoins"] = curSelAlpha; BC.Red["MithrilCoins"] = curSelRed; BC.Green["MithrilCoins"] = curSelGreen; BC.Blue["MithrilCoins"] = curSelBlue; end
		if sFrom == "YT" then BC.Alpha["YuleToken"] = curSelAlpha; BC.Red["YuleToken"] = curSelRed; BC.Green["YuleToken"] = curSelGreen; BC.Blue["YuleToken"] = curSelBlue; end
		if sFrom == "HT" then BC.Alpha["HytboldTokens"] = curSelAlpha; BC.Red["HytboldTokens"] = curSelRed; BC.Green["HytboldTokens"] = curSelGreen; BC.Blue["HytboldTokens"] = curSelBlue; end
		if sFrom == "MP" then BC.Alpha["Medallions"] = curSelAlpha; BC.Red["Medallions"] = curSelRed; BC.Green["Medallions"] = curSelGreen; BC.Blue["Medallions"] = curSelBlue; end
		if sFrom == "SL" then BC.Alpha["Seals"] = curSelAlpha; BC.Red["Seals"] = curSelRed; BC.Green["Seals"] = curSelGreen; BC.Blue["Seals"] = curSelBlue; end
		if sFrom == "CP" then BC.Alpha["Commendations"] = curSelAlpha; BC.Red["Commendations"] = curSelRed; BC.Green["Commendations"] = curSelGreen; BC.Blue["Commendations"] = curSelBlue; end
		if sFrom == "BI" then BIbcAlpha = curSelAlpha; BIbcRed = curSelRed; BIbcGreen = curSelGreen; BIbcBlue = curSelBlue; end
		if sFrom == "PI" then PIbcAlpha = curSelAlpha; PIbcRed = curSelRed; PIbcGreen = curSelGreen; PIbcBlue = curSelBlue; end
		if sFrom == "EI" then EIbcAlpha = curSelAlpha; EIbcRed = curSelRed; EIbcGreen = curSelGreen; EIbcBlue = curSelBlue; end
		if sFrom == "DI" then DIbcAlpha = curSelAlpha; DIbcRed = curSelRed; DIbcGreen = curSelGreen; DIbcBlue = curSelBlue; end
		if sFrom == "TI" then TIbcAlpha = curSelAlpha; TIbcRed = curSelRed; TIbcGreen = curSelGreen; TIbcBlue = curSelBlue; end
		if sFrom == "IF" then IFbcAlpha = curSelAlpha; IFbcRed = curSelRed; IFbcGreen = curSelGreen; IFbcBlue = curSelBlue; end
		if sFrom == "VT" then VTbcAlpha = curSelAlpha; VTbcRed = curSelRed; VTbcGreen = curSelGreen; VTbcBlue = curSelBlue; end
		if sFrom == "SS" then SSbcAlpha = curSelAlpha; SSbcRed = curSelRed; SSbcGreen = curSelGreen; SSbcBlue = curSelBlue; end
		if sFrom == "BK" then BKbcAlpha = curSelAlpha; BKbcRed = curSelRed; BKbcGreen = curSelGreen; BKbcBlue = curSelBlue; end
		if sFrom == "DN" then DNbcAlpha = curSelAlpha; DNbcRed = curSelRed; DNbcGreen = curSelGreen; DNbcBlue = curSelBlue; end
		if sFrom == "RP" then RPbcAlpha = curSelAlpha; RPbcRed = curSelRed; RPbcGreen = curSelGreen; RPbcBlue = curSelBlue; end
		if sFrom == "LP" then BC.Alpha["LOTROPoints"] = curSelAlpha; BC.Red["LOTROPoints"] = curSelRed; BC.Green["LOTROPoints"] = curSelGreen; BC.Blue["LOTROPoints"] = curSelBlue; end
		if sFrom == "PL" then PLbcAlpha = curSelAlpha; PLbcRed = curSelRed; PLbcGreen = curSelGreen; PLbcBlue = curSelBlue; end
		if sFrom == "GT" then GTbcAlpha = curSelAlpha; GTbcRed = curSelRed; GTbcGreen = curSelGreen; GTbcBlue = curSelBlue; end
		if sFrom == "ASP" then BC.Alpha["AmrothSilverPiece"] = curSelAlpha; BC.Red["AmrothSilverPiece"] = curSelRed; BC.Green["AmrothSilverPiece"] = curSelGreen; BC.Blue["AmrothSilverPiece"] = curSelBlue; end
		if sFrom == "SOM" then BC.Alpha["StarsofMerit"] = curSelAlpha; BC.Red["StarsofMerit"] = curSelRed; BC.Green["StarsofMerit"] = curSelGreen; BC.Blue["StarsofMerit"] = curSelBlue; end
		if sFrom == "CGSP" then BC.Alpha["CentralGondorSilverPiece"] = curSelAlpha; BC.Red["CentralGondorSilverPiece"] = curSelRed; BC.Green["CentralGondorSilverPiece"] = curSelGreen; BC.Blue["CentralGondorSilverPiece"] = curSelBlue; end
		if sFrom == "GGB" then BC.Alpha["GiftgiversBrand"] = curSelAlpha; BC.Red["GiftgiversBrand"] = curSelRed; BC.Green["GiftgiversBrand"] = curSelGreen; BC.Blue["GiftgiversBrand"] = curSelBlue; end
		if sFrom == "BB" then BC.Alpha["BingoBadge"] = curSelAlpha; BC.Red["BingoBadge"] = curSelRed; BC.Green["BingoBadge"] = curSelGreen; BC.Blue["BingoBadge"] = curSelBlue; end
		if sFrom == "LAT" then BC.Alpha["AnniversaryToken"] = curSelAlpha; BC.Red["AnniversaryToken"] = curSelRed; BC.Green["AnniversaryToken"] = curSelGreen; BC.Blue["AnniversaryToken"] = curSelBlue; end
		if sFrom == "MOE" then BC.Alpha["MotesOfEnchantment"] = curSelAlpha; BC.Red["MotesOfEnchantment"] = curSelRed; BC.Green["MotesOfEnchantment"] = curSelGreen; BC.Blue["MotesOfEnchantment"] = curSelBlue; end
		if sFrom == "EOE" then BC.Alpha["EmbersOfEnchantment"] = curSelAlpha; BC.Red["EmbersOfEnchantment"] = curSelRed; BC.Green["EmbersOfEnchantment"] = curSelGreen; BC.Blue["EmbersOfEnchantment"] = curSelBlue; end
		if sFrom == "FOS" then BC.Alpha["FigmentsOfSplendour"] = curSelAlpha; BC.Red["FigmentsOfSplendour"] = curSelRed; BC.Green["FigmentsOfSplendour"] = curSelGreen; BC.Blue["FigmentsOfSplendour"] = curSelBlue; end
		if sFrom == "FFT" then BC.Alpha["FallFestivalToken"] = curSelAlpha; BC.Red["FallFestivalToken"] = curSelRed; BC.Green["FallFestivalToken"] = curSelGreen; BC.Blue["FallFestivalToken"] = curSelBlue; end
		if sFrom == "FFAT" then BC.Alpha["FarmersFaireToken"] = curSelAlpha; BC.Red["FarmersFaireToken"] = curSelRed; BC.Green["FarmersFaireToken"] = curSelGreen; BC.Blue["FarmersFaireToken"] = curSelBlue; end
		if sFrom == "SPL" then BC.Alpha["SpringLeaf"] = curSelAlpha; BC.Red["SpringLeaf"] = curSelRed; BC.Green["SpringLeaf"] = curSelGreen; BC.Blue["SpringLeaf"] = curSelBlue; end
		if sFrom == "MST" then BC.Alpha["MidsummerToken"] = curSelAlpha; BC.Red["MidsummerToken"] = curSelRed; BC.Green["MidsummerToken"] = curSelGreen; BC.Blue["MidsummerToken"] = curSelBlue; end
		if sFrom == "AS" then BC.Alpha["AncientScript"] = curSelAlpha; BC.Red["AncientScript"] = curSelRed; BC.Green["AncientScript"] = curSelGreen; BC.Blue["AncientScript"] = curSelBlue; end
		if sFrom == "BOT" then BC.Alpha["BadgeOfTaste"] = curSelAlpha; BC.Red["BadgeOfTaste"] = curSelRed; BC.Green["BadgeOfTaste"] = curSelGreen; BC.Blue["BadgeOfTaste"] = curSelBlue; end
		if sFrom == "BOD" then BC.Alpha["BadgeOfDishonour"] = curSelAlpha; BC.Red["BadgeOfDishonour"] = curSelRed; BC.Green["BadgeOfDishonour"] = curSelGreen; BC.Blue["BadgeOfDishonour"] = curSelBlue; end
	end
end