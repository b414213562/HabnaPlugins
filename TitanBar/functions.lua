-- functions.lua
-- Written By Habna
-- rewritten by many

-- Basic debug function to look at a table:
function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end
--

function AddCallback(object, event, callback)
    if (object[event] == nil) then
        object[event] = callback;
    else
        if (type(object[event]) == "table") then
            table.insert(object[event], callback);
        else
            object[event] = {object[event], callback};
        end
    end
    return callback;
end

function RemoveCallback(object, event, callback)
    if (object[event] == callback) then
        object[event] = nil;
    else
        if (type(object[event]) == "table") then
            local size = table.getn(object[event]);
            for i = 1, size do
                if (object[event][i] == callback) then
                    table.remove(object[event], i);
                    break;
                end
            end
        end
    end
end

-- Workaround because 'math.round' not working for some user, weird!
-- Takes a number and returns a rounded up or down version
-- if number is >=0.5, it rounds up
function round(num)
    local floor = math.floor(num)
    local ceiling = math.ceil(num)
    if (num - floor) >= 0.5 then
        return ceiling
    end
    return floor
end

function ApplySkin() --Tooltip skin
	--**v Top left corner v**
	local topLeftCorner = Turbine.UI.Control();
	topLeftCorner:SetParent( _G.ToolTipWin );
	topLeftCorner:SetPosition( 0, 0 );
	topLeftCorner:SetSize( 36, 36 );
	topLeftCorner:SetBackground( resources.Box.TopLeft );
	--**^
	--**v Top v**
	local TopBar = Turbine.UI.Control();
	TopBar:SetParent( _G.ToolTipWin );
	TopBar:SetPosition( 36, 0 );
	TopBar:SetSize( _G.ToolTipWin:GetWidth() - 36, 37 );
	TopBar:SetBackground( resources.Box.Top )
	--**^
	--**v Top right corner v**
	local topRightCorner = Turbine.UI.Control();
	topRightCorner:SetParent( _G.ToolTipWin );
	topRightCorner:SetPosition( _G.ToolTipWin:GetWidth() - 36, 0 );
	topRightCorner:SetSize( 36, 36 );
	topRightCorner:SetBackground( resources.Box.TopRight );
	--**^
	--**v Mid Left v**
	local midLeft = Turbine.UI.Control();
	midLeft:SetParent( _G.ToolTipWin );
	midLeft:SetPosition( 0, 36 );
	midLeft:SetSize( 36, _G.ToolTipWin:GetHeight() - 36 );
	midLeft:SetBackground( resources.Box.MidLeft );
	--**^
	--**v Middle v**
	local MidMid = Turbine.UI.Control();
	MidMid:SetParent( _G.ToolTipWin );
	MidMid:SetPosition( 36, 36 );
	MidMid:SetSize( 
        _G.ToolTipWin:GetWidth() - 36, _G.ToolTipWin:GetHeight() - 36);
	MidMid:SetBackground( resources.Box.Middle ); 
	--**^
	--**v Mid Right v**
	local midRight = Turbine.UI.Control();
	midRight:SetParent( _G.ToolTipWin );
	midRight:SetPosition( _G.ToolTipWin:GetWidth() - 36, 36 );
	midRight:SetSize( 36, _G.ToolTipWin:GetHeight() - 36 );
	midRight:SetBackground( resources.Box.MidRight );
	--**^
	--**v Bottom Left Corner v**
	local botLeftCorner = Turbine.UI.Control();
	botLeftCorner:SetParent( _G.ToolTipWin );
	botLeftCorner:SetPosition( 0, _G.ToolTipWin:GetHeight() - 36 );
	botLeftCorner:SetSize( 36, 36 );
	botLeftCorner:SetBackground( resources.Box.BottomLeft ); 
	--**^
	--**v Bottom v**
	local BotBar = Turbine.UI.Control();
	BotBar:SetParent( _G.ToolTipWin );
	BotBar:SetPosition( 36, _G.ToolTipWin:GetHeight() - 36 );
	BotBar:SetSize( _G.ToolTipWin:GetWidth() - 36, 36 );
	BotBar:SetBackground( resources.Box.Bottom );
	--**^
	--**v Bottom right corner v**
	local botRightCorner = Turbine.UI.Control();
	botRightCorner:SetParent( _G.ToolTipWin );
	botRightCorner:SetPosition( _G.ToolTipWin:GetWidth() - 36, 
        _G.ToolTipWin:GetHeight() - 36 );
	botRightCorner:SetSize( 36, 36 );
	botRightCorner:SetBackground( resources.Box.BottomRight );
	--**^
end

--**v Create a ToolTip Window v**
function createToolTipWin( xOffset, yOffset, xSize, ySize, side, header, text1,
        text2, text3 )
	local txt = {text1, text2, text3};
	_G.ToolTipWin = Turbine.UI.Window();
	_G.ToolTipWin:SetSize( xSize, ySize );
	--_G.ToolTipWin:SetMouseVisible( false );
	_G.ToolTipWin:SetZOrder( 1 );
	_G.ToolTipWin.xOffset = xOffset;
	_G.ToolTipWin.yOffset = yOffset;
	--_G.ToolTipWin:SetBackColor( Color["black"] ); --Debug purpose

	ApplySkin();

	--**v Text in Header v**
	lblheader = Turbine.UI.Label();
	lblheader:SetParent( _G.ToolTipWin );
	lblheader:SetPosition( 40, 7 ); --10
	lblheader:SetSize( xSize, ySize );
	lblheader:SetForeColor( Color["green"] );
	lblheader:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	lblheader:SetText( header );
	--**^
	
	local YPos = 25;
	
	--**v Text v**
	for i = 1, #txt do
		local lbltext = Turbine.UI.Label();
		lbltext:SetParent( _G.ToolTipWin );
		lbltext:SetPosition( 40, YPos ); --10
		lbltext:SetSize( xSize, 15 );
		lbltext:SetForeColor( Color["white"] );
		lbltext:SetFont(Turbine.UI.Lotro.Font.Verdana14);
		lbltext:SetText( txt[i] );
		YPos = YPos + 15;
	end
	--**^

	return _G.ToolTipWin;
end

function GetCurrencyTooltip(key)
    return WalletCurrencyTooltips[key] or ("Could not find tooltip for " .. key);
end

-- Legend
-- ( offsetX, offsetY, width, height, bubble side, header text, text1, text2, text3, text4 )
function ShowToolTipWin( ToShow )
	local bblTo, x, y, w = "left", -5, -15, 0; 
	local mouseX, mouseY = Turbine.UI.Display.GetMousePosition();
	
	w = 350;
	if TBLocale == "fr" then w = 315;
	elseif TBLocale == "de" then
		if ToShow == "DI" then w = 225; 
		else w = 305; end
	end

    local key = CurrencyCodeToKey[ToShow];

    -- Currencies:
    if (key) then
        local tooltipWindowCustomHeight = {
            ["LOTROPoints"] = 80;
        };
        h = tooltipWindowCustomHeight[key] or 65;

        local tooltipWindowCustomWidth = {
            ["CentralGondorSilverPiece"] = w + 30;
        }
        w = tooltipWindowCustomWidth[key] or w;

        local tooltipWindowCustomLines = {
            ["LOTROPoints"] = { L["EIt1"], L["EIt2"], L["EIt3"] };
        }
        local lines = tooltipWindowCustomLines[key] or { L["EIt2"], L["EIt3"] };

        if w + mouseX > screenWidth then bblTo = "right"; x = w - 10; end
		if not TBTop then y = h; end
        TTW = createToolTipWin( x, y, w, h, bblTo, GetCurrencyTooltip(key), unpack(lines) );
    -- Non-currencies:
    else
        if ToShow == "BI" then -- Bag Infos
            if w + mouseX > screenWidth then bblTo = "right"; x = w - 10; end
            h = 80;
            if not TBTop then y = h; end
            TTW = createToolTipWin( x, y, w, h, bblTo, L["MBI"], L["EIt1"], L["EIt2"], L["EIt3"] );
        elseif ToShow == "PL" then -- Player Location
            if w + mouseX > screenWidth then bblTo = "right"; x = w - 10; end
            h = 65;
            if not TBTop then y = h; end
            TTW = createToolTipWin( x, y, w, h, bblTo, L["PLh"], L["EIt2"], 
                L["EIt3"] );
        elseif ToShow == "GT" then -- Game Time
            if w + mouseX > screenWidth then bblTo = "right"; x = w - 10; end
            h = 80;
            if not TBTop then y = h; end
            TTW = createToolTipWin( x, y, w, h, bblTo, L["GTh"], L["EIt1"], 
                L["EIt2"], L["EIt3"] );
        elseif ToShow == "VT" then -- Vault
            if w + mouseX > screenWidth then bblTo = "right"; x = w - 10; end
            h = 80;
            if not TBTop then y = h; end
            TTW = createToolTipWin( x, y, w, h, bblTo, L["MVault"], L["EIt1"], 
                L["EIt2"], L["EIt3"] );
        elseif ToShow == "SS" then -- Shared Storage
            if w + mouseX > screenWidth then bblTo = "right"; x = w - 10; end
            h = 80;
            if not TBTop then y = h; end
            TTW = createToolTipWin( x, y, w, h, bblTo, L["MStorage"], L["EIt1"], 
                L["EIt2"], L["EIt3"] );
    --[[	elseif ToShow == "BK" then -- Bank
            if w + mouseX > screenWidth then bblTo = "right"; x = w - 10; end
            h = 80;
            if not TBTop then y = h; end
            TTW = createToolTipWin( x, y, w, h, bblTo, L["MBank"], L["EIt1"], 
                L["EIt2"], L["EIt3"] ); --]]
        elseif ToShow == "DN" then -- Day & Night
            if w + mouseX > screenWidth then bblTo = "right"; x = w - 10; end
            h = 80;
            if not TBTop then y = h; end
            TTW = createToolTipWin( x, y, w, h, bblTo, L["MDayNight"], L["EIt1"], 
                L["EIt2"], L["EIt3"] );
        end
    end

	_G.ToolTipWin:SetPosition( mouseX - _G.ToolTipWin.xOffset, mouseY - 
        _G.ToolTipWin.yOffset);
	_G.ToolTipWin:SetVisible( true );
end
--**^
--**v Update Wallet on TitanBar v**
function UpdateWallet()
	AjustIcon( "WI" );
end
--**^
--**v Update money on TitanBar v**
function UpdateMoney()
	if Where["Money"] == 1 then
		local money = PlayerAtt:GetMoney();
		local gold, silver, copper = DecryptMoney( money );
	
		MI[ "GLbl" ]:SetText( string.format( "%.0f", gold ) );
		MI[ "SLbl" ]:SetText( string.format( "%.0f", silver ) );
		MI[ "CLbl" ]:SetText( string.format( "%.0f", copper ) );

		SavePlayerMoney( false );

		MI[ "GLbl" ]:SetSize( MI[ "GLbl" ]:GetTextLength() * NM, CTRHeight ); 
            --Auto size with text length
		MI[ "SLbl" ]:SetSize( 4 * NM, CTRHeight ); --Auto size with text length
		MI[ "CLbl" ]:SetSize( 3 * NM, CTRHeight ); --Auto size with text length

		MI[ "GLblT" ]:SetVisible( _G.STM );
		MI[ "GLbl" ]:SetVisible( not _G.STM );

		MI[ "SLblT" ]:SetVisible( _G.STM );
		MI[ "SLbl" ]:SetVisible( not _G.STM );

		MI[ "CLblT" ]:SetVisible( _G.STM );
		MI[ "CLbl" ]:SetVisible( not _G.STM );
	
		if _G.STM then --Add Total Money on TitanBar Money control.
			local strData = L[ "MIWTotal" ] .. ": ";
			local strData1 = string.format( "%.0f", GoldTot );
			local strData2 = L[ "You" ] .. MI[ "GLbl" ]:GetText();
			local TextLen = string.len( strData ) * TM + string.len( strData1 ) * NM;
			if TBFontT == "TrajanPro25" then TextLen = TextLen + 7; end
			MI[ "GLblT" ]:SetText(strData .. strData1 .. "\n" .. strData2 .. " ");
			MI[ "GLblT" ]:SetSize( TextLen, CTRHeight );

			strData1 = string.format( "%.0f", SilverTot );
			strData2 = MI[ "SLbl" ]:GetText();
			TextLen = 4 * NM + 6;
			MI[ "SLblT" ]:SetText( strData1 .. "\n" .. strData2 .. " " );
			MI[ "SLblT" ]:SetSize( TextLen, CTRHeight );

			strData1 = string.format( "%.0f", CopperTot );
			strData2 = MI[ "CLbl" ]:GetText();
			TextLen = 3 * NM + 6;
			MI[ "CLblT" ]:SetText( strData1 .. "\n" .. strData2 .. " " );
			MI[ "CLblT" ]:SetSize( TextLen, CTRHeight );
		end

		--Statistics section
		local PN = Player:GetName();
		local bIncome = true;
		bSumSSS, bSumSTS = true, true;
		local hadmoney = walletStats[DOY][PN].Had;

		local diff = money - hadmoney;
		if diff < 0 then diff = math.abs(diff); bIncome = false; end

		if bIncome then 
			walletStats[DOY][PN].Earned = 
                tostring(walletStats[DOY][PN].Earned + diff);
			walletStats[DOY][PN].TotEarned = 
                tostring(walletStats[DOY][PN].TotEarned + diff);
		else
			walletStats[DOY][PN].Spent = 
                tostring(walletStats[DOY][PN].Spent + diff);
			walletStats[DOY][PN].TotSpent = 
                tostring(walletStats[DOY][PN].TotSpent + diff);
		end

		walletStats[DOY][PN].Had = tostring(money);

		--Sum of session statistics
		local SSS = walletStats[DOY][PN].Earned - walletStats[DOY][PN].Spent;
		if SSS < 0 then SSS = math.abs(SSS); bSumSSS = false; end
		walletStats[DOY][PN].SumSS = tostring(SSS);

		-- Sum of today satistics
		--Calculate all character earned & spent
		totem, totsm = 0,0;
		for k,v in pairs(walletStats[DOY]) do
			totem = totem + v.TotEarned;
			totsm = totsm + v.TotSpent;
		end
		
		local STS = totem - totsm;
		if STS < 0 then STS = math.abs(STS); bSumSTS = false; end
		walletStats[DOY][PN].SumTS = tostring(STS);

		Turbine.PluginData.Save( 
            Turbine.DataScope.Server, "TitanBarPlayerWalletStats", walletStats);
	
		AjustIcon( "MI" );
	end
end
--**^
--**v Update LOTRO points on TitanBar v**
function UpdateLOTROPoints()
	if Where["LOTROPoints"] == 1 then
		LP[ "Lbl" ]:SetText( _G.LOTROPTS );
		LP[ "Lbl" ]:SetSize( LP[ "Lbl" ]:GetTextLength() * NM, CTRHeight ); 
		AjustIcon( "LP" );
	end
	SavePlayerLOTROPoints();
end
--**^

--- Function to update the details for currencies on the bar.
--- Does nothing if the currency is not currently on the bar (Where = 1) or in the tooltip (Where = 2).
---@param key string The key (e.g. "DestinyPoints" for the currency)
---@param quantity integer The new quantity, if known. Otherwise, will call GetCurrency().
function UpdateCurrency(key, quantity)
    local code = CurrencyKeyToCode[key];
    local table = _G[code];
    local quantity = quantity or GetCurrency(key);

	if Where[key] == 1 and table["Lbl"] then
        local label = table["Lbl"];
		label:SetText( quantity );
		label:SetSize( label:GetTextLength() * NM, CTRHeight );
		AjustIcon( code );
	end
end

function AddCurrencyCallbackIfNeeded(walletItem)
    local currencyName = walletItem:GetName();
    local key = CurrencyNameToKey[currencyName];
    PlayerCurrency[currencyName] = walletItem;

    if PlayerCurrencyHandler[currencyName] == nil and key ~= nil then
        PlayerCurrencyHandler[currencyName] = AddCallback(
            PlayerCurrency[currencyName],
            "QuantityChanged",
            function(sender, args)
                local newQuantity = sender:GetQuantity();
                if (Show[key]) then
                    UpdateCurrency(key, newQuantity);
                end
        end);
    end
end

function CurrencyAdded(sender, args)
    local item = PlayerWallet:GetItem(args.Index);
    local currencyName = item:GetName();

    local key = CurrencyNameToKey[currencyName];
    if (key) then
        AddCurrencyCallbackIfNeeded(item);
        UpdateCurrency(key, item:GetQuantity());
    end
end

function CurrencyRemoved(sender, args)
    local item = PlayerWallet:GetItem(args.Index);
    local currencyName = item:GetName();

    local key = CurrencyNameToKey[currencyName];
    if (key) then
        UpdateCurrency(key, 0);

        RemoveCallback(item, PlayerCurrencyHandler[currencyName]);
        PlayerCurrencyHandler[currencyName] = nil;
    end
end

--**v Update backpack infos on TitanBar v**
function UpdateBackpackInfos()
	local max = backpack:GetSize();
	local freeslots = 0;

	for i = 1, max do
		if ( backpack:GetItem( i ) == nil ) then freeslots = freeslots + 1; end
	end

	if _G.BIUsed and _G.BIMax then 
        BI[ "Lbl" ]:SetText( max - freeslots .. "/" .. max );
	elseif _G.BIUsed and not _G.BIMax then 
        BI[ "Lbl" ]:SetText( max - freeslots );
	elseif not _G.BIUsed and _G.BIMax then 
        BI[ "Lbl" ]:SetText( freeslots .. "/" .. max );
	elseif not _G.BIUsed and not _G.BIMax then 
        BI[ "Lbl" ]:SetText( freeslots ); 
    end
	BI[ "Lbl" ]:SetSize( BI[ "Lbl" ]:GetTextLength() * NM, CTRHeight ); 

	--Change bag icon with capacity
	local i = nil;
	usedslots = max - freeslots;
	local bi = round((( usedslots / max ) * 100));

	if bi >= 0 and bi <= 15 then i = 1; end-- 0% to 15% Full bag
	if bi >= 16 and bi <= 30 then i = 2; end-- 16% to 30% Full bag
	if bi >= 31 and bi <= 75 then i = 3; end-- 31% to 75% Full bag
	if bi >= 76 and bi <= 99 then i = 4; end-- 75% to 99% Full bag
	if bi == 100 then i = 5; end-- 100% Full bag
	--if bi >= 101 then BagIcon = 0x41007ecf; end-- over loaded bag
	
	BI[ "Icon" ]:SetBackground( resources.BagIcon[i] );

	AjustIcon( "BI" );
end
--**^
--**v Update player infos on TitanBar v**
function UpdatePlayersInfos()
	PlayerRaceIs = Player:GetRace();
	
	--Free people race
	if PlayerRaceIs == 0 then PlayerRaceIs = ""; -- Undefined
	elseif PlayerRaceIs == 65 then PlayerRaceIs = L[ "Elf" ];
	elseif PlayerRaceIs == 23 then PlayerRaceIs = L[ "Man" ];
	elseif PlayerRaceIs == 73 then PlayerRaceIs = L[ "Dwarf" ];
	elseif PlayerRaceIs == 81 then PlayerRaceIs = L[ "Hobbit" ];
	elseif PlayerRaceIs == 114 then PlayerRaceIs = L[ "Beorning" ];
	elseif PlayerRaceIs == 117 then PlayerRaceIs = L[ "HighElf" ];
	elseif PlayerRaceIs == 120 then PlayerRaceIs = L[ "StoutAxe" ];

	--Monster play race
	elseif PlayerRaceIs == 7 then PlayerRaceIs = ""; end
	
	PlayerClassIs = Player:GetClass();
	
	--Free People Class
	if PlayerClassIs == 23 then 
        PlayerClassIs = L["Guardian"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.Guardian;
	elseif PlayerClassIs == 24 then 
        PlayerClassIs = L["Captain"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.Captain;
	elseif PlayerClassIs == 31 then 
        PlayerClassIs = L["Minstrel"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.Minstrel;
	elseif PlayerClassIs == 40 then 
        PlayerClassIs = L["Burglar"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.Burglar;
	elseif PlayerClassIs == 162 then 
        PlayerClassIs = L["Hunter"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.Hunter;
	elseif PlayerClassIs == 172 then 
        PlayerClassIs = L["Champion"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.Champion;
	elseif PlayerClassIs == 185 then 
        PlayerClassIs = L["Lore-Master"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.LoreMaster;
	elseif PlayerClassIs == 193 then 
        PlayerClassIs = L["Rune-Keeper"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.RuneKeeper;
	elseif PlayerClassIs == 194 then 
        PlayerClassIs = L["Warden"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.Warden;
	elseif PlayerClassIs == 214 then 
        PlayerClassIs = L["Beorning"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.Beorning;
	elseif PlayerClassIs == 215 then 
        PlayerClassIs = L["Brawler"]; 
        PlayerIconCodeIs = resources.PlayerIconCode.Brawler;	
	
	--Monster Play Class
	elseif PlayerClassIs == 52 then 
        PlayerClassIs = L["Warleader"]; 
        PlayerIconCodeIs = resources.MonsterIconCode.Warleader;
	elseif PlayerClassIs == 71 then 
        PlayerClassIs = L["Reaver"]; 
        PlayerIconCodeIs = resources.MonsterIconCode.Reaver;
	elseif PlayerClassIs == 126 then 
        PlayerClassIs = L["Stalker"]; 
        PlayerIconCodeIs = resources.MonsterIconCode.Stalker;
	elseif PlayerClassIs == 127 then 
        PlayerClassIs = L["Weaver"]; 
        PlayerIconCodeIs = resources.MonsterIconCode.Weaver;
	elseif PlayerClassIs == 128 then 
        PlayerClassIs = L["Defiler"]; 
        PlayerIconCodeIs = resources.MonsterIconCode.Defiler;
	elseif PlayerClassIs == 179 then 
        PlayerClassIs = L["Blackarrow"]; 
        PlayerIconCodeIs = resources.MonsterIconCode.Blackarrow; 
	end
	
	PI[ "Icon" ]:SetBackground( PlayerIconCodeIs );
	
	PI["Lvl"]:SetText( Player:GetLevel() );
	PI["Lvl"]:SetSize( PI["Lvl"]:GetTextLength() * NM+1, CTRHeight ); 
	PI["Name"]:SetPosition( PI["Lvl"]:GetLeft() + PI["Lvl"]:GetWidth() + 5, 0 );
	--PI["Name"]:SetText( "OneVeryLongCharacterName" ); --Debug purpose
	PI["Name"]:SetText( Player:GetName() );
	PI["Name"]:SetSize( PI["Name"]:GetTextLength() * TM, CTRHeight ); 

	AjustIcon( "PI" );
end
--**^

function ChangeWearState(value)
	-- Set new wear state in table
	local WearState = PlayerEquipment:GetItem(EquipSlots[value]):GetWearState();
	itemEquip[value].WearState = WearState;

	if WearState == 0 then itemEquip[value].WearStatePts = 0; -- undefined
	elseif WearState == 3 then itemEquip[value].WearStatePts = 0; -- Broken
	elseif WearState == 1 then itemEquip[value].WearStatePts = 20; -- Damaged
	elseif WearState == 4 then itemEquip[value].WearStatePts = 99; -- Worn
	elseif WearState == 2 then itemEquip[value].WearStatePts = 100; -- Pristine
    end

	UpdateDurabilityInfos();
end

--**v Update Player Durability infos on TitanBar v**
function UpdateDurabilityInfos()
	local TDPts = 0;
	for i = 1, 20 do
        TDPts = TDPts + itemEquip[i].WearStatePts;
    end
    if numItems == 0 then TDPts = 100;
    else TDPts = TDPts / numItems; end

	--Change durability icon with %
	local DurIcon = nil;
	if TDPts >= 0 and TDPts <= 33 then DurIcon = 1; end--0x41007e29
	if TDPts >= 34 and TDPts <= 66 then DurIcon = 2; end--0x41007e29
	if TDPts >= 67 and TDPts <= 100 then DurIcon = 3; end--0x41007e28
	DI[ "Icon" ]:SetBackground( resources.Durability[DurIcon] );

	TDPts = string.format( "%.0f", TDPts );
	DI[ "Lbl" ]:SetText( TDPts .. "%" );
	DI[ "Lbl" ]:SetSize( DI[ "Lbl" ]:GetTextLength() * NM + 5, CTRHeight ); 
	AjustIcon( "DI" );
end
--**^
--**v Update equipment infos on TitanBar v**
function UpdateEquipsInfos()
    TotalItemsScore = 0;
    for i = 1,20 do TotalItemsScore = TotalItemsScore + itemEquip[i].Score; end
end
--**^
--**v Update Track Items on TitanBar v**
function UpdateTrackItems()
	AjustIcon( "TI" );
end
--**^
--**v Update Infamy points on TitanBar v**
function UpdateInfamy()
	--Change Rank icon with infamy points
	IF[ "Icon" ]:SetBackground( InfIcon[tonumber(settings.Infamy.K)] );
	
	AjustIcon( "IF" );
end
--**^
--**v Update Vault on TitanBar v**
function UpdateVault()
	AjustIcon( "VT" );
end
--**^
--**v Update Shared Storage on TitanBar v**
function UpdateSharedStorage()
	AjustIcon( "SS" );
end
--**^
--**v Update Bank on TitanBar v**
function UpdateBank()
	AjustIcon( "BK" );
end
--**^
--**v Update Day & Night time on TitanBar v**
function UpdateDayNight()
	local cdate = Turbine.Engine.GetDate();
	local chour = cdate.Hour;
	local cminute = cdate.Minute;
	local ampm = "";
	timer, sDay = nil, nil;

	GetInGameTime();
	local DNLen = 0;
	local DNTime = timer;
	DNLen1 = string.len(DNTime) * TM;
	DNLen = DNLen1;
	
	if _G.DNNextT then --Show next day & night time
		if totalseconds >= 60 then NDNTime = cdminutes .. " min: " .. ntimer;
		else NDNTime = totalseconds .. " sec: " .. ntimer; end

		local DNLen2 = string.len(NDNTime) * TM;
		if DNLen2 > DNLen1 then DNLen = DNLen2; end

		DN[ "Lbl" ]:SetText( DNTime .. "\n" .. NDNTime );
	else
		DN[ "Lbl" ]:SetText( DNTime );
	end

	DN[ "Lbl" ]:SetSize( DNLen, CTRHeight ); --Auto size with text length
	--DN[ "Lbl" ]:SetBackColor( Color["white"] ); -- Debug purpose

	if sDay == "day" then DN[ "Icon" ]:SetBackground( resources.Sun );
        -- Sun in-game icon (0x4101f898 or 0x4101f89b)
	else DN[ "Icon" ]:SetBackground( resources.Moon ); end -- Moon in-game icon

	AjustIcon( "DN" );
end
--**^
--**v Update Reputation on TitanBar v**
function UpdateReputation()
	AjustIcon( "RP" );
end
--**^
--**v Update Player Location on TitanBar v**
function UpdatePlayerLoc( value )
	fontMetric=FontMetric();
    fontMetric:SetFont(_G.TBFont);
    PL[ "Lbl" ]:SetText( value );
	PL[ "Lbl" ]:SetSize( fontMetric:GetTextWidth(value,fontMetric.FontSize), CTRHeight );

	PL[ "Ctr" ]:SetSize( PL[ "Lbl" ]:GetWidth(), CTRHeight );
end
--**^
--**v Update game time on TitanBar v**
function UpdateGameTime(str)
	local cdate = Turbine.Engine.GetDate();
	local chour = cdate.Hour;
	local cminute = cdate.Minute;
	local ampm = "";
	TheTime = nil;
	TextLen = nil;
	
	if cminute < 10 then cminute = "0" .. cminute; end

	if str == "st" then
		if _G.ShowST then
			chour = chour + _G.UserGMT;
			if chour < 0 then
				chour = 24 + chour;
				if chour == 0 then chour = 24; end
			elseif chour == 24 then
				chour = 24 - chour;
			end
		end
		--
	
		-- Convert 24h to 12h format
		if not _G.Clock24h then
			if chour == 12 then ampm = "pm";
			elseif chour >= 13 then chour = chour - 12; ampm = "pm";
			else if chour == 0 then chour = 12; end ampm = "am"; end
		end

		_G.STime = chour .. ":" .. cminute .. ampm;
		TheTime = _G.STime;
		TextLen = string.len(TheTime) * NM;
	elseif str == "gt" then
		--write("Game Time");
		-- Convert 24h to 12h format
		if not _G.Clock24h then
			if chour == 12 then ampm = "pm";
			elseif chour >= 13 then chour = chour - 12; ampm = "pm";
			else if chour == 0 then chour = 12; end ampm = "am"; end
		end

		_G.GTime = chour .. ":" .. cminute .. ampm;
		TheTime = _G.GTime;
		TextLen = string.len(TheTime) * TM;
	elseif str == "bt" then
		--write("Both Time");
		UpdateGameTime("st");
		UpdateGameTime("gt");
		TheTime = L["GTWST"] .. _G.STime;
		TextLen = string.len(TheTime) * NM;
		TheTime = 
            L["GTWST"] .. _G.STime .. "\n" .. L["GTWRT"] .. _G.GTime .. " ";
	end
	
	GT[ "Lbl" ]:SetText( TheTime );
	GT[ "Lbl" ]:SetSize( TextLen, CTRHeight ); --Auto size with text length
	GT[ "Ctr" ]:SetSize( GT[ "Lbl" ]:GetWidth(), CTRHeight );
end
--**^


-- **v Change back color v**
function ChangeColor(tColor)
	if BGWToAll then
		TB["win"]:SetBackColor( tColor );

        -- Check currencies:
        for index, key in ipairs(Currencies) do
            if (Show[key]) then
                local code = CurrencyKeyToCode[key];
                _G[code][ "Ctr" ]:SetBackColor( tColor );
            end
        end

		if ShowBagInfos then BI[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowPlayerInfos then PI[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowEquipInfos then EI[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowDurabilityInfos then DI[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowTrackItems then TI[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowInfamy then IF[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowVault then VT[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowSharedStorage then SS[ "Ctr" ]:SetBackColor( tColor ); end
		--if ShowBank then BK[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowDayNight then DN[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowReputation then RP[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowPlayerLoc then PL[ "Ctr" ]:SetBackColor( tColor ); end
		if ShowGameTime then GT[ "Ctr" ]:SetBackColor( tColor ); end
	else
		if sFrom == "TitanBar" then TB["win"]:SetBackColor( tColor ); end
        if (_G[sFrom]) then _G[sFrom][ "Ctr" ]:SetBackColor( tColor ); end;
	end
end
--**^

function LoadEquipmentTable()
	Slots = {
        "Head", "Chest", "Legs", "Gloves", "Boots", "Shoulder", "Back", 
        "Left Bracelet", "Right Bracelet", "Necklace", "Left Ring", 
        "Right Ring", "Left Earring", "Right Earring", "Pocket", 
        "Primary Weapon", "Secondary Weapon", "Ranged Weapon", "Craft Tool", 
        "Class"};
	EquipSlots = {
		Turbine.Gameplay.Equipment.Head,--						# 1
		Turbine.Gameplay.Equipment.Chest,--						# 2
		Turbine.Gameplay.Equipment.Legs,--						# 3
		Turbine.Gameplay.Equipment.Gloves,--					# 4
		Turbine.Gameplay.Equipment.Boots,--						# 5
		Turbine.Gameplay.Equipment.Shoulder,--				# 6
		Turbine.Gameplay.Equipment.Back,--						# 7
		Turbine.Gameplay.Equipment.Bracelet1,--				# 8
		Turbine.Gameplay.Equipment.Bracelet2,--				# 9
		Turbine.Gameplay.Equipment.Necklace,--				#10
		Turbine.Gameplay.Equipment.Ring1,--						#11
		Turbine.Gameplay.Equipment.Ring2,--						#12
		Turbine.Gameplay.Equipment.Earring1,--				#13
		Turbine.Gameplay.Equipment.Earring2,--				#14
		Turbine.Gameplay.Equipment.Pocket,--					#15
		Turbine.Gameplay.Equipment.PrimaryWeapon,--		#16
		Turbine.Gameplay.Equipment.SecondaryWeapon,--	#17
		Turbine.Gameplay.Equipment.RangedWeapon,--		#18
		Turbine.Gameplay.Equipment.CraftTool,--				#19
		Turbine.Gameplay.Equipment.Class,--						#20
	};
end

function ResetToolTipWin()
	if _G.ToolTipWin ~= nil then
		_G.ToolTipWin:SetVisible( false );
		_G.ToolTipWin = nil;
	end
end

function Player:InCombatChanged(sender, args)
	if TBAutoHide == L["OPAHC"] then AutoHideCtr:SetWantsUpdates( true ); end
end

function AjustIcon(str)	
	--if TBHeight > 30 then CTRHeight = 30; end 
    --Stop ajusting icon size if TitanBar height is > 30px
	--CTRHeight=TBHeight;
	local Y = -1 - ((TBIconSize - CTRHeight) / 2);

    local key = CurrencyCodeToKey[str];

	if str == "WI" then
		WI[ "Icon" ]:SetStretchMode( 1 );
		WI[ "Icon" ]:SetPosition( 0, Y );
		WI[ "Ctr" ]:SetSize( TBIconSize, CTRHeight );
		WI[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		WI[ "Icon" ]:SetStretchMode( 3 );
	elseif str == "MI" then
		local t = "" 
        if _G.STM then t = "T"; end 
        local p = { "G", "S", "C" }; --prefix for Gold, Silver, Copper controls
        local setleft = 0;
        for i = 1,3 do 
            local index = p[i] .. "Lbl" .. t;
            MI[p[i] .. "Ctr"]:SetLeft(setleft);
            local getright = MI[index]:GetLeft() + MI[index]:GetWidth();
            MI[p[i] .. "Icon"]:SetStretchMode(1);
		    MI[p[i] .. "Icon"]:SetPosition(getright - 4, Y + 1 );
		    MI[p[i] .. "Ctr"]:SetSize(getright + TBIconSize, CTRHeight);
            MI[p[i] .. "Icon"]:SetSize( TBIconSize, TBIconSize );
		    MI[p[i] .. "Icon"]:SetStretchMode( 3 );
            setleft = MI[p[i].."Ctr"]:GetLeft() + MI[p[i].."Ctr"]:GetWidth();
        end
		MI[ "Ctr" ]:SetSize( MI["GCtr"]:GetWidth() + MI["SCtr"]:GetWidth() + 
            MI["CCtr"]:GetWidth(), CTRHeight );
    elseif (key) then
        -- Customizing icon positions goes here:
        local customCurrencyWidthOffsets = {
            ["DestinyPoints"] = 0;
            ["Shards"] = -2;
            ["LOTROPoints"] = 2;
        };
        local customCurrencyHeightOffsets = {
            ["LOTROPoints"] = 1;
        };
        local widthOffset = customCurrencyWidthOffsets[key] or 3;
        local heightOffset = customCurrencyHeightOffsets[key] or 0;

        -- Handle generic currencies:
        local table = _G[str];
        table[ "Icon" ]:SetStretchMode( 1 );
        table[ "Icon" ]:SetPosition(
            table[ "Lbl" ]:GetLeft() + table[ "Lbl" ]:GetWidth() + widthOffset,
            Y + heightOffset);
		table[ "Ctr" ]:SetSize( table[ "Icon" ]:GetLeft() + TBIconSize, CTRHeight );
        table[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
        table[ "Icon" ]:SetStretchMode( 3 );
    -- Handle non-currencies:
	elseif str == "BI" then
		BI[ "Icon" ]:SetStretchMode( 1 );
		BI[ "Icon" ]:SetPosition( BI[ "Lbl" ]:GetLeft() + BI[ "Lbl" ]:GetWidth()+3, Y+1 );
		BI[ "Ctr" ]:SetSize( BI[ "Icon" ]:GetLeft() + TBIconSize, CTRHeight );
		BI[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		BI[ "Icon" ]:SetStretchMode( 3 );
	elseif str == "PI" then
		PI[ "Icon" ]:SetStretchMode( 1 );
		PI[ "Icon" ]:SetPosition( PI[ "Name" ]:GetLeft() + PI[ "Name" ]:GetWidth()+3, Y );
		PI[ "Ctr" ]:SetSize( PI[ "Icon" ]:GetLeft() + TBIconSize, CTRHeight );
		PI[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		PI[ "Icon" ]:SetStretchMode( 3 );
	elseif str == "EI" then
		EI[ "Icon" ]:SetStretchMode( 1 );
		EI[ "Icon" ]:SetPosition( EI[ "Lbl" ]:GetLeft() + EI[ "Lbl" ]:GetWidth()+3, Y );
		EI[ "Ctr" ]:SetSize( EI[ "Icon" ]:GetLeft() + TBIconSize, CTRHeight );
		EI[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		EI[ "Icon" ]:SetStretchMode( 3 );
	elseif str == "DI" then
		DI[ "Icon" ]:SetStretchMode( 1 );
		DI[ "Icon" ]:SetPosition( DI[ "Lbl" ]:GetLeft() + DI[ "Lbl" ]:GetWidth(), Y );
		DI[ "Ctr" ]:SetSize( DI[ "Icon" ]:GetLeft() + TBIconSize, CTRHeight );
		DI[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		DI[ "Icon" ]:SetStretchMode( 3 );
	elseif str == "TI" then
		TI[ "Icon" ]:SetStretchMode( 1 );
		TI[ "Icon" ]:SetPosition( 0, Y );
		TI[ "Ctr" ]:SetSize( TBIconSize, CTRHeight );
		TI[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		TI[ "Icon" ]:SetStretchMode( 3 );
	elseif str == "IF" then
		IF[ "Icon" ]:SetStretchMode( 1 );
		IF[ "Icon" ]:SetPosition( 0, Y );
		IF[ "Ctr" ]:SetSize( IF[ "Icon" ]:GetLeft() + TBIconSize, CTRHeight );
		IF[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		IF[ "Icon" ]:SetStretchMode( 3 );
	elseif str == "VT" then
		VT[ "Icon" ]:SetStretchMode( 1 );
		VT[ "Icon" ]:SetPosition( 0, Y );
		VT[ "Ctr" ]:SetSize( TBIconSize, CTRHeight );
		VT[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		VT[ "Icon" ]:SetStretchMode( 3 );
	elseif str == "SS" then
		SS[ "Icon" ]:SetStretchMode( 1 );
		SS[ "Icon" ]:SetPosition( 0, Y );
		SS[ "Ctr" ]:SetSize( TBIconSize, CTRHeight );
		SS[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		SS[ "Icon" ]:SetStretchMode( 3 );
--[[	elseif str == "BK" then
		BK[ "Icon" ]:SetStretchMode( 1 );
		BK[ "Icon" ]:SetPosition( 0, Y );
		BK[ "Ctr" ]:SetSize( TBIconSize, CTRHeight );
		BK[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		BK[ "Icon" ]:SetStretchMode( 3 ); --]]
	elseif str == "DN" then
		DN[ "Icon" ]:SetStretchMode( 1 );
		DN[ "Icon" ]:SetPosition(DN[ "Lbl" ]:GetLeft() + DN[ "Lbl" ]:GetWidth(), Y+1);
		DN[ "Ctr" ]:SetSize( DN[ "Icon" ]:GetLeft() + TBIconSize, CTRHeight );
		DN[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		DN[ "Icon" ]:SetStretchMode( 3 );
	elseif str == "RP" then
		RP[ "Icon" ]:SetStretchMode( 1 );
		RP[ "Icon" ]:SetPosition( 0, Y + 2 );
		RP[ "Ctr" ]:SetSize( TBIconSize, CTRHeight );
		RP[ "Icon" ]:SetSize( TBIconSize, TBIconSize );
		RP[ "Icon" ]:SetStretchMode( 3 );

	end
end

function DecryptMoney( v )
	if ( v == nil ) then
		write( '<rgb=#FF0000>ERROR:</rgb> <rgb=#FF7777>function.lua DecryptMoney() passed a <rgb=#0000FF>nil</rgb>value.  Assuming <rgb=#FF8000>0</rgb>.</rgb>' );
		v = 0;
	end
	local gold = math.floor( v / 100000);
	local silver = math.floor( v / 100) - gold * 1000;
	local copper = v - gold * 100000 - silver * 100;
    return gold, silver, copper;
end


function GetInGameTime()
	local nowtime = Turbine.Engine.GetLocalTime();
	local gametime = Turbine.Engine.GetGameTime();
	local InitDawn =  nowtime - gametime + _G.TS;
	local adjust = (nowtime - (nowtime - gametime + _G.TS))% 11160;
  local darray = {572, 1722, 1067, 1678, 1101, 570, 1679, 539, 1141, 1091};
	local dtarray = {
        L["Dawn"], L["Morning"], L["Noon"], L["Afternoon"], L["Dusk"], 
        L["Gloaming"], L["Evening"], L["Midnight"], L["LateWatches"],
        L["Foredawn"], L["Dawn"]}; 
    if (adjust <= 6140) then sDay = "day" else sDay = "night" end;
    local dapos = 1;
    if (adjust <= 572) then dapos = 1;
	elseif (adjust <= 2294) then dapos = 2;
	elseif (adjust <= 3361) then dapos = 3;
	elseif (adjust <= 5039) then dapos = 4;
	elseif (adjust <= 6140) then dapos = 5;
	elseif (adjust <= 6710) then dapos = 6;
	elseif (adjust <= 8389) then dapos = 7;
	elseif (adjust <= 8928) then dapos = 8;
	elseif (adjust <= 10069) then dapos = 9;
	elseif (adjust <= 11160) then dapos = 10;
	end
    timer = dtarray[dapos];
    ntimer = dtarray[dapos+1];
    local timesincedawn = (nowtime - InitDawn) % 11160;
	
	local tempIGduration = 0;
	for m = 1, dapos do
		tempIGduration = tempIGduration + darray[m]; 
        -- duration from dawn through next IG time
	end
	
	totalseconds = math.floor( tempIGduration - timesincedawn );  
    -- duration left for current IG time is equal to (time from dawn to next 
    -- IG time) minus (time from now since last dawn)
	
	local cdhours = math.floor( totalseconds / 3600 );
	cdminutes = math.floor( 60*( (totalseconds / 3600) - cdhours) );
	local cdseconds = math.floor( 60*(60*( (totalseconds/3600) - cdhours ) 
        - cdminutes) + 0.5 );
end
-- For debug purpose
function ShowTableContent( table )
	if table == nil then write( "Table " .. table .. " is empty!" ); return end

	for k,v in pairs(table) do
		write( "key: "..tostring( k )..", value: "..tostring( v ) );
	end
end

function GetTotalItems( MyTable )
	local counter = 0;
	for k, v in pairs( MyTable ) do counter = counter + 1; end
	return counter;
end

---comment
---@param key string The lookup key for this control.
---@return Color # The resulting Turbine.UI.Color.
function GetBGColor(key)
    local color = Turbine.UI.Color( BC.Alpha[key], BC.Red[key], BC.Green[key], BC.Blue[key] );
    return color;
end