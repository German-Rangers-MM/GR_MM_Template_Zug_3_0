
private _dialog = findDisplay 221901;
private _ctrlInventoryContent = _dialog displayCtrl 220912;
private _object = uiNamespace getVariable "IGC_CE_SelectedInventory";

private _boxList = _dialog displayCtrl 220911;
private _currentBoxIndex = lbCurSel _boxList;

// Clear inventory
clearItemCargoGlobal _object;
clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearBackpackCargoGlobal _object;

[_dialog displayCtrl 220911, _currentBoxIndex] call IGC_CE_fnc_onInventorySelect;