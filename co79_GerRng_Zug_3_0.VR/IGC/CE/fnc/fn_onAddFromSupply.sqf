private _dialog = findDisplay 221901;
private _ctrlSupplyList = _dialog displayCtrl 220913;
private _supplyBox = uiNamespace getVariable "IGC_CE_SelectedInventory";

private _boxList = _dialog displayCtrl 220911;
private _currentBoxIndex = lbCurSel _boxList;
// Get and validate quantity
private _quantity = 1;

private _selectedItemIndex = lbCurSel _ctrlSupplyList;
if (_selectedItemIndex == -1 || isNull _supplyBox) exitWith {
    hint "Select an item and inventory first!";
};

private _class = _ctrlSupplyList lbData _selectedItemIndex;

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

[_dialog displayCtrl 220911, _currentBoxIndex] call IGC_CE_fnc_onInventorySelect;