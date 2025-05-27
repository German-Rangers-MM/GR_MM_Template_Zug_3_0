<<<<<<< Updated upstream
// Kiste Zug Typ IV - Granaten
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_zug_typ_4.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addMagazineCargoGlobal ["SmokeShell",30];
_box addMagazineCargoGlobal ["SmokeShellGreen",10];
_box addMagazineCargoGlobal ["SmokeShellRed",10];
_box addMagazineCargoGlobal ["SmokeShellPurple",10];
_box addMagazineCargoGlobal ["CUP_HandGrenade_M67",30];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;
=======
[
    "Zug Typ 4 - Panzerbrechend",
    "ACE_Box_Ammo",
    ["SPS_HKG3PMAG_30Rnd_556x45_B_M995",30],
    ["SPS_HKG3PMAG_30Rnd_556x45_B_Mk318",20],
    ["SPS_20Rnd_762x51mm_M80A1_EPR_Tracer",5],
    ["ACE_20Rnd_762x51_M993_AP_Mag",10],
    ["SPS_20Rnd_762x51mm_M80A1_EPR",10]
];
>>>>>>> Stashed changes
