// Kiste Zug Typ VII - Anti Tank
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


_box addItemCargoGlobal ["CUP_launch_M72A6",2];
_box addItemCargoGlobal ["CUP_launch_HCPF3",2];
_box addItemCargoGlobal ["CUP_launch_BF3",1];

// für diese Boxe Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;