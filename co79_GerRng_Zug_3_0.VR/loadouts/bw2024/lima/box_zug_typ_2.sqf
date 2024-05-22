// Kiste Zug Typ II - LMG-Munnition
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_zug_typ_ii.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addMagazineCargoGlobal ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249_Pouch",10];
_box addMagazineCargoGlobal ["CUP_100Rnd_556x45_BetaCMag",10];

// für diese Boxe Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;