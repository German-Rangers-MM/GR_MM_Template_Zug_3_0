params ["_object", "_radius"];


uiNamespace setVariable ["currentSupplyObject", _object];
uiNamespace setVariable ["currentRadius", _radius];

createDialog "IGC_CL_dialog";

private _dialog = findDisplay 222901;

[] call IGC_CL_fnc_updateLists;
