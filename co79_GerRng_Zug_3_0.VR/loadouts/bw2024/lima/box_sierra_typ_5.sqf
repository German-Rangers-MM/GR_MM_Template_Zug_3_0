// Kiste Sierra Typ V - Ausrüstung
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_sierra_typ_v.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addItemCargoGlobal ["ACE_NVG_Gen4_Black", 8];
_box addItemCargoGlobal ["ACE_NVG_Gen4_Black_WP", 8];

_box addItemCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 20];
_box addItemCargoGlobal ["ACE_30Rnd_556x45_Stanag_M995_AP_mag", 20];

_box addItemCargoGlobal ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 20];
_box addItemCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", 20];

_box addItemCargoGlobal ["SmokeShell", 16];
_box addItemCargoGlobal ["SmokeShellGreen", 16];
_box addItemCargoGlobal ["SmokeShellRed", 16];
_box addItemCargoGlobal ["SmokeShellPurple", 6];

_box addItemCargoGlobal ["CUP_HandGrenade_M67", 12];
_box addItemCargoGlobal ["ACE_M84", 24];
_box addItemCargoGlobal ["tsp_flashbang_m84", 24];

_box addItemCargoGlobal ["ACE_IR_Strobe_Item", 8];
_box addItemCargoGlobal ["B_IR_Grenade", 16];

_box addItemCargoGlobal ["ACE_HandFlare_Red", 8];
_box addItemCargoGlobal ["ACE_HandFlare_Green", 8];

_box addItemCargoGlobal ["B_UavTerminal", 2];
_box addItemCargoGlobal ["ACE_UAVBattery", 6];

_box addItemCargoGlobal ["ACE_CableTie", 16];
_box addItemCargoGlobal ["ACE_EarPlugs", 8];

_box addItemCargoGlobal ["ACE_EntrenchingTool",2];
_box addItemCargoGlobal ["ACE_wirecutter",2];

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
_box addItemCargoGlobal ["kat_ncdKit", 20];
_box addItemCargoGlobal ["kat_stethoscope", 2];

// für diese Box Gewichtslimit Ignorieren
[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;