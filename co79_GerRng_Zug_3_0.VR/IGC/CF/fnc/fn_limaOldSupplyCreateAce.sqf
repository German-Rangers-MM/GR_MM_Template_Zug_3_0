params ["_object"];


//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						LIMA Supply Point
//
//------------------------------------------------------------------
//------------------------------------------------------------------
		
// Icon für Boxen-deploy
_icon = "a3\ui_f\data\igui\cfg\cursors\iconboardin_ca.paa";
_iconEod = "a3\ui_f\data\igui\cfg\simpletasks\types\mine_ca.paa";
_iconCBRN = "z\ace\addons\medical_gui\data\categories\airway_management.paa";
_iconWaGru = "a3\ui_f\data\gui\rsc\rscdisplayarsenal\secondaryweapon_ca.paa";
_iconWaGruStatic = "a3\ui_f\data\map\vehicleicons\iconcrategrenades_ca.paa";
_iconZug = "a3\ui_f\data\gui\rsc\rscdisplayarsenal\cargomagall_ca.paa";
_iconErsatz = "a3\ui_f\data\igui\cfg\actions\repair_ca.paa";
_iconSan = "a3\ui_f\data\igui\cfg\simpletasks\types\heal_ca.paa";
_iconBodybags = "z\ace\addons\medical_gui\ui\grave.paa";
_iconSierra = "a3\weapons_f\data\ui\icon_sniper_ca.paa";
_iconVerpflegung ="z\ace\addons\field_rations\ui\icon_hud_hungerstatus.paa";


// Lima Supply Point Static & Mobile
{
    // Parent Action für Zug Boxen
    _zugBoxen = ["Zug Boxen","Zug Boxen",_iconZug,{ },{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions"], _zugBoxen] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
        _zug1 = ["Zug1","Zug Typ 1 - Standard 5.56",_icon,{params ["_object"]; [_object,"box_zug_typ_1"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug1] call ace_interact_menu_fnc_addActionToObject;

        _zug2 = ["Zug2","Zug Typ 2 - Standard 7.62",_icon,{params ["_object"]; [_object,"box_zug_typ_2"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug2] call ace_interact_menu_fnc_addActionToObject;

        _zug3 = ["Zug3","Zug Typ 3 - LMG-Munnition",_icon,{params ["_object"]; [_object,"box_zug_typ_3"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug3] call ace_interact_menu_fnc_addActionToObject;

        _zug4 = ["Zug4","Zug Typ 4 - Panzerbrechend",_icon,{params ["_object"]; [_object,"box_zug_typ_4"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug4] call ace_interact_menu_fnc_addActionToObject;

        _zug5 = ["Zug5","Zug Typ 5 - Unterlaufgranaten",_icon,{params ["_object"]; [_object,"box_zug_typ_5"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug5] call ace_interact_menu_fnc_addActionToObject;

        _zug6 = ["Zug6","Zug Typ 6 - Granaten",_icon,{params ["_object"]; [_object,"box_zug_typ_6"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug6] call ace_interact_menu_fnc_addActionToObject;

        _zug7 = ["Zug7","Zug Typ 7 - Sprengmittel",_icon,{params ["_object"]; [_object,"box_zug_typ_7"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug7] call ace_interact_menu_fnc_addActionToObject;

        _zug8 = ["Zug8","Zug Typ 8 - Anti-Tank",_icon,{params ["_object"]; [_object,"box_zug_typ_8"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug8] call ace_interact_menu_fnc_addActionToObject;

        _zug9 = ["Zug9","Zug Typ 9 - Ausrüstung",_icon,{params ["_object"]; [_object,"box_zug_typ_9"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug9] call ace_interact_menu_fnc_addActionToObject;

        _zug10 = ["Zug10","Zug Typ 10 - Elektronik",_icon,{params ["_object"]; [_object,"box_zug_typ_10"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug10] call ace_interact_menu_fnc_addActionToObject;

        _zug11 = ["Zug11","Zug Typ 11 - Munition HK417",_icon,{params ["_object"]; [_object,"box_zug_typ_11"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug11] call ace_interact_menu_fnc_addActionToObject;

        _zug12 = ["Zug12","Zug Typ 12 - Flashbangs",_icon,{params ["_object"]; [_object,"box_zug_typ_11"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug12] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
    // Parent Action für WaGru Boxen
    _waGruBoxen = ["WaGru Boxen","WaGru Boxen",_iconWaGru,{ },{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions"], _waGruBoxen] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
        _wagru1 = ["WaGru1","WaGru Typ 1 - MG3",_icon,{params ["_object"]; [_object,"box_wagru_typ_1"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru1] call ace_interact_menu_fnc_addActionToObject;
                    
        _wagru2 = ["wagru2","WaGru Typ 2 - Mk48",_icon,{params ["_object"]; [_object,"box_wagru_typ_2"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru2] call ace_interact_menu_fnc_addActionToObject;
                    
        _wagru3 = ["wagru3","WaGru Typ 3 - MAAWS",_icon,{params ["_object"]; [_object,"box_wagru_typ_3"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru3] call ace_interact_menu_fnc_addActionToObject;

        _wagru4 = ["wagru4","WaGru Typ 4 - MAAWS Sondermunition",_icon,{params ["_object"]; [_object,"box_wagru_typ_4"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru4] call ace_interact_menu_fnc_addActionToObject;
                    
        _wagru5 = ["wagru4","WaGru Typ 5 - Titan AT",_icon,{params ["_object"]; [_object,"box_wagru_typ_5"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru5] call ace_interact_menu_fnc_addActionToObject;
                    
        _wagru6 = ["wagru6","WaGru Typ 6 - Titan AA",_icon,{params ["_object"]; [_object,"box_wagru_typ_6"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru6] call ace_interact_menu_fnc_addActionToObject;
                    
        _wagru7 = ["wagru7","WaGru Typ 7 - Metis",_icon,{params ["_object"]; [_object,"box_wagru_typ_7"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru7] call ace_interact_menu_fnc_addActionToObject;
        
        _wagru8 = ["wagru8","WaGru Typ 8 - Combat Engineering",_icon,{params ["_object"]; [_object,"box_wagru_typ_8"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru8] call ace_interact_menu_fnc_addActionToObject;

    
    _waGruBoxenStatic = ["WaGru Boxen Static","WaGru Boxen Static",_iconWaGruStatic,{ },{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions"], _waGruBoxenStatic] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
        _wagrustat1 = ["WaGruStat1","WaGruStat Typ 1 - M2 Waffe",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_1"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat1] call ace_interact_menu_fnc_addActionToObject;

        _wagrustat2 = ["WaGruStat2","WaGruStat Typ 2 - M2 Munition",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_2"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat2] call ace_interact_menu_fnc_addActionToObject;

        _wagrustat3 = ["WaGruStat3","WaGruStat Typ 3 - Mk19 Waffe",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_3"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat3] call ace_interact_menu_fnc_addActionToObject;

        _wagrustat4 = ["WaGruStat4","WaGruStat Typ 4 - Mk19 Munition",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_4"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat4] call ace_interact_menu_fnc_addActionToObject;

        _wagrustat5 = ["WaGruStat5","WaGruStat Typ 5 - TOW Waffe",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_5"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat5] call ace_interact_menu_fnc_addActionToObject;

        _wagrustat6 = ["WaGruStat6","WaGruStat Typ 6 - TOW Munition",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_6"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat6] call ace_interact_menu_fnc_addActionToObject;

        _wagrustat7 = ["WaGruStat7","WaGruStat Typ 7 - 82mm Mörser Waffe",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_7"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat7] call ace_interact_menu_fnc_addActionToObject;

        _wagrustat8 = ["WaGruStat8","WaGruStat Typ 8 - 82mm Munition HE",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_8"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat8] call ace_interact_menu_fnc_addActionToObject;

        _wagrustat9 = ["WaGruStat9","WaGruStat Typ 9 - 82mm Sondermunition",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_9"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat9] call ace_interact_menu_fnc_addActionToObject;

        _wagrustat10 = ["WaGruStat10","WaGruStat Typ 10 - 60mm Mörser und Standardmunition",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_10"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat10] call ace_interact_menu_fnc_addActionToObject;

        _wagrustat11 = ["WaGruStat1","WaGruStat Typ 11 - 60mm Sondermunition",_icon,{params ["_object"]; [_object,"box_wagrustat_typ_11"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat11] call ace_interact_menu_fnc_addActionToObject;


        //------------------------------------------------------------------
    // Parent Action für EOD Boxen
    _eodBoxen = ["EOD Boxen","EOD Boxen",_iconEod,{ },{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions"], _eodBoxen] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
        _eod1 = ["EOD1","EOD Typ I - Anzug",_icon,{params ["_object"]; [_object,"box_eod_typ_1"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions","EOD Boxen"], _eod1] call ace_interact_menu_fnc_addActionToObject;	
    
        _eod2 = ["EOD2","EOD Typ II - Drohne",_icon,{params ["_object"]; [_object,"box_eod_typ_2"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions","EOD Boxen"], _eod2] call ace_interact_menu_fnc_addActionToObject;	
    
        _eod3 = ["EOD3","EOD Typ III - Ausrüstung",_icon,{params ["_object"]; [_object,"box_eod_typ_3"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions","EOD Boxen"], _eod3] call ace_interact_menu_fnc_addActionToObject;

        _eod4 = ["EOD3","EOD Typ IV - Zug",_icon,{params ["_object"]; [_object,"box_eod_typ_4"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions","EOD Boxen"], _eod4] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
    // Parent Action für CBRN Boxen
    _cbrnBoxen = ["CBRN Boxen","CBRN Boxen",_iconCBRN,{ },{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions"], _cbrnBoxen] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
        _cbrn1 = ["CBRN1","Typ 1 - CBRN-Schutz",_icon,{params ["_object"]; [_object,"cbrn1"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "CBRN Boxen"], _cbrn1] call ace_interact_menu_fnc_addActionToObject;

        _cbrn2 = ["CBRN2","Typ 2 - CBRN-Erkundung",_icon,{params ["_object"]; [_object,"cbrn2"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "CBRN Boxen"], _cbrn2] call ace_interact_menu_fnc_addActionToObject;

        _cbrn3 = ["CBRN3","Typ 3 - CBRN-UGV",_icon,{params ["_object"]; [_object,"cbrn3"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "CBRN Boxen"], _cbrn3] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
    // Parent Action für San Boxen
    _sanBoxen = ["San Boxen","San Boxen",_iconSan,{ },{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions"], _sanBoxen] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
        _san1 = ["San1","San Typ 1 - SanMat",_icon,{params ["_object"]; [_object,"box_san_typ_1"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "San Boxen"], _san1] call ace_interact_menu_fnc_addActionToObject;	
    
        _san2 = ["San2","San Typ 2 - Leichensäcke",_iconBodybags,{params ["_object"]; [_object,"box_san_typ_2"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "San Boxen"], _san2] call ace_interact_menu_fnc_addActionToObject;	
        /*
        _san3 = ["San3","San Typ 3 - Verpflegung",_iconVerpflegung,{params ["_object"]; [_object,"box_san_typ_3"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "San Boxen"], _san3] call ace_interact_menu_fnc_addActionToObject;
        */
        //------------------------------------------------------------------
    // Parent Action für Ersatzteile
    /*
    _ersatzteile = ["Ersatzteile","Ersatzteile",_iconErsatz,{ },{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions"], _ersatzteile] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
        _ersatzKette = ["ersatzKette","Ersatzkette",_icon,{params ["_object"]; [_object,"ersatzkette"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Ersatzteile"], _ersatzKette] call ace_interact_menu_fnc_addActionToObject;

        _ersatzRad = ["ersatzRad","Ersatzrad",_icon,{params ["_object"]; [_object,"ersatzrad"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", "Ersatzteile"], _ersatzRad] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
    */
    // Parent Action für Sierra
    _Sierra = ["Sierra","Sierra",_iconSierra,{ },{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions"], _Sierra] call ace_interact_menu_fnc_addActionToObject;
        //------------------------------------------------------------------
    _sierra1 = ["Sierra1","Sierra Typ 1- Trupp 1 - S",_icon,{params ["_object"]; [_object,"box_sierra_typ_1"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions", "Sierra"], _sierra1] call ace_interact_menu_fnc_addActionToObject;

    _sierra2 = ["Sierra2","Sierra Typ 2 - Trupp 1 - A",_icon,{params ["_object"]; [_object,"box_sierra_typ_2"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions", "Sierra"], _sierra2] call ace_interact_menu_fnc_addActionToObject;

    _sierra3 = ["Sierra3","Sierra Typ 3 - Trupp 2 - U",_icon,{params ["_object"]; [_object,"box_sierra_typ_3"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions", "Sierra"], _sierra3] call ace_interact_menu_fnc_addActionToObject;

    _sierra4 = ["Sierra4","Sierra Typ 4 - Trupp 2 - ST",_icon,{params ["_object"]; [_object,"box_sierra_typ_4"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions", "Sierra"], _sierra4] call ace_interact_menu_fnc_addActionToObject;

    _sierra5 = ["Sierra5","Sierra Typ 5 - Ausrüstung",_icon,{params ["_object"]; [_object,"box_sierra_typ_5"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions", "Sierra"], _sierra5] call ace_interact_menu_fnc_addActionToObject;
    //------------------------------------------------------------------

    _supply = ["Supply","Transport Box (leer)",_icon,{params ["_object"]; [_object,"box_supply"] call IGC_CF_fnc_limaOldSupplySpawnCrate},{true}] call ace_interact_menu_fnc_createAction;
    [_x, 0, ["ACE_MainActions"], _supply] call ace_interact_menu_fnc_addActionToObject;


    
} forEach [_object];		
