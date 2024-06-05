// Kiste WaGru Typ IV - Titan AT
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


_box addItemCargoGlobal ["launch_I_Titan_short_F", 1];
_box addItemCargoGlobal ["Titan_AT", 4];
_box addItemCargoGlobal ["Titan_AP", 2];
_box addBackpackCargoGlobal ["B_AssaultPack_rgr", 1];
_box addBackpackCargoGlobal ["B_Carryall_green_F", 1];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;