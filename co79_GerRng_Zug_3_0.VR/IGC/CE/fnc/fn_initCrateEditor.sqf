
params ["_object", "_radius"];


uiNamespace setVariable ["currentSupplyObject", _object];
uiNamespace setVariable ["currentRadius", _radius];

createDialog "IGC_CE_dialog";

private _dialog = findDisplay 221901;
private _listInventories = _dialog displayCtrl 220911;

private _supplyCategories = _dialog displayCtrl 220914;

private _arsenalPath = limapfad + "limaSupplyPoint_Itemlist.sqf";
if !(fileExists _arsenalPath) exitWith {
    systemChat "Arsenal config file missing!";
    diag_log "ERROR: Arsenal config file not found!";
};

private _arsenalData = call compile preprocessFileLineNumbers _arsenalPath;
if !(_arsenalData isEqualType []) exitWith {
    systemChat "Invalid arsenal config format!";
    diag_log "ERROR: Arsenal data is not an array!";
};

// Store in UI namespace with validation
uiNamespace setVariable ["arsenalData", _arsenalData];
diag_log format["Arsenal Data Loaded: %1 categories", count _arsenalData];

// Get combo reference
private _categoryCombo = _dialog displayCtrl 220914;
lbClear _categoryCombo;

// Populate categories with validation
if (_arsenalData isEqualTo []) exitWith {
    systemChat "Arsenal config is empty!";
    diag_log "ERROR: Arsenal config contains no categories!";
};

{
    _x params ["_categoryName", "_classNames"];
    private _index = _categoryCombo lbAdd _categoryName;
    _categoryCombo lbSetData [_index, str(_x)]; // Store entire category array
} forEach (uiNamespace getVariable "arsenalData");

// Set initial selection and trigger update
_categoryCombo lbSetCurSel 0;
[_categoryCombo, 0] call IGC_CF_fnc_onSupplyCatChange;


_listInventories ctrlAddEventHandler ["LBSelChanged", {
    _this call IGC_CE_fnc_onInventorySelect;
}];

[] call IGC_CE_fnc_updateNearObjects;

[] call IGC_CE_monitorInventories;

