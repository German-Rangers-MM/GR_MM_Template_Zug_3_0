// Palette Typ I - Master
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_zug_typ_10.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

[_box, -1] call ace_cargo_fnc_setSize;
// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;