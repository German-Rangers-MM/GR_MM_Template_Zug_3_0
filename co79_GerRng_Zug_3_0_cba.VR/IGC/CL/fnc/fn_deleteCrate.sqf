private _dialog = findDisplay 222901;
private _listCrates = _dialog displayCtrl 220911;

// Get selected crate netIDs
private _netIDs = [];
{ _netIDs pushBack (_listCrates lbData _x) } forEach (lbSelection _listCrates);

// Convert netIDs to objects
private _objects = [];
{ _objects pushBack (objectFromNetId _x) } forEach _netIDs;

private _deletedObjects = 0;

// Process deletion of objects
{
    deleteVehicle _x;
    _deletedObjects = _deletedObjects + 1;
} forEach _objects;

// Get selected indices and sort in descending order to prevent index shifting
private _selectedIndices = lbSelection _listCrates;
_selectedIndices sort false;

// Delete list entries in reverse order
{
    _listCrates lbDelete _x;
} forEach _selectedIndices;

hint format ["Deleted %1 crates", _deletedObjects];

// Clear selection
_listCrates lbSetCurSel -1;

lbSort [_listCrates, "ASC"];