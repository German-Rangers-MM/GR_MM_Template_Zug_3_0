// Kiste Sanität Typ III - Verpflegung
// Aufruf im Editor mit     _nul = execvm "scripts\supplies\box_san_typ_3.sqf";

if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

for "_i" from 0 to random [14,15,20] do 
{
    _mre = selectRandom
    [
        "ACE_Humanitarian_Ration",
        "ACE_MRE_BeefStew",
        "ACE_MRE_ChickenTikkaMasala",
        "ACE_MRE_ChickenHerbDumplings",
        "ACE_MRE_CreamChickenSoup",
        "ACE_MRE_CreamTomatoSoup",
        "ACE_MRE_LambCurry",
        "ACE_MRE_MeatballsPasta",
        "ACE_MRE_SteakVegetables"
    ];
    _amount = random [1,4,12];
    _box addItemCargoGlobal [_mre, _amount];
};

_box addItemCargoGlobal ["ACE_WaterBottle",16];


// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;