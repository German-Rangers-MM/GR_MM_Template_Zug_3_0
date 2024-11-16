// Kiste Sierra Typ IV - Waffen
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

_box addItemCargoGlobal ["Weapon_srifle_GM6_F", 1];
_box addItemCargoGlobal ["CUP_Weapon_srifle_M107_Base", 1];
_box addItemCargoGlobal ["CUP_Item_muzzle_mfsup_Suppressor_M107_Black", 1];
_box addItemCargoGlobal ["Weapon_srifle_LRR_F", 1];
_box addItemCargoGlobal ["CUP_Item_optic_LeupoldMk4_25x50_LRT", 3];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;