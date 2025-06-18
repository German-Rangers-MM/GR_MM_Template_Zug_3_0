private _dialog = findDisplay 221901;
private _boxList = _dialog displayCtrl 220911;
private _currentBoxIndex = lbCurSel _boxList;

if (_currentBoxIndex == -1) exitWith {hint "No crate selected!";};

private _crate = _boxList lbData _currentBoxIndex;
_crate = objectFromNetId _crate;

if (!isNull _crate) then {
    // Delete from game world
    deleteVehicle _crate;
    
    // Delete from list
    _boxList lbDelete _currentBoxIndex;
    
    lbSort [_boxList, "ASC"];
    
    // Clear selection
    _boxList lbSetCurSel -1;
    
    hint "Crate deleted!";
} else {
    hint "Crate no longer exists!";
};