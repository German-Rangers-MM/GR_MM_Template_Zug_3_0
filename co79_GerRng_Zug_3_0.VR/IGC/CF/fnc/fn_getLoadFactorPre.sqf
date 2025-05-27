params["_initial","_boxClass","_configContent"];

private _dialog = findDisplay 220901;
private _ctlrProgress = _dialog displayCtrl 220915;

_ctlrProgress progressSetPosition 0;

private _load = 0;
private _maxLoad = 0;

private _itemsToProcess = [];



if(_initial) then {
    _itemsToProcess append _configContent;
} else {
    private _listbox = _dialog displayCtrl 220912; // Secondary listbox ID
    private _itemData = [];
    // Collect all items from listbox
    for "_i" from 0 to (lbSize _listbox - 1) do {
        private _data = _listbox lbData _i;
        if (_data != "") then {
            _itemData pushBack (parseSimpleArray _data);
        };
    };
    _itemsToProcess append _itemData;
};



{
    _x params ["_className", "_quantity"];
    private _configPath = [_className] call IGC_common_fnc_getConfigPath;
    private _mass = 0;

    // Determine appropriate mass calculation based on item type
    switch (_configPath) do {
        // Weapons (CfgWeapons with WeaponSlotsInfo)
        case ("CfgWeapons"): {
            _mass = getNumber (configFile >> "CfgWeapons" >> _className >> "WeaponSlotsInfo" >> "mass");
            if (_mass == 0) then {
                _mass = getNumber (configFile >> "CfgWeapons" >> _className >> "ItemInfo" >> "mass");
            };
            if (_mass == 0) then {
                _mass = getNumber (configFile >> "CfgWeapons" >> _className >> "mass");
            };
        };
        
        // Backpacks (CfgVehicles)
        case ("CfgVehicles"): {
            _mass = getNumber (configFile >> "CfgVehicles" >> _className >> "mass");
        };
        
        // Magazines
        case ("CfgMagazines"): {
            _mass = getNumber (configFile >> "CfgMagazines" >> _className >> "mass");
        };
        
        // Default case for other item types
        default {
            _mass = getNumber (configFile >> _configPath >> _className >> "mass");
        };
    };

    _load = _load + (_mass * _quantity);
} forEach _itemsToProcess;


// Get container capacity
private _objectConfigPath = [_boxClass] call IGC_common_fnc_getConfigPath;
_maxLoad = getNumber (configFile >> _objectConfigPath >> _boxClass >> "maximumLoad");

// Update progress bar with safe limits
_ctlrProgress progressSetPosition (_load / _maxLoad max 0 min 1);