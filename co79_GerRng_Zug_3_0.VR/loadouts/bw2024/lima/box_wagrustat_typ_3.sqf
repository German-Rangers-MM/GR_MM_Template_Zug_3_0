// Kiste WaGruStat Typ III - Mk19 Waffe
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_wagrustat_typ_1.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["GerRng_GMG_Mk19", 1];
_box addItemCargoGlobal ["ace_csw_m3CarryTripodLow", 1];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;