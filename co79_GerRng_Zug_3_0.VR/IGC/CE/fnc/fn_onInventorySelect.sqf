params ["_control", "_selectedIndex"];

private _dialog = ctrlParent _control;
private _ctrlInventoryContent = _dialog displayCtrl 220912;
private _netID = _control lbData _selectedIndex;
private _object = objectFromNetId _netID;

lbClear _ctrlInventoryContent;

private _content = [];
private _classes = [];
private _quantities = [];

_content = getItemCargo _object;
_classes = _content select 0;
_quantities = _content select 1;

// Populate inventory content (items)
{
    private _className = _x;
    private _quantity = _quantities select _forEachIndex;


    private _pathToConfig = [_className] call IGC_common_fnc_getConfigPath;
    private _displayName = getText (configFile >> _pathToConfig >> _className >> "displayName");
    private _index = _ctrlInventoryContent lbAdd format["%1x %2",_quantity, _displayName];
    _ctrlInventoryContent lbSetData [_index, _className];
    _ctrlInventoryContent lbSetValue [_index, _quantity];
    private _icon = getText (configFile >> _pathToConfig >> _className >> "picture");
    if (_icon != "") then {
        _ctrlInventoryContent lbSetPicture [_index, _icon];
    };

} forEach (_classes);

_content = getWeaponCargo _object;
_classes = _content select 0;
_quantities = _content select 1;

// Populate inventory content (weapons)
{
    private _className = _x;
    private _quantity = _quantities select _forEachIndex;


    private _pathToConfig = [_className] call IGC_common_fnc_getConfigPath;
    private _displayName = getText (configFile >> _pathToConfig >> _className >> "displayName");
    private _index = _ctrlInventoryContent lbAdd format["%1x %2",_quantity, _displayName];
    _ctrlInventoryContent lbSetData [_index, _className];
    _ctrlInventoryContent lbSetValue [_index, _quantity];
    private _icon = getText (configFile >> _pathToConfig >> _className >> "picture");
    if (_icon != "") then {
        _ctrlInventoryContent lbSetPicture [_index, _icon];
    };
} forEach (_classes);

_content = getMagazineCargo _object;
_classes = _content select 0;
_quantities = _content select 1;

// Populate inventory content (weapons)
{
    private _className = _x;
    private _quantity = _quantities select _forEachIndex;


    private _pathToConfig = [_className] call IGC_common_fnc_getConfigPath;
    private _displayName = getText (configFile >> _pathToConfig >> _className >> "displayName");
    private _index = _ctrlInventoryContent lbAdd format["%1x %2",_quantity, _displayName];
    _ctrlInventoryContent lbSetData [_index, _className];
    _ctrlInventoryContent lbSetValue [_index, _quantity];
    private _icon = getText (configFile >> _pathToConfig >> _className >> "picture");
    if (_icon != "") then {
        _ctrlInventoryContent lbSetPicture [_index, _icon];
    };
} forEach (_classes);


_content = getBackpackCargo _object;
_classes = _content select 0;
_quantities = _content select 1;

// Populate inventory content (weapons)
{
    private _className = _x;
    private _quantity = _quantities select _forEachIndex;


    private _pathToConfig = [_className] call IGC_common_fnc_getConfigPath;
    private _displayName = getText (configFile >> _pathToConfig >> _className >> "displayName");
    private _index = _ctrlInventoryContent lbAdd format["%1x %2",_quantity, _displayName];
    _ctrlInventoryContent lbSetData [_index, _className];
    _ctrlInventoryContent lbSetValue [_index, _quantity];
    private _icon = getText (configFile >> _pathToConfig >> _className >> "picture");
    if (_icon != "") then {
        _ctrlInventoryContent lbSetPicture [_index, _icon];
    };
} forEach (_classes);




// Store selected inventory
uiNamespace setVariable ["IGC_CE_SelectedInventory", _object];