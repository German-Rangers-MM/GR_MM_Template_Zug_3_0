// Kiste WaGru Typ VII - Combat Engineering
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_wagru_typ_vii.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["CUP_launch_BF3", 2];
_box addItemCargoGlobal ["ACE_EntrenchingTool", 6];
_box addItemCargoGlobal ["ACE_Fortify", 4];
_box addItemCargoGlobal ["DemoCharge_Remote_Mag", 8];
_box addItemCargoGlobal ["SatchelCharge_Remote_Mag", 2];
_box addItemCargoGlobal ["ACE_Clacker", 2];
_box addItemCargoGlobal ["ace_marker_flags_black", 10];
_box addItemCargoGlobal ["ace_marker_flags_blue", 10];
_box addItemCargoGlobal ["ace_marker_flags_green", 10];
_box addItemCargoGlobal ["ace_marker_flags_red", 10];
_box addItemCargoGlobal ["ACE_SpraypaintBlack", 2];
_box addItemCargoGlobal ["ACE_SpraypaintBlue", 2];
_box addItemCargoGlobal ["ACE_SpraypaintGreen", 2];
_box addItemCargoGlobal ["ACE_SpraypaintRed", 2];
_box addItemCargoGlobal ["ACE_wirecutter", 6];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;