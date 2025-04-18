/* 
    Add Items Function
    Description: Adds selected items from third listbox to second listbox
    Parameters: 
        0: SCALAR - Amount to add
*/
params ["_amount"];

// Get dialog controls
private _dialog = findDisplay 220901;
private _ctrlInventory = _dialog displayCtrl 220912;  // Second listbox (inventory)
private _ctrlEquipment = _dialog displayCtrl 220913;  // Third listbox (available items)

// Get selected equipment item
private _equipIndex = lbCurSel _ctrlEquipment;
private _InventoryIndex = lbCurSel _ctrlInventory;
if (_equipIndex == -1 && _InventoryIndex == -1) exitWith { hint "Select an item first!"; };

private _itemClass = _ctrlEquipment lbData _equipIndex;
private _displayName = _ctrlEquipment lbText _equipIndex;

// Find existing item in inventory
private _existingIndex = -1;
private _currentQuantity = 0;
for "_i" from 0 to (lbSize _ctrlInventory - 1) do {
    private _data = parseSimpleArray (_ctrlInventory lbData _i);
    if (count _data == 2 && {(_data select 0) == _itemClass}) then {
        _existingIndex = _i;
        _currentQuantity = _data select 1;
    };
};

// Calculate new quantity
private _newQuantity = _currentQuantity + _amount;
private _newData = str([_itemClass, _newQuantity]);

private _pathToConfig = [_itemClass] call IGC_CF_fnc_getConfigPath;

// Update or add entry
if (_existingIndex != -1) then {
    _ctrlInventory lbSetText [_existingIndex, format["%1x %2", _newQuantity, _displayName]];
    _ctrlInventory lbSetData [_existingIndex, _newData];
    _ctrlInventory lbSetPicture[_existingIndex, getText (configFile >> _pathToConfig >> _itemClass >> "picture")];
    _ctrlInventory lbSetTooltip [_existingIndex, _itemClass];
} else {
    private _index = _ctrlInventory lbAdd format["%1x %2", _newQuantity, _displayName];
    _ctrlInventory lbSetData [_index, _newData];
    _ctrlInventory lbSetPicture[_index, getText (configFile >> _pathToConfig >> _itemClass >> "picture")];
    _ctrlInventory lbSetTooltip [_index, _itemClass];
};

hint format["Added %1 x%2", _displayName, _amount];

