// Kiste EOD Typ II - Ausrüstung
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


_box addItemCargoGlobal ["ACE_Flashlight_Maglite_ML300L",2];
_box addBackpackCargoGlobal ["ACE_TacticalLadder_Pack",2];
_box addItemCargoGlobal ["ACE_UAVBattery",1];
_box addItemCargoGlobal ["B_UavTerminal",2];
_box addBackpackCargoGlobal ["B_UGV_02_Demining_backpack_F",1];
_box addItemCargoGlobal ["ACE_VMH3",1];
_box addItemCargoGlobal ["ACE_VMM3",1];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;