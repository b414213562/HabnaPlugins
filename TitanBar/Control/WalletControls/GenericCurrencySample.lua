-- This is how currency controls used to be done - one file per control.
-- This is now handled in WalletControlFactory.lua.

local key = ""; -- e.g. AmrothSilverPiece
_G[key] = {};
local table = _G[key];
local labelAlignment = Turbine.UI.ContentAlignment.MiddleRight;
local iconWidth = 32; -- in-game icon 32x32
local iconHeight = 32;

--**v Control for this currency v**
table["Ctr"] = Turbine.UI.Control();
table["Ctr"]:SetParent( TB["win"] );
table["Ctr"]:SetMouseVisible( false );
table["Ctr"]:SetZOrder( 2 );
table["Ctr"]:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
table["Ctr"]:SetBackColor( Turbine.UI.Color( BC.Alpha[key], BC.Red[key], BC.Green[key], BC.Blue[key] ) );
--**^
--**v Currency icon on TitanBar v**
table["Icon"] = Turbine.UI.Control();
table["Icon"]:SetParent( table["Ctr"] );
table["Icon"]:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
table["Icon"]:SetSize( iconWidth, iconHeight );
table["Icon"]:SetBackground( key );
--**^

table["Icon"].MouseMove = function( sender, args )
	table["Lbl"].MouseLeave( sender, args );
	TB["win"].MouseMove();
	if dragging then table["MoveCtr"](sender, args); end
end

table["Icon"].MouseLeave = function( sender, args )
	table["Lbl"].MouseLeave( sender, args );
end

table["Icon"].MouseClick = function( sender, args )
	table["Lbl"].MouseClick( sender, args );
end

table["Icon"].MouseDown = function( sender, args )
	table["Lbl"].MouseDown( sender, args );
end

table["Icon"].MouseUp = function( sender, args )
	table["Lbl"].MouseUp( sender, args );
end


table["Lbl"] = Turbine.UI.Label();
table["Lbl"]:SetParent( table["Ctr"] );
table["Lbl"]:SetFont( _G.TBFont );
table["Lbl"]:SetPosition( 0, 0 );
table["Lbl"]:SetFontStyle( Turbine.UI.FontStyle.Outline );
table["Lbl"]:SetTextAlignment( labelAlignment );

table["Lbl"].MouseMove = function( sender, args )
	table["Lbl"].MouseLeave( sender, args );
	TB["win"].MouseMove();
	if dragging then
		table["MoveCtr"](sender, args);
	else
		ShowToolTipWin( key );
	end
end

table["Lbl"].MouseLeave = function( sender, args )
	ResetToolTipWin();
end

table["Lbl"].MouseClick = function( sender, args )
	TB["win"].MouseMove();
	if ( args.Button == Turbine.UI.MouseButton.Left ) then
		if not WasDrag then
			
		end
	elseif ( args.Button == Turbine.UI.MouseButton.Right ) then
		_G.sFromCtr = key;
		ControlMenu:ShowMenu();
	end
	WasDrag = false;
end

table["Lbl"].MouseDown = function( sender, args )
	if ( args.Button == Turbine.UI.MouseButton.Left ) then
		table["Ctr"]:SetZOrder( 3 );
		dragStartX = args.X;
		dragStartY = args.Y;
		dragging = true;
	end
end

table["Lbl"].MouseUp = function( sender, args )
	table["Ctr"]:SetZOrder( 2 );
	dragging = false;
	Position.Left[key] = table["Ctr"]:GetLeft();
	settings[key].X = string.format("%.0f", Position.Left[key]);
	Position.Top[key] = table["Ctr"]:GetTop();
	settings[key].Y = string.format("%.0f", Position.Top[key]);
	SaveSettings( false );
end
--**^

table["MoveCtr"] = function (sender, args)
	local CtrLocX = table["Ctr"]:GetLeft();
	local CtrWidth = table["Ctr"]:GetWidth();
	CtrLocX = CtrLocX + ( args.X - dragStartX );
	if CtrLocX < 0 then CtrLocX = 0; elseif CtrLocX + CtrWidth > screenWidth then CtrLocX = screenWidth - CtrWidth; end
	
	local CtrLocY = table["Ctr"]:GetTop();
	local CtrHeight = table["Ctr"]:GetHeight();
	CtrLocY = CtrLocY + ( args.Y - dragStartY );
	if CtrLocY < 0 then CtrLocY = 0; elseif CtrLocY + CtrHeight > TB["win"]:GetHeight() then CtrLocY = TB["win"]:GetHeight() - CtrHeight; end

	table["Ctr"]:SetPosition( CtrLocX, CtrLocY );
	WasDrag = true;
end