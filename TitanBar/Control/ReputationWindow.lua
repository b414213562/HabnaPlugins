-- ReputationWindow.lua
-- Written by many


function frmReputationWindow()
    faction = nil;
    import(AppClassD.."ComboBox");
    RPDD = HabnaPlugins.TitanBar.Class.ComboBox();

    -- **v Set some window stuff v**
    _G.wRP = Turbine.UI.Lotro.Window();
    _G.wRP:SetSize(480, 640);
    _G.wRP:SetPosition(RPWLeft, RPWTop);
    _G.wRP:SetText(L["MReputation"]);
    _G.wRP:SetVisible(true);
    _G.wRP:SetWantsKeyEvents(true);
    --_G.wRP:SetZOrder(2);
    _G.wRP:Activate();

    _G.wRP.KeyDown = function(sender, args)
        if (args.Action == Turbine.UI.Lotro.Action.Escape) then
            _G.wRP:Close();
        elseif (args.Action == 268435635) or (args.Action == 268435579) then
        -- Hide if F12 key is press or reposition UI
            _G.wRP:SetVisible(not _G.wRP:IsVisible());
        elseif (args.Action == 162) then -- Enter key was pressed
            RPbutSave.Click(sender, args);
        end
    end

    _G.wRP.MouseDown = function(sender, args)
        if (args.Button == Turbine.UI.MouseButton.Left) then 
            dragging = true; 
        end
    end

    _G.wRP.MouseMove = function(sender, args)
        if dragging then if RPDD.dropped then RPDD:CloseDropDown(); end end
    end

    _G.wRP.MouseUp = function(sender, args)
        dragging = false;
        settings.Reputation.L = string.format("%.0f", _G.wRP:GetLeft());
        settings.Reputation.T = string.format("%.0f", _G.wRP:GetTop());
        RPWLeft, RPWTop = _G.wRP:GetPosition();
        SaveSettings(false);
    end

    _G.wRP.Closing = function(sender, args)
        RPDD.dropDownWindow:SetVisible(false);
        _G.wRP:SetWantsKeyEvents(false);
        _G.wRP = nil;
        _G.frmRP = nil;
    end
    -- **^
   

    local RPlbltext = Turbine.UI.Label();
    RPlbltext:SetParent(_G.wRP);
    RPlbltext:SetText(L["RPt"]);
    RPlbltext:SetPosition(20, 35);
    RPlbltext:SetSize(_G.wRP:GetWidth() - 40 , 35);
    RPlbltext:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
    RPlbltext:SetForeColor(Color["green"]);

    local RPFilterlbl = Turbine.UI.Label();
    RPFilterlbl:SetParent(_G.wRP);
    RPFilterlbl:SetSize(60,20);
    RPFilterlbl:SetPosition(20,75);
    RPFilterlbl:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
    RPFilterlbl:SetText("Search:");
    local RPFiltertxt = Turbine.UI.Lotro.TextBox();
    RPFiltertxt:SetParent(_G.wRP);
    RPFiltertxt:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    RPFiltertxt:SetMultiline(false);
    RPFiltertxt:SetPosition(80,75);
    RPFiltertxt:SetSize(_G.wRP:GetWidth() - 120, 20);
    RPFiltertxt.Text = "";
    RPFiltertxt.TextChanged = function()
        if RPFiltertxt.Text ~= RPFiltertxt:GetText() then
            RPFiltertxt.Text = RPFiltertxt:GetText();
            RPFilter(RPFiltertxt.Text);
        end
    end

    function RPFilter()
        filterText = string.lower(RPFiltertxt.Text);
        for i=1,RPListBox:GetItemCount() do
            local row = RPListBox:GetItem(i);
            if string.find(string.lower(row.repLbl:GetText()),filterText) == nil then
                row:SetHeight(0);
            else
                row:SetHeight(20);
            end
        end
    end

--[[-- Add a checkbox for people to be able to hide all factions that reach max 
    -- reputation (then reshow if they loose rep)
    RPPHMaxCtr = Turbine.UI.Lotro.CheckBox();
    RPPHMaxCtr:SetParent(_G.wRP);
    RPPHMaxCtr:SetText(L["RPPHMaxHide"]);
    RPPHMaxCtr:SetSize(_G.wRP:GetWidth() - 10, 20);
    RPPHMaxCtr:SetPosition(45, 65);
    RPPHMaxCtr:SetFont(Turbine.UI.Lotro.Font.TrajanPro16);
    RPPHMaxCtr:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
    RPPHMaxCtr:SetForeColor(Color["yellow"]);
    RPPHMaxCtr:SetChecked(HideMaxReps);

    RPPHMaxCtr.CheckedChanged = function(sender, args)
        HideMaxReps = RPPHMaxCtr:IsChecked();
            write("Hide maxed out reps: "..tostring(HideMaxReps));
        SaveSettings();
    end
--]]

    -- **v Set the reputation listbox v**
    RPListBox = Turbine.UI.ListBox();
    RPListBox:SetParent(_G.wRP);
    RPListBox:SetZOrder(1);
    RPListBox:SetPosition(20, 115);
    RPListBox:SetSize(_G.wRP:GetWidth() - 40, _G.wRP:GetHeight() - 130);
    RPListBox:SetMaxItemsPerLine(1);
    RPListBox:SetOrientation(Turbine.UI.Orientation.Horizontal);
    --RPListBox:SetBackColor(Color["red"]); --debug purpose
    -- **^
    -- **v Set the listbox scrollbar v**
    RPListBoxScrollBar = Turbine.UI.Lotro.ScrollBar();
    RPListBoxScrollBar:SetParent(RPListBox);
    RPListBoxScrollBar:SetZOrder(1);
    RPListBoxScrollBar:SetOrientation(Turbine.UI.Orientation.Vertical);
    RPListBox:SetVerticalScrollBar(RPListBoxScrollBar);
    RPListBoxScrollBar:SetPosition(RPListBox:GetWidth() - 10, 0);
    RPListBoxScrollBar:SetSize(12, RPListBox:GetHeight());
    -- **^

    RPWCtr = Turbine.UI.Control();
    RPWCtr:SetParent(_G.wRP);
    RPWCtr:SetPosition(RPListBox:GetLeft(), RPListBox:GetTop());
    RPWCtr:SetSize(RPListBox:GetWidth(), RPListBox:GetHeight());
    RPWCtr:SetZOrder(0);
    RPWCtr:SetVisible(false);
    RPWCtr:SetBlendMode(5);
    RPWCtr:SetBackground(resources.Reputation.BGWindow);

    RPWCtr.MouseClick = function(sender, args)
        if (args.Button == Turbine.UI.MouseButton.Right) then
            RPDD.Cleanup();
            RPDD:ClearSelection();
            RPWCtr:SetVisible(false);
            RPWCtr:SetZOrder(0);
        end
    end

    RPlblFN = Turbine.UI.Label(); -- Faction Name label
    RPlblFN:SetParent(RPWCtr);
    RPlblFN:SetPosition(0, 120);
    RPlblFN:SetSize(RPWCtr:GetWidth(), 15);
    RPlblFN:SetFont(Turbine.UI.Lotro.Font.TrajanPro16);
    RPlblFN:SetFontStyle(Turbine.UI.FontStyle.Outline);
    RPlblFN:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
    RPlblFN:SetForeColor(Color["rustedgold"]);

    RPlblRank = Turbine.UI.Label(); -- Rank label
    RPlblRank:SetParent(RPWCtr);
    RPlblRank:SetFont(Turbine.UI.Lotro.Font.TrajanPro16);
    RPlblRank:SetPosition(
        RPlblFN:GetLeft() + 100, RPlblFN:GetTop() + RPlblFN:GetHeight() + 10);
    RPlblRank:SetText(L["IFCR"]);
    RPlblRank:SetSize(RPlblRank:GetTextLength() * 9, 15); 
    RPlblRank:SetForeColor(Color["rustedgold"]);
    RPlblRank:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);

    -- **v Create drop down box v**
    RPDD:SetParent(RPWCtr);
    RPDD:SetSize(159, 19);
    RPDD:SetPosition(
        RPlblRank:GetLeft() + RPlblRank:GetWidth() + 5, RPlblRank:GetTop());
    RPDD.dropDownWindow:SetParent(RPWCtr);
    RPDD.dropDownWindow:SetPosition(
        RPDD:GetLeft(), RPDD:GetTop() + RPDD:GetHeight() + 2);
    -- **^

    RPlblTotal = Turbine.UI.Label();
    RPlblTotal:SetParent(RPWCtr);
    RPlblTotal:SetPosition(
        RPlblRank:GetLeft() + 10,
        RPlblRank:GetTop() + RPlblRank:GetHeight() + 10);
    RPlblTotal:SetFont(Turbine.UI.Lotro.Font.TrajanPro16);
    RPlblTotal:SetText(L["MIWTotal"]);
    RPlblTotal:SetSize(RPlblTotal:GetTextLength() * 9, 15); 
    RPlblTotal:SetForeColor(Color["rustedgold"]);
    RPlblTotal:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);

    RPtxtTotal = Turbine.UI.Lotro.TextBox();
    RPtxtTotal:SetParent(RPWCtr);
    RPtxtTotal:SetPosition( 
        RPlblTotal:GetLeft() + RPlblTotal:GetWidth() + 5, 
        RPlblTotal:GetTop() - 2);
    RPtxtTotal:SetFont(Turbine.UI.Lotro.Font.TrajanPro14);
    RPtxtTotal:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
    RPtxtTotal:SetSize(90, 20);
    RPtxtTotal:SetMultiline(false);
    if PlayerAlign == 2 then RPtxtTotal:SetBackColor(Color["red"]); end

    RPtxtTotal.FocusGained = function(sender, args)
        RPtxtTotal:SelectAll();
        RPtxtTotal:SetWantsUpdates(true);
    end

    RPtxtTotal.FocusLost = function(sender, args)
        RPtxtTotal:SetWantsUpdates(false);
    end

    RPtxtTotal.Update = function(sender, args)
        local parsed_text = RPtxtTotal:GetText();
        if tonumber(parsed_text) == nil or 
                string.find(parsed_text,"%.") ~= nil then
            RPtxtTotal:SetText(
                string.sub(parsed_text, 1, string.len(parsed_text) - 1));
            return
        elseif string.len(parsed_text) > 1 and 
                string.sub(parsed_text, 1, 1) == "0" then
            RPtxtTotal:SetText(string.sub(parsed_text, 2));
            return
        end
    end

    RPbutSave = Turbine.UI.Lotro.Button();
    RPbutSave:SetParent(RPWCtr);
    RPbutSave:SetPosition(
        RPtxtTotal:GetLeft() + RPtxtTotal:GetWidth() + 5, 
        RPtxtTotal:GetTop());
    RPbutSave:SetText(L["PWSave"]);
    RPbutSave:SetSize(RPbutSave:GetTextLength() * 10, 15); 
    RPbutSave.Click = function(sender, args)
        if RPtxtTotal:GetText() == "" then
            RPtxtTotal:SetText("0");
            RPtxtTotal:Focus();
            return
        end
        RPtxtTotal:Focus();
        RPWCtr:SetVisible(false);
        RPWCtr:SetZOrder(0);
        for i = 1, #RepTypes[RepType[faction]] do -- number of rank in the drop down box
            if RPCBO[i] == RPDD.label:GetText() then
                PlayerReputation[PN][RepOrder[faction]].R = tostring(i);
            end
        end
        RPDD:ClearSelection();
        PlayerReputation[PN][RepOrder[faction]].P = RPtxtTotal:GetText();
        SavePlayerReputation();
    end
    RefreshRPListBox();
end

function RefreshRPListBox()
    RPListBox:ClearItems();

    for i = 1, #RepOrder do
        --**v Control of all data v**
        local RPCtr = Turbine.UI.Control();
        RPCtr:SetParent(RPListBox);
        RPCtr:SetSize(RPListBox:GetWidth() - 10, 20);
        --**^
        -- Reputation name
        local repLbl = Turbine.UI.Lotro.CheckBox();
        RPCtr.repLbl = repLbl;
        repLbl:SetParent(RPCtr);
        repLbl:SetText(L[RepOrder[i]]);
        repLbl:SetSize(RPListBox:GetWidth() - 10, 20);
        repLbl:SetPosition(0, 0);
        repLbl:SetFont(Turbine.UI.Lotro.Font.TrajanPro16);
        repLbl:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
        repLbl:SetForeColor(Color["nicegold"]);
        repLbl:SetChecked(PlayerReputation[PN][RepOrder[i]].V);
        repLbl.MouseClick = function(sender, args)
            if args.Button == Turbine.UI.MouseButton.Right then
                faction = i;
                RPlblFN:SetText(L[RepOrder[i]]);
                RPtxtTotal:SetText(PlayerReputation[PN][RepOrder[i]].P);
                RPDD:ClearItems();
                RPCBO = {};
                
                rtype = RepType[i];
                for j = 1, #RepTypes[rtype] do
                    rName = RepTypes[rtype][j];
                    table.insert(RPCBO, L[rName]);
                end

                for k,v in pairs(RPCBO) do RPDD:AddItem(v, k) end;
                local tra = tonumber(PlayerReputation[PN][RepOrder[i]].R);
                for k,v in pairs(RPCBO) do
                    if k == tra then RPDD:SetSelection(k); end
                end
                RPWCtr:SetVisible(true);
                RPWCtr:SetZOrder(2);
                RPtxtTotal:Focus();
            end
        end

        repLbl.CheckedChanged = function(sender, args)
            PlayerReputation[PN][RepOrder[i]].V = repLbl:IsChecked();
            SavePlayerReputation();
        end

        RPListBox:AddItem(RPCtr);
    end
    RPFilter();
end
