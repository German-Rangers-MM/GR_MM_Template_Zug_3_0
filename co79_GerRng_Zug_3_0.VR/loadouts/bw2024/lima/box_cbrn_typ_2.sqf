// Kiste CBRN Typ II - CBRN Erkundung
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_zug_typ_9.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["U_B_CBRN_Suit_01_Wdl_F", 4];
_box addBackpackCargoGlobal ["B_CombinationUnitRespirator_01_F",4];
_box addItemCargoGlobal ["kat_mask_M04", 4];
_box addItemCargoGlobal ["G_AirPurifyingRespirator_01_F", 4];
_box addItemCargoGlobal ["ChemicalDetector_01_watch_F", 4];
_box addItemCargoGlobal ["kat_gasmaskFilter", 16];
_box addItemCargoGlobal ["kat_sealant", 16];
_box addItemCargoGlobal ["kat_atropine", 12];
_box addItemCargoGlobal ["ace_marker_flags_orange", 10];
_box addItemCargoGlobal ["ACE_Chemlight_UltraHiOrange", 20];

// für diese Box Gewichtslimit Ignorieren
[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;