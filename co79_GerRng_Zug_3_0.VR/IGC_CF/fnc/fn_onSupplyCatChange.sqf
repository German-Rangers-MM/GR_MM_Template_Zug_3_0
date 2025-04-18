params ["_combo", "_index"];

private _dialog = ctrlParent _combo;
private _listbox = _dialog displayCtrl 220913;
private _categoryData = call compile (_combo lbData _index);

lbClear _listbox;

// Get category data
private _categoryData = call compile (_combo lbData _index);
if !(_categoryData isEqualTypeParams ["", []]) exitWith {
    hint "Invalid category data";
    diag_log format ["Bad category data: %1", _categoryData];
};

private _classNames = _categoryData select 1;

// Populate listbox with config-based display names
{
    private _className = _x;
        
    private _pathToConfig = [_className] call IGC_CF_fnc_getConfigPath;

    _displayName = getText (configFile >> _pathToConfig >> _className >> "displayName");
    

    // Fallback to classname if no display name
    if (_displayName == "") then { _displayName = _className };

    private _index = _listbox lbAdd _displayName;
    _listbox lbSetData [_index, _className];
 
        
    // Add icon if available
    private _icon = getText (configFile >> _pathToConfig >> _className >> "picture");
    if (_icon != "") then {
        _listbox lbSetPicture [_index, getText (configFile >> _pathToConfig >> _className >> "picture")];
    };

} forEach _classNames;

hintSilent "";


lbSort _listbox;