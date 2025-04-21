params ["_action"];

private _dialog = findDisplay 222901;
if (isNull _dialog) exitWith { systemChat "Dialog not found!"; };

private _listCrates = _dialog displayCtrl 220911;
private _listVehicles = _dialog displayCtrl 220912;

// Get selected crate netIDs
private _netIDs = [];
{ _netIDs pushBack (_listCrates lbData _x) } forEach (lbSelection _listCrates);

// Convert netIDs to objects
private _objects = [];
{ _objects pushBack (objectFromNetId _x) } forEach _netIDs;

// Get selected vehicle
private _currentIndex = lbCurSel _listVehicles;
if (_currentIndex == -1) exitWith { systemChat "No vehicle selected!"; };

private _targetID = _listVehicles lbData _currentIndex;
private _targetObject = objectFromNetId _targetID;
if (isNull _targetObject) exitWith { systemChat "Target vehicle not found!"; };

// Handle the action
switch (toLower _action) do {
    case "ace": {
        { [_x, _targetObject, true] call ace_cargo_fnc_loadItem } forEach _objects;
    };
    case "viv": {
        { _targetObject setVehicleCargo _x } forEach _objects;
    };
    default {
        systemChat format ["Unknown action: %1", _action];
    };
};

[] call IGC_CL_fnc_updateLists;