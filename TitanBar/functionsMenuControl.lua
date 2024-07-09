-- functionsMenuControl.lua
-- Written By Habna
-- Rewritten by many


--**v Functions for the menu of control v**
--**v Unload control v**
function UnloadControl( value )
	if value == "ctr" then
        -- Handle currencies:
        for index, key in ipairs(Currencies) do
            if (Show[key]) then
                if (not DoesNotHaveWhere[key]) then
                    Where[key] = 3;
                end
                ShowHideCurrency(key);
            end
        end

        -- Handle everything else:
        if ShowBagInfos then ShowHideBackpackInfos(); opt_BI:SetChecked( false ); end
        if ShowPlayerInfos then ShowHidePlayerInfos(); opt_PI:SetChecked( false ); end
        if ShowEquipInfos then ShowHideEquipInfos(); opt_EI:SetChecked( false ); end
        if ShowDurabilityInfos then ShowHideDurabilityInfos(); opt_DI:SetChecked( false ); end
        if ShowTrackItems then ShowHideTrackItems(); opt_TI:SetChecked( false ); end
        if ShowInfamy then ShowHideInfamy(); opt_IF:SetChecked( false ); end
        if ShowVault then ShowHideVault(); opt_VT:SetChecked( false ); end
        if ShowSharedStorage then ShowHideSharedStorage(); opt_SS:SetChecked( false ); end
        --if ShowBank then ShowHideBank(); opt_BK:SetChecked( false ); end
        if ShowDayNight then ShowHideDayNight(); opt_DN:SetChecked( false ); end
        if ShowReputation then ShowHideReputation(); opt_RP:SetChecked( false ); end
        if ShowPlayerLoc then ShowHidePlayerLoc(); opt_PL:SetChecked( false ); end
        if ShowGameTime then ShowHideGameTime(); opt_GT:SetChecked( false ); end
    elseif value == "applyToThis" then
        -- Handle currencies:
        local key = CurrencyCodeToKey[_G.sFromCtr];
        if (key) then
            if (not DoesNotHaveWhere[key]) then
                Where[key] = 3;
            end
            ShowHideCurrency(key);
        else
            -- Handle everything else:
            if _G.sFromCtr == "BI" then ShowHideBackpackInfos(); opt_BI:SetChecked( false );
            elseif _G.sFromCtr == "PI" then ShowHidePlayerInfos(); opt_PI:SetChecked( false );
            elseif _G.sFromCtr == "EI" then ShowHideEquipInfos(); opt_EI:SetChecked( false );
            elseif _G.sFromCtr == "DI" then ShowHideDurabilityInfos(); opt_DI:SetChecked( false );
            elseif _G.sFromCtr == "TI" then ShowHideTrackItems(); opt_TI:SetChecked( false );
            elseif _G.sFromCtr == "IF" then ShowHideInfamy(); opt_IF:SetChecked( false );
            elseif _G.sFromCtr == "VT" then ShowHideVault(); opt_VT:SetChecked( false );
            elseif _G.sFromCtr == "SS" then ShowHideSharedStorage(); opt_SS:SetChecked( false );
            --elseif _G.sFromCtr == "BK" then ShowHideBank(); opt_BK:SetChecked( false );
            elseif _G.sFromCtr == "DN" then ShowHideDayNight(); opt_DN:SetChecked( false );
            elseif _G.sFromCtr == "RP" then ShowHideReputation(); opt_RP:SetChecked( false );
            elseif _G.sFromCtr == "PL" then ShowHidePlayerLoc(); opt_PL:SetChecked( false );
            elseif _G.sFromCtr == "GT" then ShowHideGameTime(); opt_GT:SetChecked( false );
            end
        end
    end

	TB["win"].MouseLeave();
end
--**^

--**v Match/Reset/Apply back color v**
function BGColor( cmd, value )
	if cmd == "reset" then
		if GLocale == "en" then tA, tR, tG, tB = 0.3, 0.3, 0.3, 0.3;
		else tA, tR, tG, tB = tonumber("0,3"), tonumber("0,3"), tonumber("0,3"), tonumber("0,3"); end
	elseif cmd == "match" then
		tA, tR, tG, tB = bcAlpha, bcRed, bcGreen, bcBlue;
	elseif cmd == "apply" then
        -- Handle currencies:
        local key = CurrencyCodeToKey[_G.sFromCtr];
        if (key) then
            tA, tR, tG, tB = BC.Alpha[key], BC.Red[key], BC.Green[key], BC.Blue[key];
        else
            -- Handle everything else:
            if _G.sFromCtr == "BI" then tA, tR, tG, tB = BIbcAlpha, BIbcRed, BIbcGreen, BIbcBlue;
            elseif _G.sFromCtr == "PI" then tA, tR, tG, tB = PIbcAlpha, PIbcRed, PIbcGreen, PIbcBlue;
            elseif _G.sFromCtr == "EI" then tA, tR, tG, tB = EIbcAlpha, EIbcRed, EIbcGreen, EIbcBlue;
            elseif _G.sFromCtr == "DI" then tA, tR, tG, tB = DIbcAlpha, DIbcRed, DIbcGreen, DIbcBlue;
            elseif _G.sFromCtr == "TI" then tA, tR, tG, tB = TIbcAlpha, TIbcRed, TIbcGreen, TIbcBlue;
            elseif _G.sFromCtr == "IF" then tA, tR, tG, tB = IFbcAlpha, IFbcRed, IFbcGreen, IFbcBlue;
            elseif _G.sFromCtr == "VT" then tA, tR, tG, tB = VTbcAlpha, VTbcRed, VTbcGreen, VTbcBlue;
            elseif _G.sFromCtr == "SS" then tA, tR, tG, tB = SSbcAlpha, SSbcRed, SSbcGreen, SSbcBlue;
    --		elseif _G.sFromCtr == "BK" then tA, tR, tG, tB = BKbcAlpha, BKbcRed, BKbcGreen, BKbcBlue;
            elseif _G.sFromCtr == "DN" then tA, tR, tG, tB = DNbcAlpha, DNbcRed, DNbcGreen, DNbcBlue;
            elseif _G.sFromCtr == "RP" then tA, tR, tG, tB = RPbcAlpha, RPbcRed, RPbcGreen, RPbcBlue;
            elseif _G.sFromCtr == "PL" then tA, tR, tG, tB = PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue;
            elseif _G.sFromCtr == "GT" then tA, tR, tG, tB = GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue;
            end
        end
	end
	
	if value == "ctr" then
        local color = Turbine.UI.Color( tA, tR, tG, tB );

        -- Handle currencies:
        for index, key in ipairs(Currencies) do
            BC.Alpha[key], BC.Red[key], BC.Green[key], BC.Blue[key] = tA, tR, tG, tB;
            if Show[key] then
                local color = GetBGColor(key);
                local table = _G[CurrencyKeyToCode[key]];
                table[ "Ctr" ]:SetBackColor( color );
            end
        end

        -- Handle everything else:
		BIbcAlpha, BIbcRed, BIbcGreen, BIbcBlue = tA, tR, tG, tB;
		if ShowBagInfos then BI[ "Ctr" ]:SetBackColor( color ); end
		PIbcAlpha, PIbcRed, PIbcGreen, PIbcBlue = tA, tR, tG, tB;
		if ShowPlayerInfos then PI[ "Ctr" ]:SetBackColor( color ); end
		EIbcAlpha, EIbcRed, EIbcGreen, EIbcBlue = tA, tR, tG, tB;
		if ShowEquipInfos then EI[ "Ctr" ]:SetBackColor( color ); end
		DIbcAlpha, DIbcRed, DIbcGreen, DIbcBlue = tA, tR, tG, tB;
		if ShowDurabilityInfos then DI[ "Ctr" ]:SetBackColor( color ); end
		TIbcAlpha, TIbcRed, TIbcGreen, TIbcBlue = tA, tR, tG, tB;
		if ShowTrackItems then TI[ "Ctr" ]:SetBackColor( color ); end
		IFbcAlpha, IFbcRed, IFbcGreen, IFbcBlue = tA, tR, tG, tB;
		if ShowInfamy then IF[ "Ctr" ]:SetBackColor( color ); end
		VTbcAlpha, VTbcRed, VTbcGreen, VTbcBlue = tA, tR, tG, tB;
		if ShowVault then VT[ "Ctr" ]:SetBackColor( color ); end
		SSbcAlpha, SSbcRed, SSbcGreen, SSbcBlue = tA, tR, tG, tB;
		if ShowSharedStorage then SS[ "Ctr" ]:SetBackColor( color ); end
--		BKbcAlpha, BKbcRed, BKbcGreen, BKbcBlue = tA, tR, tG, tB;
--		if ShowBank then BK[ "Ctr" ]:SetBackColor( color ); end
		DNbcAlpha, DNbcRed, DNbcGreen, DNbcBlue = tA, tR, tG, tB;
		if ShowDayNight then DN[ "Ctr" ]:SetBackColor( color ); end
		RPbcAlpha, RPbcRed, RPbcGreen, RPbcBlue = tA, tR, tG, tB;
		if ShowReputation then RP[ "Ctr" ]:SetBackColor( color ); end
		PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue = tA, tR, tG, tB;
		if ShowPlayerLoc then PL[ "Ctr" ]:SetBackColor( color ); end
		GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue = tA, tR, tG, tB;
		if ShowGameTime then GT[ "Ctr" ]:SetBackColor( color );	end
	elseif value == "all" then
		BGColor( cmd, "ctr" );
		BGColor( cmd, "TitanBar" );
	elseif value == "applyToThis" then
        -- Handle currencies:
        local code = _G.sFromCtr;
        local key = CurrencyCodeToKey[_G.sFromCtr];
        if (key) then
            BC.Alpha[key], BC.Red[key], BC.Green[key], BC.Blue[key] = tA, tR, tG, tB;

            local table = _G[code];
            table[ "Ctr" ]:SetBackColor( color );
        else
            -- Handle everything else:
            if _G.sFromCtr == "BI" then
                BIbcAlpha, BIbcRed, BIbcGreen, BIbcBlue = tA, tR, tG, tB;
                BI[ "Ctr" ]:SetBackColor( color );
            elseif _G.sFromCtr == "PI" then
                PIbcAlpha, PIbcRed, PIbcGreen, PIbcBlue = tA, tR, tG, tB;
                PI[ "Ctr" ]:SetBackColor( color );
            elseif _G.sFromCtr == "EI" then
                EIbcAlpha, EIbcRed, EIbcGreen, EIbcBlue = tA, tR, tG, tB;
                EI[ "Ctr" ]:SetBackColor( color );
            elseif _G.sFromCtr == "DI" then
                DIbcAlpha, DIbcRed, DIbcGreen, DIbcBlue = tA, tR, tG, tB;
                DI[ "Ctr" ]:SetBackColor( color );
            elseif _G.sFromCtr == "TI" then
                TIbcAlpha, TIbcRed, TIbcGreen, TIbcBlue = tA, tR, tG, tB;
                TI[ "Ctr" ]:SetBackColor( color );
            elseif _G.sFromCtr == "IF" then
                IFbcAlpha, IFbcRed, IFbcGreen, IFbcBlue = tA, tR, tG, tB;
                IF[ "Ctr" ]:SetBackColor( color );
            elseif _G.sFromCtr == "VT" then
                VTbcAlpha, VTbcRed, VTbcGreen, VTbcBlue = tA, tR, tG, tB;
                VT[ "Ctr" ]:SetBackColor( color );
            elseif _G.sFromCtr == "SS" then
                SSbcAlpha, SSbcRed, SSbcGreen, SSbcBlue = tA, tR, tG, tB;
                SS[ "Ctr" ]:SetBackColor( color );
    --[[		elseif _G.sFromCtr == "BK" then
                BKbcAlpha, BKbcRed, BKbcGreen, BKbcBlue = tA, tR, tG, tB;
                BK[ "Ctr" ]:SetBackColor( color );]]
            elseif _G.sFromCtr == "DN" then
                DNbcAlpha, DNbcRed, DNbcGreen, DNbcBlue = tA, tR, tG, tB;
                DN[ "Ctr" ]:SetBackColor( color );
            elseif _G.sFromCtr == "RP" then
                RPbcAlpha, RPbcRed, RPbcGreen, RPbcBlue = tA, tR, tG, tB;
                RP[ "Ctr" ]:SetBackColor( color );
            elseif _G.sFromCtr == "PL" then
                PLbcAlpha, PLbcRed, PLbcGreen, PLbcBlue = tA, tR, tG, tB;
                PL[ "Ctr" ]:SetBackColor( color );
            elseif _G.sFromCtr == "GT" then
                GTbcAlpha, GTbcRed, GTbcGreen, GTbcBlue = tA, tR, tG, tB;
                GT[ "Ctr" ]:SetBackColor( color );
            end
        end

	elseif value == "TitanBar" then
		bcAlpha, bcRed, bcGreen, bcBlue = tA, tR, tG, tB;
		TB["win"]:SetBackColor( color );
	end

	SaveSettings( true );
	TB["win"].MouseLeave();
end