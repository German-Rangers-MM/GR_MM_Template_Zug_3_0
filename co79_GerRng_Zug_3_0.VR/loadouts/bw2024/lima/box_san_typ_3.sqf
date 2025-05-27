// Kiste Sanität Typ III - Verpflegung
// Aufruf im Editor mit     _nul = execvm "scripts\supplies\box_san_typ_3.sqf";

private _dialog = findDisplay 220901;
if (isNull _dialog) exitWith {};

// Get box class from dialog variable
private _boxClass = "Land_PlasticCase_01_medium_gray_F";


// Get reference object and offset
private _sourceObject = uiNamespace getVariable ["currentSupplyObject", objNull];
private _offset = _sourceObject getVariable ["supply_offset", [0,3,0]];

// Calculate spawn position with offset
private _spawnPos = _sourceObject modelToWorld _offset;

// Create supply box at calculated position
private _supplyBox = createVehicle [_boxClass, _spawnPos, [], 0, "CAN_COLLIDE"];
_supplyBox setDir (getDir _sourceObject);
_supplyBox setPosATL ASLToATL AGLToASL _spawnPos;

_supplyBox allowDamage false;

private _crateContent = [];


for "_i" from 0 to random [14,15,20] do 
{
    _class = selectRandom
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
    _quantity = random [1,4,12];
    _crateContent append [[_class, _quantity]];
};

_crateContent append [["ACE_WaterBottle",16]];

{
    _x params ["_class", "_quantity"];
    _supplyBox addItemCargoGlobal [_class, _quantity];
} forEach _crateContent;

[_supplyBox] spawn {
	//systemchat str _this;
	params ["_supplyBox"];
	sleep 2;
	_supplyBox allowDamage true;
};