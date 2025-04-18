/*
Usage: [supplypointObject, [x-offset, y-offset, z-offset]] call IGC_CF_fnc_initSupplyPoint;


*/

params ["_object", "_offset"];

// Store offset in object variable
_object setVariable ["supply_offset", _offset, true];

// Create ACE action
private _action = [
    "open_supplypoint",
    "Supplypoint-Menu öffnen",
    "\a3\ui_f\data\igui\cfg\actions\reload_ca.paa",
    { 
        params ["_target", "_player"];
        uiNamespace setVariable ["currentSupplyObject", _target];
        [_this] call IGC_CF_fnc_openDialog;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// Add action to object
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

[_object] call IGC_CF_fnc_limaOldSupplyCreateAce;