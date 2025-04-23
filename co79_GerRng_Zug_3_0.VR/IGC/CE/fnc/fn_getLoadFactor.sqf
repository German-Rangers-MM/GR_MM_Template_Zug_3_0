private _dialog = findDisplay 221901;
private _ctlrProgress = _dialog displayCtrl 220915;
private _object = uiNamespace getVariable "IGC_CE_SelectedInventory";

private _load = 0;
private _maxLoad = 0;

if (isNull _object) exitWith {
    _ctlrProgress progressSetPosition 0;
};

// Define cargo processors with type-specific mass handling
private _cargoProcessors = [
    [
        {getItemCargo _this}, 
        {
            params ["_className", "_configPath"];
            private _mass = if (_configPath == "CfgWeapons") then {
                getNumber (configFile >> _configPath >> _className >> "ItemInfo" >> "mass")
            } else {
                getNumber (configFile >> _configPath >> _className >> "mass")
            };
            if (_mass == 0) then {getNumber (configFile >> _configPath >> _className >> "mass")} else {_mass}
        }
    ],
    [
        {getWeaponCargo _this},
        {
            params ["_className", "_configPath"];
            private _mass = getNumber (configFile >> _configPath >> _className >> "WeaponSlotsInfo" >> "mass");
            if (_mass == 0) then {getNumber (configFile >> _configPath >> _className >> "ItemInfo" >> "mass")} else {_mass}
        }
    ],
    [
        {getBackpackCargo _this},
        {getNumber (configFile >> ([_this#0] call IGC_common_fnc_getConfigPath) >> _this#0 >> "mass")}
    ],
    [
        {getMagazineCargo _this},
        {getNumber (configFile >> ([_this#0] call IGC_common_fnc_getConfigPath) >> _this#0 >> "mass")}
    ]
];

{
    _x params ["_cargoFn", "_massFn"];
    private _content = _object call _cargoFn;
    {
        private _className = _x;
        private _quantity = (_content#1) select _forEachIndex;
        private _configPath = [_className] call IGC_common_fnc_getConfigPath;
        
        private _itemMass = [_className, _configPath] call _massFn;
        _load = _load + (_itemMass * _quantity);
    } forEach (_content#0);
} forEach _cargoProcessors;

// Get container capacity
private _objectClass = typeOf _object;
private _objectConfigPath = [_objectClass] call IGC_common_fnc_getConfigPath;
_maxLoad = getNumber (configFile >> _objectConfigPath >> _objectClass >> "maximumLoad");

// Update progress bar with safe limits
_ctlrProgress progressSetPosition (_load / _maxLoad max 0 min 1);