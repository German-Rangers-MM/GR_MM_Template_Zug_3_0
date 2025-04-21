class IGC_CE_dialog {
    idd = 221901;
    movingEnable = 0;

    class controlsBackground {

        class IGC_DialogTitle: IGC_GUI_PRE_DialogTitle {
            text = "Supplypoint-Menu (Kisteneditor)";
            colorBackground[] = {0.2, 0.23, 0.18, 1};
        };

        class IGC_DialogArea: IGC_GUI_PRE_DialogBackground {};

        // Crates

        class IGC_TransportTitle: IGC_GUI_PRE_InlineTitle {
            text = "Kisten";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,0.25,16);
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,0.25,48);
            w = IGC_GETW(IGC_WIDTH_VAL,(16/4.5));
            h = IGC_GETH(IGC_HEIGHT_VAL,16);
        };

        // Inventory

        class IGC_InventoryTitle: IGC_TransportTitle {
            text = "Beladung";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,14.5,48);
        };

        //Supply

        class IGC_SupplyTitle: IGC_TransportTitle {
            text = "Lager";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,34,48);
        };

    };

    class controls {

        class IGC_ButtonHome: IGC_GUI_PRE_DialogCross {
            text = "a3\3den\data\displays\display3den\entitymenu\garage_ca.paa";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,5.75,16);
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,39,48);
            w = IGC_GETW(IGC_WIDTH_VAL,(48/2));
            h = IGC_GETH(IGC_HEIGHT_VAL,(48/4));
            colorBackground[] = {0.2, 0.23, 0.18, 1};
            colorActive[] = {0.25, 0.28, 0.23, 1};
            colorFocused[] = {0.2, 0.23, 0.18, 1};
            tooltip = "Supplypoint";
            action = "[""IGC_CF_dialog""] call IGC_common_fnc_switchDialog";
        };

        class IGC_ButtonEditor: IGC_ButtonHome {
            text = "a3\ui_f\data\igui\cfg\simpletasks\types\rearm_ca.paa";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,6.5,16);
            tooltip = "Kisten bearbeiten";
            action = "[""IGC_CE_dialog""] call IGC_common_fnc_switchDialog";
        };

        class IGC_ButtonLoader: IGC_ButtonHome {
            text = "a3\ui_f\data\igui\cfg\simpletasks\types\container_ca.paa";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,7.25,16);
            tooltip = "Kisten verladen";
            action = "[""IGC_CL_dialog""] call IGC_common_fnc_switchDialog";
        };


        // Crates

        class IGC_CreateSelectionList: IGC_GUI_PRE_ListBox {
            idc = 220911;
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,0.25,16);
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,7,48);
            w = IGC_GETW(IGC_WIDTH_VAL,(16/4.5));
            h = IGC_GETH(IGC_HEIGHT_VAL,(48/32));
            onLBSelChanged = "";
        };

        class IGC_CreateContentList: IGC_CreateSelectionList {
            idc = 220912;
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,4.75,16);
            onLBSelChanged = "";
        };

        class IGC_SupplyList: IGC_CreateSelectionList {
            idc = 220913;
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,11.25,16);
            onLBSelChanged = "";
        };

        class IGC_ComboSupply: IGC_GUI_PRE_Combo {
            idc = 220914;
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,11.25,16);
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,4,48);
            w = IGC_GETW(IGC_WIDTH_VAL,(16/4.5));
            h = IGC_GETH(IGC_HEIGHT_VAL,20);
            colorBackground[] = IGC_COLOR_BACKGROUND_LOWVIS;
            onLBSelChanged = "_this call IGC_CF_fnc_onSupplyCatChange;";
        };


        class IGC_ButtonAddEquipment: IGC_GUI_PRE_InlineButton {
            text = "+ 1";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,10.275,16);
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,12.5,48);
            w = IGC_GETW(IGC_WIDTH_VAL,20);
            h = IGC_GETH(IGC_HEIGHT_VAL,(48/7));
            action = "[1] call IGC_CE_fnc_onAddItem;";
        };

        class IGC_ButtonSubEquipment: IGC_ButtonAddEquipment {
            text = "- 1";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,9.475,16);
            action = "[1] call IGC_CE_fnc_onRemoveItem;";
        };

        class IGC_ButtonAddEquipment5: IGC_ButtonAddEquipment {
            text = "+ 5";
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,19.5,48);
            action = "[5] call IGC_CE_fnc_onAddItem;";
        };

        class IGC_ButtonSubEquipment5: IGC_ButtonAddEquipment5 {
            text = "- 5";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,9.475,16);
            action = "[5] call IGC_CE_fnc_onRemoveItem;";
        };

        class IGC_ButtonAddEquipment10: IGC_ButtonAddEquipment5 {
            text = "+ 10";
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,26.5,48);
            action = "[10] call IGC_CE_fnc_onAddItem;";
        };

        class IGC_ButtonSubEquipment10: IGC_ButtonAddEquipment10 {
            text = "- 10";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,9.475,16);
            action = "[10] call IGC_CE_fnc_onRemoveItem;";
        };

        class IGC_ButtonRemoveEquipment: IGC_ButtonSubEquipment5 {
            text = "LEEREN";
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,34.25,48);
            w = IGC_GETW(IGC_WIDTH_VAL,10);
            h = IGC_GETH(IGC_HEIGHT_VAL,(48/5));
            action = "[] call IGC_CE_fnc_onClearItems;";
        };

        class IGC_ButtonAddFromSupply: IGC_GUI_PRE_DialogCross {
            text = "a3\ui_f\data\igui\cfg\holdactions\holdaction_loaddevice_ca.paa";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,9.5,16);
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,6.25,48);
            w = IGC_GETW(IGC_WIDTH_VAL,(48/4.25));
            h = IGC_GETH(IGC_HEIGHT_VAL,(48/7));
            colorBackground[] = {0.2, 0.23, 0.18, 1};
            colorActive[] = {0.25, 0.28, 0.23, 1};
            colorFocused[] = {0.2, 0.23, 0.18, 1};
            tooltip = "Gegenstand aus dem Lager einfügen";
            action = "[] call IGC_CE_fnc_onAddFromSupply";
        };

        class IGC_DialogCross: IGC_GUI_PRE_DialogCross {};
    };
};