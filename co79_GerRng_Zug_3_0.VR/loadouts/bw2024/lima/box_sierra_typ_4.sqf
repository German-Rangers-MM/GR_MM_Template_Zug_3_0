// Kiste Sierra Typ IV - T2-ST
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_sierra_typ_iv.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addItemCargoGlobal ["CUP_30Rnd_556x45_PMAG_BLACK", 20];

_box addItemCargoGlobal ["CUP_6Rnd_12Gauge_Pellets_No0_Buck", 15];
_box addItemCargoGlobal ["CUP_6Rnd_12Gauge_Pellets_No1_Buck", 15];
_box addItemCargoGlobal ["CUP_6Rnd_12Gauge_Pellets_No2_Buck", 15];
_box addItemCargoGlobal ["CUP_6Rnd_12Gauge_Slug", 15];

_box addItemCargoGlobal ["CUP_17Rnd_9x19_glock17", 6];

_box addItemCargoGlobal ["tsp_lockpick", 1];
_box addItemCargoGlobal ["ACE_Clacker", 1];
_box addItemCargoGlobal ["ACE_DefusalKit", 1];

_box addItemCargoGlobal ["ACE_M84", 24];
_box addItemCargoGlobal ["tsp_flashbang_m84", 24];

_box addItemCargoGlobal ["tsp_breach_popper_mag", 10];
_box addItemCargoGlobal ["tsp_breach_block_mag", 10];
_box addItemCargoGlobal ["tsp_breach_linear_mag", 10];
_box addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];

// für diese Box Gewichtslimit Ignorieren
[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;