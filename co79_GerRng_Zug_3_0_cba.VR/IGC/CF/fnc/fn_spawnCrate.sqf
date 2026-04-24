private _dialog = findDisplay 220901;
if (isNull _dialog) exitWith {};

// Get box class from dialog variable
private _boxClass = uiNamespace getVariable ["currentBoxClass", "B_supplyCrate_F"];


private _boxName = uiNamespace getVariable ["currentBoxName", ""];


// Get reference object and offset
private _sourceObject = uiNamespace getVariable ["currentSupplyObject", objNull];
private _offset = _sourceObject getVariable ["supply_offset", [0,3,0]];

// Calculate spawn position with offset
private _spawnPos = _sourceObject modelToWorld _offset;

// Create supply box at calculated position
private _supplyBox = createVehicle [_boxClass, _spawnPos, [], 0, "CAN_COLLIDE"];
_supplyBox setDir (getDir _sourceObject);
_supplyBox setPosATL ASLToATL AGLToASL _spawnPos;


_supplyBox setVariable ["ACE_cargo_customName", _boxName, true];


_supplyBox allowDamage false;

private _listbox = _dialog displayCtrl 220912; // Secondary listbox ID
private _itemData = [];

// Collect all items from listbox
for "_i" from 0 to (lbSize _listbox - 1) do {
    private _data = _listbox lbData _i;
    if (_data != "") then {
        _itemData pushBack (parseSimpleArray _data);
    };
};


// Clear default contents
clearWeaponCargoGlobal _supplyBox;
clearMagazineCargoGlobal _supplyBox;
clearItemCargoGlobal _supplyBox;
clearBackpackCargoGlobal _supplyBox;

// Add items to crate
{
    _x params ["_class", "_quantity"];
    private _pathToConfig = [_class] call IGC_common_fnc_getConfigPath;
    // Add items based on type
    switch (_pathToConfig) do {
        case ("CfgWeapons"): {
            private _isToolOrMedItem = getNumber(configFile >> "CfgWeapons" >> _class >> "ACE_isMedicalItem") + getNumber(configFile >> "CfgWeapons" >> _class >> "ACE_isMedicalItem");
            if (_isToolOrMedItem == 0) then 
            {
                if (_class isKindOf  "Rifle_Base_F" || _class isKindOf  "Pistol_Base_F" || _class isKindOf  "Launcher_Base_F") then {
                    _supplyBox addWeaponCargoGlobal [_class, _quantity];
                } else {
                    _supplyBox addItemCargoGlobal [_class, _quantity];
                };
            } else 
            {
                _supplyBox addItemCargoGlobal [_class, _quantity];
            }
        };
        case ("CfgMagazines"): {
            private _isToolOrMedItem = getNumber(configFile >> "CfgWeapons" >> _class >> "ACE_isMedicalItem") + getNumber(configFile >> "CfgWeapons" >> _class >> "ACE_isMedicalItem");
            if (_isToolOrMedItem == 0) then 
            {
                _supplyBox addMagazineCargoGlobal [_class, _quantity];
            } else 
            {
                _supplyBox addItemCargoGlobal [_class, _quantity];
            }
        };
        case ("CfgVehicles"): {
            _supplyBox addBackpackCargoGlobal [_class, _quantity];
        };
        case ("CfgGlasses"): {
            _supplyBox addItemCargoGlobal [_class, _quantity];
        };
        default {
            systemChat format["[ERROR] Invalid class: %1", _class];
        };
    };
} forEach _itemData;


[] spawn { sleep 0.1; systemChat "Supply box created successfully!"; };
[_supplyBox] spawn {
	//systemchat str _this;
	params ["_supplyBox"];
	sleep 2;
	_supplyBox allowDamage true;
};