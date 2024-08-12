// Kiste CBRN Typ III - CBRN-UGV
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_zug_typ_9.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["ace_marker_flags_orange", 10];
_box addItemCargoGlobal ["ACE_UAVBattery", 2];
_box addItemCargoGlobal ["B_UavTerminal", 1];
_box addItemCargoGlobal ["ACE_Chemlight_UltraHiOrange", 20];
_box addBackpackCargoGlobal ["B_UGV_02_Science_backpack_F",1];

// für diese Box Gewichtslimit Ignorieren
[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;