// Kiste Zug Typ V - Waffen & Zubehör
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


_box addItemCargoGlobal ["U_B_CBRN_Suit_01_Wdl_F", 12];
_box addItemCargoGlobal ["kat_mask_M04", 12];
_box addItemCargoGlobal ["ChemicalDetector_01_watch_F", 5];
_box addItemCargoGlobal ["kat_gasmaskFilter", 36];
_box addItemCargoGlobal ["kat_sealant", 30];
_box addItemCargoGlobal ["kat_atropine", 12];

// für diese Boxe Gewichtslimit Ignorieren
[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;