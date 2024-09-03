// Kiste Zug Typ IV - Granaten
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_zug_typ_4.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addMagazineCargoGlobal ["SmokeShell",30];
_box addMagazineCargoGlobal ["SmokeShellGreen",10];
_box addMagazineCargoGlobal ["SmokeShellRed",10];
_box addMagazineCargoGlobal ["CUP_HandGrenade_M67",30];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;
