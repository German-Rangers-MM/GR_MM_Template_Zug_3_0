/*
    Author: Your Name
    Description: Crate loading status display with duplicate counting and order preservation
    Parameters:
        0: Array - Array of [object, boolean] pairs
    Returns: Nothing
*/

params ["_inputArray"];

private _loaded = [];
private _notLoaded = [];

// Separate objects into loaded and not loaded arrays
{
    _x params ["_obj", "_isLoaded"];
    if (isNull _obj) then { continue };
    if (_isLoaded) then {
        _loaded pushBack _obj;
    } else {
        _notLoaded pushBack _obj;
    };
} forEach _inputArray;

// Display name retrieval with fallbacks
private _fnc_getDisplayName = {
    params ["_obj"];
    private _class = typeOf _obj;
    private _displayName = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
    if (_displayName == "") then { _displayName = _class };
    private _customName = _obj getVariable ["ACE_cargo_customName", ""];
    if (_customName != "") then {_displayName = _customName;};
    _displayName
};

// Protected name retrieval with error handling
private _getNames = {
    params ["_objects"];
    private _names = [];
    {
        try {
            _names pushBack ([_x] call _fnc_getDisplayName);
        } catch {
            _names pushBack ("[Invalid Object]");
        };
    } forEach _objects;
    _names
};

// Fixed counting function
private _fnc_countNames = {
    params [["_names", [], [[]]]];
    if (_names isEqualTo []) exitWith {[]};
    
    private _counted = [];
    private _orderPreserved = [];
    
    {
        private _name = _x;
        private _index = _counted findIf { _x select 1 == _name };
        
        if (_index == -1) then {
            _counted pushBack [1, _name];
            _orderPreserved pushBack _name;
        } else {
            _counted set [_index, [(_counted select _index select 0) + 1, _name]];
        };
    } forEach _names;
    
    // Fixed rebuild section
    private _result = [];
    {
        private _currentName = _x;
        private _index = _counted findIf { _x select 1 == _currentName };
        
        if (_index != -1) then {
            private _count = _counted select _index select 0;
            _result pushBack (
                if (_count > 1) then { 
                    format ["%1 x %2", _count, _currentName] 
                } else { 
                    _currentName 
                }
            );
            _counted deleteAt _index;
        };
    } forEach _orderPreserved;
    
    _result
};

// Process names with counting
private _loadedNames = [[_loaded] call _getNames] call _fnc_countNames;
private _notLoadedNames = [[_notLoaded] call _getNames] call _fnc_countNames;

// Build message components
private _loadedPart = "";
if (_loadedNames isNotEqualTo []) then {
    _loadedPart = "Crates loaded:\n" + (_loadedNames joinString "\n");
};

private _notLoadedPart = "";
if (_notLoadedNames isNotEqualTo []) then {
    _notLoadedPart = "Crates not loaded:\n" + (_notLoadedNames joinString "\n");
};

// Combine and display final message
private _message = [_loadedPart, _notLoadedPart] joinString "\n\n";
if (_message == "\n\n") then { _message = "No crates processed"; };
hint _message;