// Kiste EOD Typ IV - Zug
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_eod_typ_4.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/


if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["ace_marker_flags_red",40];
_box addItemCargoGlobal ["ace_marker_flags_white",40];
_box addItemCargoGlobal ["ACE_VMH3",4];
_box addItemCargoGlobal ["ACE_VMM3",4];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;