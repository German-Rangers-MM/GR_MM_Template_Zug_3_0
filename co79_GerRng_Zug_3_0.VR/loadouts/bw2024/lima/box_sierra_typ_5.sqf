// Kiste Sierra Typ V - Ausrüstung
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

_box addItemCargoGlobal ["CUP_NVG_PVS15_black", 8];

_box addItemCargoGlobal ["SmokeShell", 16];
_box addItemCargoGlobal ["SmokeShellGreen", 16];
_box addItemCargoGlobal ["SmokeShellRed", 16];
_box addItemCargoGlobal ["SmokeShellPurple", 6];

_box addItemCargoGlobal ["CUP_HandGrenade_M67", 8];

_box addItemCargoGlobal ["ACE_IR_Strobe_Item", 8];
_box addItemCargoGlobal ["B_IR_Grenade", 16];

_box addItemCargoGlobal ["ACE_HandFlare_Red", 8];
_box addItemCargoGlobal ["ACE_HandFlare_Green", 8];

_box addItemCargoGlobal ["B_UavTerminal", 3];
_box addItemCargoGlobal ["ACE_UAVBattery", 6];

_box addItemCargoGlobal ["ACE_CableTie", 16];
_box addItemCargoGlobal ["ACE_EarPlugs", 8];


_box addItemCargoGlobal ["kat_Caffeine", 16];
_box addItemCargoGlobal ["ACE_elasticBandage", 80];
_box addItemCargoGlobal ["ACE_packingBandage", 80];
_box addItemCargoGlobal ["ACE_epinephrine", 16];
_box addItemCargoGlobal ["ACE_morphine", 16];
_box addItemCargoGlobal ["ACE_salineIV_500", 32];
_box addItemCargoGlobal ["ACE_splint", 16];
_box addItemCargoGlobal ["ACE_tourniquet", 32];
_box addItemCargoGlobal ["kat_chestSeal", 16];
_box addItemCargoGlobal ["kat_EACA", 16];
_box addItemCargoGlobal ["kat_TXA", 16];
_box addItemCargoGlobal ["kat_IO_FAST", 16];
_box addItemCargoGlobal ["kat_IV_16", 16];
_box addItemCargoGlobal ["kat_nitroglycerin", 16];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;