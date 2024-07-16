-- Tables for control overrides:
MakeWalletControl_LabelAlignmentOverrides = {
    ["Commendations"] = Turbine.UI.ContentAlignment.MiddleCenter;
    [DestinyPoints] = Turbine.UI.ContentAlignment.MiddleCenter;
    ["LOTROPoints"] = Turbine.UI.ContentAlignment.MiddleCenter;
    ["Medallions"] = Turbine.UI.ContentAlignment.MiddleCenter;
    ["Seals"] = Turbine.UI.ContentAlignment.MiddleCenter;
    [Shards] = Turbine.UI.ContentAlignment.MiddleCenter;
}

MakeWalletControl_IconWidthOverrides = {
    [DestinyPoints] = 21;
    ["LOTROPoints"] = 36;
};

MakeWalletControl_IconHeightOverrides = {
    [DestinyPoints] = 22;
    ["LOTROPoints"] = 43;
};

--- This function creates a wallet control based on some parameters.
---@param key string The new internal key, e.g. "AmrothSilverPiece"
function MakeWalletControl(key)
    -- Make sure to not make this control more than once:
    if (_G[key]) then return; end

    -- We haven't made the control yet, proceed:
    _G[key] = {};
    MakeWalletControl_Control(_G[key], key);
    MakeWalletControl_Icon(_G[key], key);
    MakeWalletControl_Label(_G[key], key);
end

_G.MakeWalletControl = MakeWalletControl;

function MakeWalletControl_Control(table, key)
    --**v Control for this currency v**
    table["Ctr"] = Turbine.UI.Control();
    table["Ctr"]:SetParent( TB["win"] );
    table["Ctr"]:SetZOrder( 2 );
    table["Ctr"]:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
    table["Ctr"]:SetBackColor( Turbine.UI.Color( BC.Alpha[key], BC.Red[key], BC.Green[key], BC.Blue[key] ) );

    table["Ctr"].MouseMove = function( sender, args )
        table["Ctr"].MouseLeave( sender, args );
        TB["win"].MouseMove();
        if dragging then
            MoveCtr(table, args);
        else
            ShowToolTipWin( key );
        end
    end

    table["Ctr"].MouseLeave = function( sender, args )
        ResetToolTipWin();
    end

    table["Ctr"].MouseClick = function( sender, args )
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

    table["Ctr"].MouseDown = function( sender, args )
        if ( args.Button == Turbine.UI.MouseButton.Left ) then
            table["Ctr"]:SetZOrder( 3 );
            dragStartX = args.X;
            dragStartY = args.Y;
            dragging = true;
        end
    end

    table["Ctr"].MouseUp = function( sender, args )
        table["Ctr"]:SetZOrder( 2 );
        dragging = false;
        Position.Left[key] = table["Ctr"]:GetLeft();
        settings[key].X = string.format("%.0f", Position.Left[key]);
        Position.Top[key] = table["Ctr"]:GetTop();
        settings[key].Y = string.format("%.0f", Position.Top[key]);
        SaveSettings( false );
    end
    --**^
end

function MakeWalletControl_Icon(table, key)
    local iconWidth = MakeWalletControl_IconWidthOverrides[key] or 32;
    local iconHeight = MakeWalletControl_IconHeightOverrides[key] or 32;

    table["Icon"] = Turbine.UI.Control();
    table["Icon"]:SetParent( table["Ctr"] );
    table["Icon"]:SetBlendMode( Turbine.UI.BlendMode.AlphaBlend );
    table["Icon"]:SetSize( iconWidth, iconHeight );
    local imageNum = tonumber(key);
    if (imageNum) then
        table["Icon"]:SetBackground( imageNum );
    else
        table["Icon"]:SetBackground( WalletItem[key].Icon );
    end
    table["Icon"]:SetMouseVisible(false);
end

function MakeWalletControl_Label(table, key)
    local labelAlignment = MakeWalletControl_LabelAlignmentOverrides[key] or Turbine.UI.ContentAlignment.MiddleRight;

    table["Lbl"] = Turbine.UI.Label();
    table["Lbl"]:SetParent( table["Ctr"] );
    table["Lbl"]:SetFont( _G.TBFont );
    table["Lbl"]:SetPosition( 0, 0 );
    table["Lbl"]:SetFontStyle( Turbine.UI.FontStyle.Outline );
    table["Lbl"]:SetTextAlignment( labelAlignment );
    table["Lbl"]:SetMouseVisible(false);
end

function MoveCtr(table, args)
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
