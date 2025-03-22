// Kiste WaGruStat Typ IX -  82mm Mörser Sondermunition 
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_wagrustat_typ_9.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["ACE_1Rnd_82mm_Mo_Illum", 4];
_box addItemCargoGlobal ["ACE_1Rnd_82mm_Mo_Smoke", 6];
_box addItemCargoGlobal ["ACE_1Rnd_82mm_Mo_HE_LaserGuided",2];
_box addBackpackCargoGlobal ["B_Carryall_green_F", 1];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;