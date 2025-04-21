params ["_amount"];
private _dialog = findDisplay 221901;
private _ctrlInventoryContent = _dialog displayCtrl 220912;
private _object = uiNamespace getVariable "IGC_CE_SelectedInventory";

private _boxList = _dialog displayCtrl 220911;
private _currentBoxIndex = lbCurSel _boxList;

private _selectedIndex = lbCurSel _ctrlInventoryContent;
if (_selectedIndex == -1) exitWith {hint "No item selected!";};
private _className = _ctrlInventoryContent lbData _selectedIndex;
private _currentQty = _ctrlInventoryContent lbValue _selectedIndex;

// Corrected quantity determination
private _quantity = if (isNil "_amount") then {1} else {_amount};
_quantity = _quantity min _currentQty;

// Get all cargo types
private _itemCargo = getItemCargo _object;
private _weaponCargo = getWeaponCargo _object;
private _magazineCargo = getMagazineCargo _object;
private _backpackCargo = getBackpackCargo _object;

// Adjusted function remains the same
private _fnc_adjustCargo = {
    params ["_cargo", "_index", "_adjustment", "_className"];
    private _classes = +(_cargo select 0);
    private _quantities = +(_cargo select 1);
    
    if (_index >= 0 && {_index < count _classes}) then {
        if ((_classes select _index) == _className) then {
            private _newQty = (_quantities select _index) - _adjustment;
            
            if (_newQty > 0) then {
                _quantities set [_index, _newQty];
            } else {
                _classes deleteAt _index;
                _quantities deleteAt _index;
            };
        };
    };
    [_classes, _quantities]
};

// Process each cargo type
_itemCargo = [_itemCargo, (_itemCargo select 0) find _className, _quantity, _className] call _fnc_adjustCargo;
_weaponCargo = [_weaponCargo, (_weaponCargo select 0) find _className, _quantity, _className] call _fnc_adjustCargo;
_magazineCargo = [_magazineCargo, (_magazineCargo select 0) find _className, _quantity, _className] call _fnc_adjustCargo;
_backpackCargo = [_backpackCargo, (_backpackCargo select 0) find _className, _quantity, _className] call _fnc_adjustCargo;

// Clear and rebuild inventory
clearItemCargoGlobal _object;
clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearBackpackCargoGlobal _object;

// Re-add adjusted cargo
{ _object addItemCargoGlobal [_x, (_itemCargo select 1) select _forEachIndex] } forEach (_itemCargo select 0);
{ _object addWeaponCargoGlobal [_x, (_weaponCargo select 1) select _forEachIndex] } forEach (_weaponCargo select 0);
{ _object addMagazineCargoGlobal [_x, (_magazineCargo select 1) select _forEachIndex] } forEach (_magazineCargo select 0);
{ _object addBackpackCargoGlobal [_x, (_backpackCargo select 1) select _forEachIndex] } forEach (_backpackCargo select 0);

// Refresh the UI
[_dialog displayCtrl 220911, _currentBoxIndex] call IGC_CE_fnc_onInventorySelect;