// Kiste WaGruStat Typ X - 60mm Sondermunition
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_wagrustat_typ_11.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["GerRng_Equipment_GerRng_vz99_HE", 4];
_box addItemCargoGlobal ["GerRng_Equipment_GerRng_vz99_flare_IR", 6];
_box addItemCargoGlobal ["GerRng_Equipment_GerRng_vz99_flare", 6];
_box addItemCargoGlobal ["GerRng_Equipment_GerRng_vz99_smokeWhite", 6];
_box addBackpackCargoGlobal ["B_AssaultPack_rgr", 1];
_box addBackpackCargoGlobal ["B_Carryall_green_F", 1];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;