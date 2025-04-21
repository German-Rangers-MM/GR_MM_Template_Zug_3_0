params ["_amount"];

// Get dialog controls
private _dialog = findDisplay 220901;
private _ctrlInventory = _dialog displayCtrl 220912;  // Second listbox

// Check for valid selection
private _inventoryIndex = lbCurSel _ctrlInventory;
if (_inventoryIndex == -1) exitWith { hint "Select an item from the inventory!" };

// Parse item data
private _data = parseSimpleArray (_ctrlInventory lbData _inventoryIndex);
if (count _data != 2) exitWith { hint "Invalid item data!" };

// Extract values
private _itemClass = _data select 0;
private _currentQuantity = _data select 1;
private _displayName = (_ctrlInventory lbText _inventoryIndex) splitString "x" select 1;
_displayName = trim _displayName;

_amount = _amount * -1;

// Calculate new quantity
private _newQuantity = (_currentQuantity - _amount) max 0;

// Update or remove entry
if (_newQuantity > 0) then {
    // Update existing entry
    _ctrlInventory lbSetText [_inventoryIndex, format["%1x %2", _newQuantity, _displayName]];
    _ctrlInventory lbSetData [_inventoryIndex, str([_itemClass, _newQuantity])];
} else {
    // Remove entry completely
    _ctrlInventory lbDelete _inventoryIndex;
};

