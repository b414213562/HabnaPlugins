-- Money.lua
-- Written by Habna

local key = "Money";
_G[key] = {}; -- Money Infos table in _G
local table = _G[key];

--**v Control of Gold/Silver/Copper currencies v**
table["Ctr"] = Turbine.UI.Control();
table["Ctr"]:SetParent( TB["win"] );
table["Ctr"]:SetMouseVisible( false );
table["Ctr"]:SetZOrder( 2 );
table["Ctr"]:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
table["Ctr"]:SetBackColor( Turbine.UI.Color( BC.Alpha["Money"], BC.Red["Money"], BC.Green["Money"], BC.Blue["Money"] ) );
--table["Ctr"]:SetBackColor( Color["red"] ); -- Debug purpose
--**^
--**v Control of Gold currencies v**
table["GCtr"] = Turbine.UI.Control();
table["GCtr"]:SetParent( table["Ctr"] );
table["GCtr"]:SetMouseVisible( false );
--table["GCtr"]:SetZOrder( 2 );
--table["GCtr"]:SetBackColor( Color["blue"] ); -- Debug purpose
--**^
--**v Gold & total amount on TitanBar v**
table["GLblT"] = Turbine.UI.Label();
table["GLblT"]:SetParent( table["GCtr"] );
table["GLblT"]:SetPosition( 0, 0 );
table["GLblT"]:SetFont( _G.TBFont );
--table["GLblT"]:SetForeColor( Color["white"] );
table["GLblT"]:SetFontStyle( Turbine.UI.FontStyle.Outline );
table["GLblT"]:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleRight );
--table["GLblT"]:SetBackColor( Color["white"] ); -- Debug purpose

table["GLblT"].MouseMove = function( sender, args )
	table["CLbl"].MouseMove( sender, args );
end

table["GLblT"].MouseLeave = function( sender, args )
	table["CLbl"].MouseLeave( sender, args );
end

table["GLblT"].MouseClick = function( sender, args )
	table["CLbl"].MouseClick( sender, args );
end

table["GLblT"].MouseDown = function( sender, args )
	table["CLbl"].MouseDown( sender, args );
end

table["GLblT"].MouseUp = function( sender, args )
	table["CLbl"].MouseUp( sender, args );
end
--**^
--**v Gold amount & icon on TitanBar v**
table["GLbl"] = Turbine.UI.Label();
table["GLbl"]:SetParent( table["GCtr"] );
table["GLbl"]:SetPosition( 0, 0 );
table["GLbl"]:SetFont( _G.TBFont );
--table["GLbl"]:SetForeColor( Color["white"] );
table["GLbl"]:SetFontStyle( Turbine.UI.FontStyle.Outline );
table["GLbl"]:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleRight );
--table["GLbl"]:SetBackColor( Color["white"] ); -- Debug purpose

table["GLbl"].MouseMove = function( sender, args )
	table["CLbl"].MouseMove( sender, args );
end

table["GLbl"].MouseLeave = function( sender, args )
	table["CLbl"].MouseLeave( sender, args );
end

table["GLbl"].MouseClick = function( sender, args )
	table["CLbl"].MouseClick( sender, args );
end

table["GLbl"].MouseDown = function( sender, args )
	table["CLbl"].MouseDown( sender, args );
end

table["GLbl"].MouseUp = function( sender, args )
	table["CLbl"].MouseUp( sender, args );
end


table["GIcon"] = Turbine.UI.Control();
table["GIcon"]:SetParent( table["GCtr"] );
--table["GIcon"]:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
table["GIcon"]:SetSize( 27, 21 );
table["GIcon"]:SetBackground( resources.MoneyIcon.Gold );-- in-game icon 27x21 (3 coins: 0x41004641 / 1 coin: 0x41007e7b) ( all 3 coins 16x16 - 1 of each: 0x41005e9e)
--table["GIcon"]:SetBackColor( Color["blue"] ); -- Debug purpose

table["GIcon"].MouseMove = function( sender, args )
	table["CIcon"].MouseMove( sender, args );
end

table["GIcon"].MouseLeave = function( sender, args )
	table["CLbl"].MouseLeave( sender, args );
end

table["GIcon"].MouseClick = function( sender, args )
	table["CLbl"].MouseClick( sender, args );
end

table["GIcon"].MouseDown = function( sender, args )
	table["CLbl"].MouseDown( sender, args );
end

table["GIcon"].MouseUp = function( sender, args )
	table["CLbl"].MouseUp( sender, args );
end
--**^

--**v Control of Silver currencies v**
table["SCtr"] = Turbine.UI.Control();
table["SCtr"]:SetParent( table["Ctr"] );
table["SCtr"]:SetMouseVisible( false );
--table["SCtr"]:SetZOrder( 2 );
--table["SCtr"]:SetBackColor( Color["blue"] ); -- Debug purpose
--**^
--**v Silver & total amount on TitanBar v**
table["SLblT"] = Turbine.UI.Label();
table["SLblT"]:SetParent( table["SCtr"] );
table["SLblT"]:SetPosition( 0, 0 );
table["SLblT"]:SetFont( _G.TBFont );
--table["SLblT"]:SetForeColor( Color["white"] );
table["SLblT"]:SetFontStyle( Turbine.UI.FontStyle.Outline );
table["SLblT"]:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleRight );
--table["SLblT"]:SetBackColor( Color["white"] ); -- Debug purpose

table["SLblT"].MouseMove = function( sender, args )
	table["CLbl"].MouseMove( sender, args );
end

table["SLblT"].MouseLeave = function( sender, args )
	table["CLbl"].MouseLeave( sender, args );
end

table["SLblT"].MouseClick = function( sender, args )
	table["CLbl"].MouseClick( sender, args );
end

table["SLblT"].MouseDown = function( sender, args )
	table["CLbl"].MouseDown( sender, args );
end

table["SLblT"].MouseUp = function( sender, args )
	table["CLbl"].MouseUp( sender, args );

end
--**^
--**v Silver amount & icon on TitanBar v**
table["SLbl"] = Turbine.UI.Label();
table["SLbl"]:SetParent( table["SCtr"] );
table["SLbl"]:SetPosition( 0, 0 );
table["SLbl"]:SetFont( _G.TBFont );
--table["SLbl"]:SetForeColor( Color["white"] );
--table["SLbl"]:SetSize( 20, 30 );
table["SLbl"]:SetFontStyle( Turbine.UI.FontStyle.Outline );
table["SLbl"]:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleRight );
--table["SLbl"]:SetBackColor( Color["white"] ); -- Debug purpose

table["SLbl"].MouseMove = function( sender, args )
	table["CLbl"].MouseMove( sender, args );
end

table["SLbl"].MouseLeave = function( sender, args )
	table["CLbl"].MouseLeave( sender, args );
end

table["SLbl"].MouseClick = function( sender, args )
	table["CLbl"].MouseClick( sender, args );
end

table["SLbl"].MouseDown = function( sender, args )
	table["CLbl"].MouseDown( sender, args );
end

table["SLbl"].MouseUp = function( sender, args )
	table["CLbl"].MouseUp( sender, args );

end


table["SIcon"] = Turbine.UI.Control();
table["SIcon"]:SetParent( table["SCtr"] );
--table["SIcon"]:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
table["SIcon"]:SetSize( 27, 21 );
table["SIcon"]:SetBackground( resources.MoneyIcon.Silver );-- in-game icon 27x21 (3 coins: 0x41007e7e / 1 coin: 0x41007e7c)
--table["SIcon"]:SetBackColor( Color["blue"] ); -- Debug purpose

table["SIcon"].MouseMove = function( sender, args )
	table["CIcon"].MouseMove( sender, args );
end

table["SIcon"].MouseLeave = function( sender, args )
	table["CLbl"].MouseLeave( sender, args );
end

table["SIcon"].MouseClick = function( sender, args )
	table["CLbl"].MouseClick( sender, args );
end

table["SIcon"].MouseDown = function( sender, args )
	table["CLbl"].MouseDown( sender, args );
end

table["SIcon"].MouseUp = function( sender, args )
	table["CLbl"].MouseUp( sender, args );
end
--**^

--**v Control of Copper currencies v**
table["CCtr"] = Turbine.UI.Control();
table["CCtr"]:SetParent( table["Ctr"] );
table["CCtr"]:SetMouseVisible( false );
--table["CCtr"]:SetZOrder( 2 );
--table["CCtr"]:SetBackColor( Color["blue"] ); -- Debug purpose
--**^
--**v Copper & total amount on TitanBar v**
table["CLblT"] = Turbine.UI.Label();
table["CLblT"]:SetParent( table["CCtr"] );
table["CLblT"]:SetPosition( 0, 0 );
table["CLblT"]:SetFont( _G.TBFont );
--table["CLblT"]:SetForeColor( Color["white"] );
table["CLblT"]:SetFontStyle( Turbine.UI.FontStyle.Outline );
table["CLblT"]:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleRight );
--table["CLblT"]:SetBackColor( Color["white"] ); -- Debug purpose

table["CLblT"].MouseMove = function( sender, args )
	table["CLbl"].MouseMove( sender, args );
end

table["CLblT"].MouseLeave = function( sender, args )
	table["CLbl"].MouseLeave( sender, args );
end

table["CLblT"].MouseClick = function( sender, args )
	table["CLbl"].MouseClick( sender, args );
end

table["CLblT"].MouseDown = function( sender, args )
	table["CLbl"].MouseDown( sender, args );
end

table["CLblT"].MouseUp = function( sender, args )
	table["CLbl"].MouseUp( sender, args );

end
--**^
--**v Copper amount & icon on TitanBar v**
table["CIcon"] = Turbine.UI.Control();
table["CIcon"]:SetParent( table["CCtr"] );
--table["CIcon"]:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
table["CIcon"]:SetSize( 27, 21 );
table["CIcon"]:SetBackground( resources.MoneyIcon.Copper );-- in-game icon 27x21 (3 coins: 0x41007e80 / 1 coin: 0x41007e7d)
--table["CIcon"]:SetBackColor( Color["blue"] ); -- Debug purpose

table["CIcon"].MouseMove = function( sender, args )
	table["CLbl"].MouseLeave( sender, args );
	TB["win"].MouseMove();
	if dragging then MoveMICtr(sender, args); end
end

table["CIcon"].MouseLeave = function( sender, args )
	table["CLbl"].MouseLeave( sender, args );
end

table["CIcon"].MouseClick = function( sender, args )
	table["CLbl"].MouseClick( sender, args );
end

table["CIcon"].MouseDown = function( sender, args )
	table["CLbl"].MouseDown( sender, args );
end

table["CIcon"].MouseUp = function( sender, args )
	table["CLbl"].MouseUp( sender, args );
end


table["CLbl"] = Turbine.UI.Label();
table["CLbl"]:SetParent( table["CCtr"] );
table["CLbl"]:SetPosition( 0, 0 );
table["CLbl"]:SetFont( _G.TBFont );
--table["CLbl"]:SetForeColor( Color["white"] );
--table["CLbl"]:SetSize( 20, 30 );
table["CLbl"]:SetFontStyle( Turbine.UI.FontStyle.Outline );
table["CLbl"]:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleRight );
--table["CLbl"]:SetBackColor( Color["white"] ); -- Debug purpose

table["CLbl"].MouseMove = function( sender, args )
	--table["CLbl"].MouseLeave( sender, args );
	TB["win"].MouseMove();
	if dragging then
		MoveMICtr(sender, args);
	else
		if not MITT then
			MITT = true;
			ShowMIWindow();
		else
			local mouseX, mouseY = Turbine.UI.Display.GetMousePosition();
			
			if _G.ToolTipWin:GetWidth() + mouseX + 5 > screenWidth then x = _G.ToolTipWin:GetWidth() - 10;
			else x = -5; end
			
			if TBTop then y = -15;
			else y = _G.ToolTipWin:GetHeight() end

			_G.ToolTipWin:SetPosition( mouseX - x, mouseY - y);
		end
	end
end

table["CLbl"].MouseLeave = function( sender, args )
	ResetToolTipWin();
	MITT = false;
end

table["CLbl"].MouseClick = function( sender, args )
	TB["win"].MouseMove();
	if ( args.Button == Turbine.UI.MouseButton.Left ) then
		if not WasDrag then
			if _G.frmMoney then _G.frmMoney = false; wMoney:Close();
			else
				_G.frmMoney = true;
				import (AppCtrWalletD.."MoneyWindow");
				frmMoneyWindow();
			end
		end
	elseif ( args.Button == Turbine.UI.MouseButton.Right ) then
		_G.sFromCtr = "Money";
		ControlMenu:ShowMenu();
	end
	WasDrag = false;
end

table["CLbl"].MouseDown = function( sender, args )
	if ( args.Button == Turbine.UI.MouseButton.Left ) then
		table["Ctr"]:SetZOrder( 3 );
		dragStartX = args.X;
		dragStartY = args.Y;
		dragging = true;
	end
end

table["CLbl"].MouseUp = function( sender, args )
	table["Ctr"]:SetZOrder( 2 );
	dragging = false;
	Position.Left["Money"] = table["Ctr"]:GetLeft();
	settings.Money.X = string.format("%.0f", Position.Left["Money"]);
	Position.Top["Money"] = table["Ctr"]:GetTop();
	settings.Money.Y = string.format("%.0f", Position.Top["Money"]);
	SaveSettings( false );
end
--**^

function MoveMICtr(sender, args)
	table["CLbl"].MouseLeave( sender, args );
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