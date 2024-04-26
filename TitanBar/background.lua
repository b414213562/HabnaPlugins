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
    local currencyKey = CurrencyCodeToKey[sFrom];
    if (currencyKey) then
        curSelAlpha = BC.Alpha[currencyKey];
        curSelRed = BC.Red[currencyKey];
        curSelGreen = BC.Green[currencyKey];
        curSelBlue = BC.Blue[currencyKey];
    else
        if sFrom == "TitanBar" then curSelAlpha = bcAlpha; curSelRed = bcRed; curSelGreen = bcGreen; curSelBlue = bcBlue; end
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
        if sFrom == "PL" then curSelAlpha = PLbcAlpha; curSelRed = PLbcRed; curSelGreen = PLbcGreen; curSelBlue = PLbcBlue; end
        if sFrom == "GT" then curSelAlpha = GTbcAlpha; curSelRed = GTbcRed; curSelGreen = GTbcGreen; curSelBlue = GTbcBlue; end
    end

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

        for key, value in ipairs(Currencies) do
            BC.Alpha[value] = curSelAlpha;
            BC.Red[value] = curSelRed;
            BC.Green[value] = curSelGreen;
            BC.Blue[value] = curSelBlue;
        end

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
		PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;
		GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue = curSelAlpha, curSelRed, curSelGreen, curSelBlue;

	else
        local currencyKey = CurrencyCodeToKey[sFrom];
        if (currencyKey) then
            BC.Alpha[currencyKey] = curSelAlpha;
            BC.Red[currencyKey] = curSelRed;
            BC.Green[currencyKey] = curSelGreen;
            BC.Blue[currencyKey] = curSelBlue;
        else
            if sFrom == "TitanBar" then bcAlpha = curSelAlpha; bcRed = curSelRed; bcGreen = curSelGreen; bcBlue = curSelBlue; end
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
            if sFrom == "PL" then PLbcAlpha = curSelAlpha; PLbcRed = curSelRed; PLbcGreen = curSelGreen; PLbcBlue = curSelBlue; end
            if sFrom == "GT" then GTbcAlpha = curSelAlpha; GTbcRed = curSelRed; GTbcGreen = curSelGreen; GTbcBlue = curSelBlue; end
        end
	end
end