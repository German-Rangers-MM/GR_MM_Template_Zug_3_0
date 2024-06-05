// Kiste EOD Typ III - Ausrüstung
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_eod_typ_i.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/


if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["TFAR_anprc152",2];
_box addItemCargoGlobal ["ACE_Chemlight_HiRed",16];
_box addItemCargoGlobal ["ACE_Chemlight_HiWhite",16];
_box addItemCargoGlobal ["ACE_DefusalKit",2];
_box addItemCargoGlobal ["ACE_EarPlugs",4];
_box addItemCargoGlobal ["ACE_EntrenchingTool",1];
_box addItemCargoGlobal ["ACE_Fortify",2];
_box addItemCargoGlobal ["H_Construction_earprot_black_F",2];
_box addItemCargoGlobal ["H_Construction_headset_black_F",2];
_box addItemCargoGlobal ["DemoCharge_Remote_Mag",4];
_box addItemCargoGlobal ["ACE_HandFlare_Red",2];
_box addItemCargoGlobal ["ACE_HandFlare_Yellow",2];
_box addItemCargoGlobal ["ACE_Clacker",2];
_box addItemCargoGlobal ["ACE_Flashlight_Maglite_ML300L",2];
_box addItemCargoGlobal ["ACE_Flashlight_XL50",2];
_box addItemCargoGlobal ["ace_marker_flags_red",16];
_box addItemCargoGlobal ["V_Safety_yellow_F",4];
_box addItemCargoGlobal ["ACE_VMH3",1];
_box addItemCargoGlobal ["ACE_VMM3",1];
_box addItemCargoGlobal ["ACE_SpraypaintRed",2];
_box addItemCargoGlobal ["ACE_wirecutter",1];
_box addItemCargoGlobal ["MineDetector",1];
_box addItemCargoGlobal ["ToolKit",1];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;