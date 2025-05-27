<<<<<<< Updated upstream
// Kiste Zug Typ III - Unterlaufgranaten
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_zug_typ_3.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addMagazineCargoGlobal ["CUP_1Rnd_HE_M203",20];
_box addMagazineCargoGlobal ["CUP_1Rnd_HEDP_M203",20];
_box addMagazineCargoGlobal ["UGL_FlareWhite_F",10];
_box addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",5];
_box addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",15];
_box addMagazineCargoGlobal ["CUP_1Rnd_StarCluster_Red_M203",4];
_box addMagazineCargoGlobal ["UGL_FlareCIR_F",6];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;
=======
[
    "Zug Typ 3 - LMG-Munition",
    "ACE_Box_82mm_Mo_HE",
    ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",16],
    ["CUP_100Rnd_556x45_BetaCMag",5]
];
>>>>>>> Stashed changes
