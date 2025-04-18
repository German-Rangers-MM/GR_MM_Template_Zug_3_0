// Create dialog
createDialog "IGC_CF_dialog";
disableSerialization;

// Dialog controls
private _dialog = findDisplay 220901;
private _categories = _dialog displayCtrl 220910;
private _crateList = _dialog displayCtrl 220911;

private _supplyCategories = _dialog displayCtrl 220914;

// Populate combobox
_categories lbAdd "Zug Boxen";
_categories lbSetData [0, "zug"];

_categories lbAdd "WaGru Boxen";
_categories lbSetData [1, "wagru"];

_categories lbAdd "WaGru Boxen Static";
_categories lbSetData [2, "wagruStatic"];

_categories lbAdd "EOD Boxen";
_categories lbSetData [3, "eod"];

_categories lbAdd "CBRN Boxen";
_categories lbSetData [4, "cbrn"];

_categories lbAdd "San Boxen";
_categories lbSetData [5, "san"];

_categories lbAdd "Sierra Boxen";
_categories lbSetData [6, "sierra"];

_categories lbAdd "Transport Boxen (leer)";
_categories lbSetData [7, "supply"];


_categories lbSetCurSel 0;


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


// Initial update
[_categories, 0] call IGC_CF_fnc_updateCrateSelection;