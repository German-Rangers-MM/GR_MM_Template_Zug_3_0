// Kiste Sierra Typ I - Munition
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

_box addItemCargoGlobal ["CUP_5Rnd_762x67_G22", 7];
_box addItemCargoGlobal ["5Rnd_127x108_Mag", 7];
_box addItemCargoGlobal ["5Rnd_127x108_APDS_Mag", 7];
_box addItemCargoGlobal ["CUP_20Rnd_762x51_HK417", 25];
_box addItemCargoGlobal ["CUP_21Rnd_9x19_M17_Black", 15];

// für diese Boxe Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;