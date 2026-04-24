params ["_targetDialog"];

private _currentObject = uiNamespace getVariable "currentSupplyObject";

private _radius = _currentObject getVariable "supply_radius";
// Close current dialog
closeDialog 0;

// Initialize new dialog


[
    {
        params["_targetDialog", "_currentObject", "_radius"];
        switch _targetDialog do {
            case "IGC_CF_dialog": {[_currentObject] call IGC_CF_fnc_openDialog};

            case "IGC_CE_dialog": {[_currentObject, _radius] call IGC_CE_fnc_initCrateEditor};

            case "IGC_CL_dialog": {[_currentObject, _radius] call IGC_CL_fnc_initCrateLoader};
        };
    },
    [_targetDialog, _currentObject, _radius], 
    0.05
] call CBA_fnc_waitAndExecute;
    