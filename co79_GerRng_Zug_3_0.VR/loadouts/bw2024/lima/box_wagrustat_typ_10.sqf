// Kiste WaGruStat Typ X - 60mm Mörser & Standard Munition
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_wagrustat_typ_10.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["GerRng_Equipment_GerRng_vz99_carryWeapon", 1];
_box addItemCargoGlobal ["GerRng_Equipment_GerRng_vz99_HE", 8];
_box addItemCargoGlobal ["GerRng_Equipment_GerRng_vz99_smokeWhite", 4];
_box addItemCargoGlobal ["GerRng_Equipment_GerRng_vz99_flare", 2];
_box addBackpackCargoGlobal ["B_AssaultPack_rgr", 1];
_box addBackpackCargoGlobal ["B_Carryall_green_F", 1];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;