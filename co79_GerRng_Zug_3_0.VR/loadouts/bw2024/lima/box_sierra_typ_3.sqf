// Kiste Sierra Typ III - T2-U
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_sierra_typ_iii.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addItemCargoGlobal ["CUP_200Rnd_TE1_Red_Tracer_556x45_M249_Pouch", 10];

_box addItemCargoGlobal ["CUP_30Rnd_556x45_PMAG_BLACK", 20];

_box addItemCargoGlobal ["CUP_17Rnd_9x19_glock17", 6];

_box addItemCargoGlobal ["SmokeShell", 10];
_box addItemCargoGlobal ["SmokeShellRed", 10];
_box addItemCargoGlobal ["SmokeShellGreen", 10];

// für diese Box Gewichtslimit Ignorieren
[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;