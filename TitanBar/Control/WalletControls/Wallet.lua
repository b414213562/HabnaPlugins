-- Wallet.lua
-- Written by Habna


_G.WI = {}; -- Wallet table in _G

--**v Wallet Control v**
WI["Ctr"] = Turbine.UI.Control();
WI["Ctr"]:SetParent( TB["win"] );
WI["Ctr"]:SetMouseVisible( false );
WI["Ctr"]:SetZOrder( 2 );
WI["Ctr"]:SetBlendMode( 4 );
WI["Ctr"]:SetBackColor( Turbine.UI.Color( BC.Alpha["Wallet"], BC.Red["Wallet"], BC.Green["Wallet"], BC.Blue["Wallet"] ) );
--WI["Ctr"]:SetBackColor( Color["red"] ); -- Debug puWIose
--**^
--**v Wallet icon on TitanBar v**
WI["Icon"] = Turbine.UI.Control();
WI["Icon"]:SetParent( WI["Ctr"] );
WI["Icon"]:SetBlendMode( 4 );
WI["Icon"]:SetSize( 32, 32 );
WI["Icon"]:SetBackground( resources.Wallet ); 
--WI["Icon"]:SetBackColor( Color["blue"] ); -- Debug purpose

WI["Icon"].MouseMove = function( sender, args )
	--WI["Icon"].MouseLeave( sender, args );
	TB["win"].MouseMove();
	if dragging then
		MoveWICtr(sender, args);
	else
		if not WITT then
			WITT = true;
			ShowWIToolTip();
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

WI["Icon"].MouseLeave = function( sender, args )
	ResetToolTipWin();
	WITT = false;
end

WI["Icon"].MouseClick = function( sender, args )
	TB["win"].MouseMove();
	if ( args.Button == Turbine.UI.MouseButton.Left ) then
		if not WasDrag then
			if _G.frmWI then _G.frmWI = false; wWI:Close();
			else
				_G.frmWI = true;
				import (AppCtrWalletD.."WalletWindow");
				frmWalletWindow();
			end
		end
	elseif ( args.Button == Turbine.UI.MouseButton.Right ) then
		_G.sFromCtr = "WI";
		ControlMenu:ShowMenu();
	end
	WasDrag = false;
end

WI["Icon"].MouseDown = function( sender, args )
	if ( args.Button == Turbine.UI.MouseButton.Left ) then
		WI["Ctr"]:SetZOrder( 3 );
		dragStartX = args.X;
		dragStartY = args.Y;
		dragging = true;
	end
end

WI["Icon"].MouseUp = function( sender, args )
	WI["Ctr"]:SetZOrder( 2 );
	dragging = false;
	Position.Left["Wallet"] = WI["Ctr"]:GetLeft();
	settings.Wallet.X = string.format("%.0f", Position.Left["Wallet"]);
	Position.Top["Wallet"] = WI["Ctr"]:GetTop();
	settings.Wallet.Y = string.format("%.0f", Position.Top["Wallet"]);
	SaveSettings( false );
end
--**^

function MoveWICtr(sender, args)
	WI["Icon"].MouseLeave( sender, args );
	local CtrLocX = WI["Ctr"]:GetLeft();
	local CtrWidth = WI["Ctr"]:GetWidth();
	CtrLocX = CtrLocX + ( args.X - dragStartX );
	if CtrLocX < 0 then CtrLocX = 0; elseif CtrLocX + CtrWidth > screenWidth then CtrLocX = screenWidth - CtrWidth; end

	local CtrLocY = WI["Ctr"]:GetTop();
	local CtrHeight = WI["Ctr"]:GetHeight();
	CtrLocY = CtrLocY + ( args.Y - dragStartY );
	if CtrLocY < 0 then CtrLocY = 0; elseif CtrLocY + CtrHeight > TB["win"]:GetHeight() then CtrLocY = TB["win"]:GetHeight() - CtrHeight; end

	WI["Ctr"]:SetPosition( CtrLocX, CtrLocY );
	WasDrag = true;
end