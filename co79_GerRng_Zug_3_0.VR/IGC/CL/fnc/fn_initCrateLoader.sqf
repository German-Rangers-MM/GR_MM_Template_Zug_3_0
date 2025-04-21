params ["_object", "_radius"];


uiNamespace setVariable ["currentSupplyObject", _object];
uiNamespace setVariable ["currentRadius", _radius];

createDialog "IGC_CL_dialog";

private _dialog = findDisplay 221901;
private _listCrates = _dialog displayCtrl 220911;

private _supplyCategories = _dialog displayCtrl 220912;

[] call IGC_CL_fnc_updateLists;