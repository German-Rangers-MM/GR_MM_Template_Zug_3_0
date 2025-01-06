// Kiste Sanität Typ I - Standard
// Aufruf im Editor mit 	_nul = execvm "scripts\supplies\box_san_typ_1.sqf";

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addItemCargoGlobal ["ACE_bodyBag",4];
_box addItemCargoGlobal ["ACE_splint",22];
_box addItemCargoGlobal ["kat_chestSeal",14];
_box addItemCargoGlobal ["kat_larynx",36];
_box addItemCargoGlobal ["kat_IO_FAST",9];
_box addItemCargoGlobal ["ACE_elasticBandage",150];
_box addItemCargoGlobal ["ACE_fieldDressing",100];
_box addItemCargoGlobal ["ACE_packingBandage",40];
_box addItemCargoGlobal ["ACE_quikclot",22];
_box addItemCargoGlobal ["ACE_epinephrine",22];
_box addItemCargoGlobal ["ACE_morphine",9];
_box addItemCargoGlobal ["ACE_salineIV_500",90];
_box addItemCargoGlobal ["kat_naloxone",16];
_box addItemCargoGlobal ["kat_IV_16",50];
_box addItemCargoGlobal ["kat_TXA",20];
_box addItemCargoGlobal ["ACE_adenosine",22];
_box addItemCargoGlobal ["kat_norepinephrine",5];
_box addItemCargoGlobal ["kat_nitroglycerin",22];
_box addItemCargoGlobal ["kat_phenylephrine",5];
_box addItemCargoGlobal ["kat_Carbonate",9];
_box addItemCargoGlobal ["kat_EACA",9];
_box addItemCargoGlobal ["kat_ketamine",9];
_box addItemCargoGlobal ["kat_fentanyl",9];
_box addItemCargoGlobal ["kat_nalbuphine",9];
_box addItemCargoGlobal ["kat_ncdKit",40];

_box addItemCargoGlobal ["kat_lorazepam",9];
_box addItemCargoGlobal ["kat_Pulseoximeter",2];
_box addItemCargoGlobal ["kat_AED",2];
_box addItemCargoGlobal ["kat_scalpel",2];

_box addItemCargoGlobal ["kat_oxygenTank_150",5];
_box addItemCargoGlobal ["kat_BVM",2];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;