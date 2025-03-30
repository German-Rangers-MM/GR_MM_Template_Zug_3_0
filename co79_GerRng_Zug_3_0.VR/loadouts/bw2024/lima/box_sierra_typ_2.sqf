// Kiste Sierra Typ II - T1-A
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_sierra_typ_ii.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addBackpackCargoGlobal ["B_UAV_01_backpack_F", 1];
_box addBackpackCargoGlobal ["B_UAV_06_backpack_F", 1];

_box addItemCargoGlobal ["ACE_UAVBattery", 6];
_box addItemCargoGlobal ["B_UavTerminal", 2];

_box addItemCargoGlobal ["CUP_20Rnd_762x51_HK417", 20];
_box addItemCargoGlobal ["CUP_30Rnd_556x45_PMAG_BLACK", 20];

_box addItemCargoGlobal ["CUP_17Rnd_9x19_glock17", 6];

// für diese Box Gewichtslimit Ignorieren
[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;