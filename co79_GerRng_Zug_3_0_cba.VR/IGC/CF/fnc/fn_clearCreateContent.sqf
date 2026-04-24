private _dialog = findDisplay 220901;
private _secondaryListbox = _dialog displayCtrl 220912;
private _boxClass = uiNamespace getVariable ["currentBoxClass", "B_supplyCrate_F"];

lbClear _secondaryListbox;

[false, _boxClass] call IGC_CF_fnc_getLoadFactorPre;