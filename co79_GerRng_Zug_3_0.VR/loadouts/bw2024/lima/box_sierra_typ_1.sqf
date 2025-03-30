// Kiste Sierra Typ I - T1-S
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_sierra_typ_i.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addItemCargoGlobal ["CUP_5Rnd_762x67_G22", 15];
_box addItemCargoGlobal ["CUP_5Rnd_86x70_L115A1", 15];
_box addItemCargoGlobal ["7Rnd_408_Mag", 15];
_box addItemCargoGlobal ["CUP_10Rnd_127x99_M107", 15];
_box addItemCargoGlobal ["ACE_10Rnd_127x99_AMAX_Mag", 15];
_box addItemCargoGlobal ["ACE_10Rnd_127x99_API_Mag", 15];
_box addItemCargoGlobal ["5Rnd_127x108_APDS_Mag", 15];

_box addItemCargoGlobal ["CUP_20Rnd_762x51_HK417", 10];
_box addItemCargoGlobal ["CUP_30Rnd_556x45_PMAG_BLACK", 10];

_box addItemCargoGlobal ["CUP_40Rnd_46x30_MP7", 6];

_box addItemCargoGlobal ["CUP_17Rnd_9x19_glock17", 6];


// für diese Box Gewichtslimit Ignorieren
[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;