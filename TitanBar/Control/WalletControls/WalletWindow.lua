-- WalletWindow.lua
-- Written by Habna
-- Rewritten by Many


function frmWalletWindow()
	wcur = nil;
	import (AppClassD.."ComboBox");
	WIDD = HabnaPlugins.TitanBar.Class.ComboBox();

	-- **v Set some window stuff v**
	_G.wWallet = Turbine.UI.Lotro.Window();
	if GLocale == "de" then w = 300; else w = 280; end
	_G.wWallet:SetSize( w, 640 ); --280x260
    _G.wWallet:SetPosition( PositionW.Left["Wallet"], PositionW.Top["Wallet"] );
	_G.wWallet:SetText( L["Wallet"] );
	_G.wWallet:SetVisible( true );
	_G.wWallet:SetWantsKeyEvents( true );
	--_G.wWallet:SetZOrder( 2 );
	_G.wWallet:Activate();

	_G.wWallet.KeyDown = function( sender, args )
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			_G.wWallet:Close();
		elseif ( args.Action == 268435635 ) or ( args.Action == 268435579 ) then -- Hide if F12 key or 'ctrl + \' is press
			_G.wWallet:SetVisible( not _G.wWallet:IsVisible() );
		elseif ( args.Action == 162 ) then --Enter key was pressed
			WIbutSave.Click( sender, args );
		end
	end

	_G.wWallet.MouseDown = function( sender, args )
		if ( args.Button == Turbine.UI.MouseButton.Left ) then dragging = true; end
	end

	_G.wWallet.MouseMove = function( sender, args )
		if dragging then if WIDD.dropped then WIDD:CloseDropDown(); end end
	end

	_G.wWallet.MouseUp = function( sender, args )
		dragging = false;
		settings.Wallet.L = string.format("%.0f", _G.wWallet:GetLeft());
		settings.Wallet.T = string.format("%.0f", _G.wWallet:GetTop());
		PositionW.Left["Wallet"], PositionW.Top["Wallet"] = _G.wWallet:GetPosition();
		SaveSettings( false );
	end

	_G.wWallet.Closing = function( sender, args )
		WIDD.dropDownWindow:SetVisible(false);
		_G.wWallet:SetWantsKeyEvents( false );
		_G.wWallet = nil;
		_G.frmWallet = nil;
	end
	-- **^
	
	local WIlbltextHeight = 35;
	local WIlbltext = Turbine.UI.Label();
	WIlbltext:SetParent( _G.wWallet );
	WIlbltext:SetText( L["WIt"] );
	WIlbltext:SetPosition( 20, 35);
	WIlbltext:SetSize( _G.wWallet:GetWidth()-40 , WIlbltextHeight );
	WIlbltext:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	WIlbltext:SetForeColor( Color["green"] );

	local WIFilterlblHeight = 20;
    local WIFilterlbl = Turbine.UI.Label();
    WIFilterlbl:SetParent(_G.wWallet);
    WIFilterlbl:SetSize(60,WIFilterlblHeight);
    WIFilterlbl:SetPosition(20,75);
    WIFilterlbl:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
    WIFilterlbl:SetText("Search:");
    local WIFiltertxt = Turbine.UI.Lotro.TextBox();
    WIFiltertxt:SetParent(_G.wWallet);
    WIFiltertxt:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    WIFiltertxt:SetMultiline(false);
    WIFiltertxt:SetPosition(80,75);
    WIFiltertxt:SetSize(_G.wWallet:GetWidth() - 120, 20);
    WIFiltertxt.Text = "";
    WIFiltertxt.LowerText = "";
    WIFiltertxt.TextChanged = function()
        if WIFiltertxt.Text ~= WIFiltertxt:GetText() then
            WIFiltertxt.Text = WIFiltertxt:GetText();
            WIFiltertxt.LowerText = string.lower(WIFiltertxt.Text);
            WIFilter(WIFiltertxt.Text);
        end
    end

   function WIFilter()
        for i=1,WIListBox:GetItemCount() do
            local row = WIListBox:GetItem(i);
            if string.find(string.lower(row.curLbl:GetText()),WIFiltertxt.LowerText) == nil then
                row:SetHeight(0);
            else
                row:SetHeight(20);
            end
        end
    end

	-- **v Set the Wallet listbox v**
	local WIListBoxHeight = 
		_G.wWallet:GetHeight()-95 - WIlbltextHeight - WIFilterlblHeight;
	WIListBox = Turbine.UI.ListBox();
	WIListBox:SetParent( _G.wWallet );
	WIListBox:SetZOrder( 1 );
	WIListBox:SetPosition( 20, 115 );
	--WIListBox:SetPosition( 20, WIlbltext:GetTop()+WIlbltext:GetHeight()+5 );
	WIListBox:SetSize( _G.wWallet:GetWidth()-40, WIListBoxHeight );
	WIListBox:SetMaxItemsPerLine( 1 );
	WIListBox:SetOrientation( Turbine.UI.Orientation.Horizontal );
	--WIListBox:SetBackColor( Color["red"] ); --debug purpose
	-- **^
	-- **v Set the listbox scrollbar v**
	WIListBoxScrollBar = Turbine.UI.Lotro.ScrollBar();
	WIListBoxScrollBar:SetParent( WIListBox );
	WIListBoxScrollBar:SetZOrder( 1 );
	WIListBoxScrollBar:SetOrientation( Turbine.UI.Orientation.Vertical );
	WIListBox:SetVerticalScrollBar( WIListBoxScrollBar );
	WIListBoxScrollBar:SetPosition( WIListBox:GetWidth() - 10, 0 );
	WIListBoxScrollBar:SetSize( 12, WIListBox:GetHeight() );
	-- **^

	WIWCtr = Turbine.UI.Control();
	WIWCtr:SetParent( _G.wWallet );
	WIWCtr:SetPosition( WIListBox:GetLeft(), WIListBox:GetTop() );
	WIWCtr:SetSize( WIListBox:GetWidth(), WIListBox:GetHeight() );
	WIWCtr:SetZOrder( 0 );
	WIWCtr:SetVisible( false );
	WIWCtr:SetBlendMode( 5 );
	WIWCtr:SetBackground( resources.WalletWindow );

	WIWCtr.MouseClick = function( sender, args )
		if ( args.Button == Turbine.UI.MouseButton.Right ) then
			WIDD.Cleanup();
			WIWCtr:SetVisible( false );
			WIWCtr:SetZOrder( 0 );
		end
	end
	
	WIlblFN = Turbine.UI.Label();
	WIlblFN:SetParent( WIWCtr );
	WIlblFN:SetPosition( 0 , WIWCtr:GetHeight()/2 - 40 );
	WIlblFN:SetSize( WIWCtr:GetWidth() , 15 );
	WIlblFN:SetFont( Turbine.UI.Lotro.Font.TrajanPro16 );
	WIlblFN:SetFontStyle( Turbine.UI.FontStyle.Outline );
	WIlblFN:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	WIlblFN:SetForeColor( Color["rustedgold"] );

	WICBO = { L["WIot"], L["WIiw"], L["WIds"] } --Combobox options
	
	-- **v Create drop down box v**
	WIDD:SetParent( WIWCtr );
	WIDD:SetSize( 170, 19 );
	WIDD:SetPosition( WIWCtr:GetWidth()/2 - WIDD:GetWidth()/2, WIlblFN:GetTop()+WIlblFN:GetHeight()+10 );

	WIDD.dropDownWindow:SetParent( WIWCtr );
	WIDD.dropDownWindow:SetPosition(WIDD:GetLeft(), WIDD:GetTop() + WIDD:GetHeight()+2);
	-- **^
	
	for k,v in pairs(WICBO) do WIDD:AddItem(v, k); end

	--** LOTRO Point box
	LPWCtr = Turbine.UI.Control();
	LPWCtr:SetParent( WIWCtr );
	LPWCtr:SetPosition( WIListBox:GetLeft(), WIDD:GetTop()+WIDD:GetHeight()+10 );
	LPWCtr:SetZOrder( 2 );
	--LPWCtr:SetBackColor( Color["red"] ); -- debug purpose

	local WIlblLOTROPTS = Turbine.UI.Label();
	WIlblLOTROPTS:SetParent( LPWCtr );
	--WIlblLOTROPTS:SetFont( Turbine.UI.Lotro.Font.TrajanPro14 );
	WIlblLOTROPTS:SetText( L[LOTROPoints] );
	WIlblLOTROPTS:SetPosition( 0, 2 );
	WIlblLOTROPTS:SetSize( WIlblLOTROPTS:GetTextLength() * 7.5, 15 ); --Auto size with text lenght
	WIlblLOTROPTS:SetForeColor( Color["rustedgold"] );
	WIlblLOTROPTS:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft );
	--WIlblLOTROPTS:SetBackColor( Color["red"] ); -- debug purpose

	WItxtLOTROPTS = Turbine.UI.Lotro.TextBox();
	WItxtLOTROPTS:SetParent( LPWCtr );
	WItxtLOTROPTS:SetFont( Turbine.UI.Lotro.Font.TrajanPro14 );
	--WItxtLOTROPTS:SetText( _G.LOTROPTS );
	WItxtLOTROPTS:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft );
	WItxtLOTROPTS:SetPosition( WIlblLOTROPTS:GetLeft()+WIlblLOTROPTS:GetWidth()+5, WIlblLOTROPTS:GetTop()-2 );
	WItxtLOTROPTS:SetSize( 80, 20 );
	WItxtLOTROPTS:SetMultiline( false );
	if PlayerAlign == 2 then WItxtLOTROPTS:SetBackColor( Color["red"] ); end

	WItxtLOTROPTS.FocusGained = function( sender, args )
		WItxtLOTROPTS:SelectAll();
		WItxtLOTROPTS:SetWantsUpdates( true );
	end

	WItxtLOTROPTS.FocusLost = function( sender, args )
		WItxtLOTROPTS:SetWantsUpdates( false );
	end

	WItxtLOTROPTS.Update = function( sender, args )
		local parsed_text = WItxtLOTROPTS:GetText();

		if tonumber(parsed_text) == nil or string.find(parsed_text,"%.") ~= nil then
			WItxtLOTROPTS:SetText( string.sub( parsed_text, 1, string.len(parsed_text)-1 ) );
			return
		elseif string.len(parsed_text) > 1 and string.sub(parsed_text,1,1) == "0" then
			WItxtLOTROPTS:SetText( string.sub( parsed_text, 2 ) );
			return
		end
	end

	LPWCtr:SetSize( WIListBox:GetWidth(), 20 );
	--**

	WIbutSave = Turbine.UI.Lotro.Button();
	WIbutSave:SetParent( WIWCtr );
	WIbutSave:SetText( L["PWSave"] );
	WIbutSave:SetSize( WIbutSave:GetTextLength() * 10, 15 ); --Auto size with text length
	--WIbutSave:SetEnabled( true );

	WIbutSave.Click = function( sender, args )
		WIWCtr:SetVisible( false );
		WIWCtr:SetZOrder( 0 );

		SelIndex = WIDD:GetSelection();

        -- Update the Where settings for this currency,
        -- then call ShowHideCurrency if appropriate:

		--Where-> 1: On TitanBar / 2: In wallet control tooltip / 3: Don't show
        Where[wcur] = SelIndex;
        settings[wcur].W = string.format("%.0f", SelIndex);
        if SelIndex == 1 then
            if not Show[wcur] then
                ShowHideCurrency(wcur);
            end
        else
            if Show[wcur] then
                ShowHideCurrency(wcur);
            end
        end

        -- Do currency-specific items here:
        if wcur == LOTROPoints then
			local parsed_text = WItxtLOTROPTS:GetText();

			if parsed_text == "" then
				WItxtLOTROPTS:SetText( "0" );
				WItxtLOTROPTS:Focus();
				return
			elseif parsed_text == _G.LOTROPTS then
				WItxtLOTROPTS:Focus();
				return
			end
			
			_G.LOTROPTS = WItxtLOTROPTS:GetText();
			if Where[LOTROPoints] == 1 then UpdateLOTROPoints(); end
			SavePlayerLOTROPoints();
		end
        -- End currency-specific section.

		SaveSettings( false );
	end

	RefreshWIListBox();
end

function RefreshWIListBox()
	WIListBox:ClearItems();
	
	for i = 1, #MenuItem do		
		--**v Control of all data v**
		local WICtr = Turbine.UI.Control();
		WICtr:SetParent( WIListBox );
		WICtr:SetSize( WIListBox:GetWidth(), 20 );
		--**^
		
		-- Wallet currency name
		local curLbl = Turbine.UI.Label();
		WICtr.curLbl = curLbl;
		curLbl:SetParent( WICtr );
		curLbl:SetText( L[MenuItem[i]] );
		curLbl:SetSize( WIListBox:GetWidth(), 20 );
		curLbl:SetPosition( 0, 0 );
		curLbl:SetFont( Turbine.UI.Lotro.Font.TrajanPro16 );
		curLbl:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft );
		curLbl:SetForeColor( Color["nicegold"] );
		--curLbl:SetBackColor( Color["blue"] ); --debug purpose

		curLbl.MouseClick = function( sender, args )
			if ( args.Button == Turbine.UI.MouseButton.Right ) then
				wcur = MenuItem[i];
				WIlblFN:SetText( L[wcur] );
				LPWCtr:SetVisible( false );
				WIbutSave:SetPosition( WIWCtr:GetWidth()/2 - WIbutSave:GetWidth()/2, WIDD:GetTop()+WIDD:GetHeight()+10 );

                local where = tonumber(Where[wcur]);
                WIDD:SetSelection(where);

                if wcur == LOTROPoints then
                    LPWCtr:SetVisible( true );
                    WItxtLOTROPTS:SetText( _G.LOTROPTS );
                    WItxtLOTROPTS:Focus();
                    WIbutSave:SetPosition( WIWCtr:GetWidth()/2 - WIbutSave:GetWidth()/2, LPWCtr:GetTop()+LPWCtr:GetHeight()+10);
                end

				WIWCtr:SetVisible( true );
				WIWCtr:SetZOrder( 2 );
				WIWCtr:SetBackground( resources.WalletWindowRefresh );
			end
		end

		WIListBox:AddItem( WICtr );
	end
	WIFilter();
end