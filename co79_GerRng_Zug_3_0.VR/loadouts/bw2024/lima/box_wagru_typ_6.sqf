// Kiste WaGru Typ VI - Metis AA
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_zug_typ_vii.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["launch_O_Vorona_green_F", 1];
_box addItemCargoGlobal ["Vorona_HEAT", 4];
_box addBackpackCargoGlobal ["B_AssaultPack_rgr", 1];
_box addBackpackCargoGlobal ["B_Carryall_green_F", 1];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;