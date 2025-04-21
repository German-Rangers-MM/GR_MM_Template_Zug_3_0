// myDialog_fnc_updateSecondaryListbox.sqf
params ["_primaryListbox", "_index"];

private _dialog = ctrlParent _primaryListbox;
private _secondaryListbox = _dialog displayCtrl 220912;
private _configPath = _primaryListbox lbData _index;

lbClear _secondaryListbox;

private _configContent = [];
if (fileExists _configPath) then {
    _configContent = preprocessFileLineNumbers _configPath;
    _configContent = call compile _configContent;
} else {
    _configContent = ["Config missing", "B_supplyCrate_F", ["Error: File not found", 0]];
};

// Extract box class and store in dialog
private _boxClass = "B_supplyCrate_F";
if (count _configContent > 1) then {
    _boxClass = _configContent select 1;
    uiNamespace setVariable ["currentBoxClass", _boxClass];
    _boxName = _configContent select 0;
    uiNamespace setVariable ["currentBoxname", _boxName];
};



// Remove header and box class from items
_configContent deleteRange [0,2];


// Add items to secondary listbox
{
    _x params ["_className", "_quantity"];
    private _pathToConfig = [_className] call IGC_common_fnc_getConfigPath;
    private _displayName = getText (configFile >> _pathToConfig >> _className >> "displayName");
    private _index = _secondaryListbox lbAdd format["%1x %2", _quantity, _displayName];
    _secondaryListbox lbSetData [_index, str [_className, _quantity]];
    _secondaryListbox lbSetTooltip [_index, _className];
    _secondaryListbox lbSetPicture [_index, getText (configFile >> _pathToConfig >> _className >> "picture")];
} forEach _configContent;

lbSort _secondaryListbox;