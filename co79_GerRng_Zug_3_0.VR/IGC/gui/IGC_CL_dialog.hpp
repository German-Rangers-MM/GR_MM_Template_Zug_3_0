class IGC_CL_dialog {
    idd = 222901;
    movingEnable = 0;

    class controlsBackground {

        class IGC_DialogTitle: IGC_GUI_PRE_DialogTitle {
            text = "Supplypoint-Menu (Verladen)";
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

        // Vehicle

        class IGC_InventoryTitle: IGC_TransportTitle {
            text = "Fahrzeuge";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,28.75,48);
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
            style = 16 + 32;
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,3.25,48);
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,6,48);
            w = IGC_GETW(IGC_WIDTH_VAL,(48/16));
            h = IGC_GETH(IGC_HEIGHT_VAL,(48/32));
        };

        class IGC_VehicleList: IGC_GUI_PRE_ListBox {
            idc = 220912;
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,28.75,48);
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,6,48);
            w = IGC_GETW(IGC_WIDTH_VAL,(48/16));
            h = IGC_GETH(IGC_HEIGHT_VAL,(48/32));
        };

        class IGC_ButtonLoadAce: IGC_GUI_PRE_DialogCross {
            text = "a3\ui_f\data\igui\cfg\simpletasks\types\container_ca.paa";
            x = IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,7.5,16);
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,8.25,48);
            w = IGC_GETW(IGC_WIDTH_VAL,(48/3.25));
            h = IGC_GETH(IGC_HEIGHT_VAL,(48/5));
            colorBackground[] = {0.2, 0.23, 0.18, 1};
            colorActive[] = {0.25, 0.28, 0.23, 1};
            colorFocused[] = {0.2, 0.23, 0.18, 1};
            tooltip = "Einladen (ACE Cargo)";
            action = "[""ace""] call IGC_CL_fnc_loadCargo;";
        };

        class IGC_ButtonLoadViv: IGC_ButtonLoadAce {
            text = "a3\ui_f\data\igui\cfg\simpletasks\types\truck_ca.paa";
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,14.5,48);
            tooltip = "Einladen (Vehicle-in-Vehicle)";
            action = "[""viv""] call IGC_CL_fnc_loadCargo;";
        };

        class IGC_ButtonRefresh: IGC_ButtonLoadAce {
            text = "a3\ui_f\data\map\diary\icons\diarylocatetask_ca.paa";
            y = IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,21.75,48);
            tooltip = "Listen aktualisieren";
            action = "[] call IGC_CL_fnc_updateLists;";
        };

        class IGC_DialogCross: IGC_GUI_PRE_DialogCross {};
    };
};