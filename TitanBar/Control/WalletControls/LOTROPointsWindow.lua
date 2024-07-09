-- LOTROPointsWindow.lua
-- written by Habna


function frmLOTROPointsWindow()
	-- **v Set some window stuff v**
	_G.wLOTROPoints = Turbine.UI.Lotro.Window()
	_G.wLOTROPoints:SetPosition( PositionW.Left["LOTROPoints"], PositionW.Top["LOTROPoints"] );
	--_G.wLOTROPoints:SetSize( 300, 80 );
	_G.wLOTROPoints:SetText( L["LOTROPoints"] );
	_G.wLOTROPoints:SetWantsKeyEvents( true );
	_G.wLOTROPoints:SetVisible( true );
	--_G.wLOTROPoints:SetZOrder( 2 );
	_G.wLOTROPoints:Activate();

	_G.wLOTROPoints.KeyDown = function( sender, args )
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			_G.wLOTROPoints:Close();
		elseif ( args.Action == 268435635 ) or ( args.Action == 268435579 ) then -- Hide if F12 key is press or reposition UI
			_G.wLOTROPoints:SetVisible( not _G.wLOTROPoints:IsVisible() );
		elseif ( args.Action == 162 ) then --Enter key was pressed
			buttonSave.Click( sender, args );
		end
	end

	_G.wLOTROPoints.MouseUp = function( sender, args )
		settings.LOTROPoints.L = string.format("%.0f", _G.wLOTROPoints:GetLeft());
		settings.LOTROPoints.T = string.format("%.0f", _G.wLOTROPoints:GetTop());
		PositionW.Left["LOTROPoints"], PositionW.Top["LOTROPoints"] = _G.wLOTROPoints:GetPosition();
		SaveSettings( false );
	end

	_G.wLOTROPoints.Closing = function( sender, args ) -- Function for the Upper right X icon
		_G.wLOTROPoints:SetWantsKeyEvents( false );
		_G.wLOTROPoints = nil;
		_G.frmLOTROPoints = nil;
	end
	-- **^

	local LPWCtr = Turbine.UI.Control();
	LPWCtr:SetParent( _G.wLOTROPoints );
	LPWCtr:SetPosition( 15, 50 );
	LPWCtr:SetZOrder( 2 );
	--LPWCtr:SetBackColor( Color["red"] ); -- debug purpose

	local lblLOTROPTS = Turbine.UI.Label();
	lblLOTROPTS:SetParent( LPWCtr );
	--lblLOTROPTS:SetFont( Turbine.UI.Lotro.Font.TrajanPro14 );
	lblLOTROPTS:SetText( L["LOTROPoints"] );
	lblLOTROPTS:SetPosition( 0, 2 );
	lblLOTROPTS:SetSize( lblLOTROPTS:GetTextLength() * 7.5, 15 ); --Auto size with text lenght
	lblLOTROPTS:SetForeColor( Color["rustedgold"] );
	lblLOTROPTS:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft );
	--lblLOTROPTS:SetBackColor( Color["red"] ); -- debug purpose

	local txtLOTROPTS = Turbine.UI.Lotro.TextBox();
	txtLOTROPTS:SetParent( LPWCtr );
	txtLOTROPTS:SetFont( Turbine.UI.Lotro.Font.TrajanPro14 );
	txtLOTROPTS:SetText( _G.LOTROPTS );
	txtLOTROPTS:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft );
	txtLOTROPTS:SetPosition( lblLOTROPTS:GetLeft()+lblLOTROPTS:GetWidth()+5, lblLOTROPTS:GetTop()-2 );
	txtLOTROPTS:SetSize( 80, 20 );
	txtLOTROPTS:SetMultiline( false );
	if PlayerAlign == 2 then txtLOTROPTS:SetBackColor( Color["red"] ); end

	txtLOTROPTS.FocusGained = function( sender, args )
		txtLOTROPTS:SelectAll();
		txtLOTROPTS:SetWantsUpdates( true );
	end

	txtLOTROPTS.FocusLost = function( sender, args )
		txtLOTROPTS:SetWantsUpdates( false );
	end

	txtLOTROPTS.Update = function( sender, args )
		local parsed_text = txtLOTROPTS:GetText();

		if tonumber(parsed_text) == nil or string.find(parsed_text,"%.") ~= nil then
			txtLOTROPTS:SetText( string.sub( parsed_text, 1, string.len(parsed_text)-1 ) );
			return
		elseif string.len(parsed_text) > 1 and string.sub(parsed_text,1,1) == "0" then
			txtLOTROPTS:SetText( string.sub( parsed_text, 2 ) );
			return
		end
	end

	buttonSave = Turbine.UI.Lotro.Button();
	buttonSave:SetParent( LPWCtr );
	buttonSave:SetText( L["PWSave"] );
	buttonSave:SetSize( buttonSave:GetTextLength() * 10, 15 ); --Auto size with text lenght
	buttonSave:SetPosition( txtLOTROPTS:GetLeft()+txtLOTROPTS:GetWidth()+5, txtLOTROPTS:GetTop() );
	--buttonSave:SetEnabled( true );

	buttonSave.Click = function( sender, args )
		local parsed_text = txtLOTROPTS:GetText();

		if parsed_text == "" then
			txtLOTROPTS:SetText( "0" );
			txtLOTROPTS:Focus();
			return
		elseif parsed_text == _G.LOTROPTS then
			txtLOTROPTS:Focus();
			return
		end
			
		_G.LOTROPTS = txtLOTROPTS:GetText();
		UpdateLOTROPoints();
		SavePlayerLOTROPoints();
		txtLOTROPTS:Focus();
	end

	LPWCtr:SetSize( lblLOTROPTS:GetWidth()+txtLOTROPTS:GetWidth()+buttonSave:GetWidth()+10, 20 );
	_G.wLOTROPoints:SetSize( LPWCtr:GetWidth()+30, 80 );

	txtLOTROPTS:Focus();
end