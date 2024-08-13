// Kiste Zug Typ VII - Elektronik
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_zug_typ_7.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["Laserbatteries", 2];
_box addItemCargoGlobal ["Laserdesignator_02_ghex_F", 2];
_box addItemCargoGlobal ["ItemAndroid", 2];
_box addItemCargoGlobal ["ItemMicroDAGR", 2];
_box addItemCargoGlobal ["ItemcTab", 2];
_box addItemCargoGlobal ["B_UavTerminal", 2];
_box addItemCargoGlobal ["ACE_HuntIR_monitor", 2];
_box addItemCargoGlobal ["ACE_HuntIR_M203", 10];
_box addItemCargoGlobal ["ACE_UAVBattery", 4];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;