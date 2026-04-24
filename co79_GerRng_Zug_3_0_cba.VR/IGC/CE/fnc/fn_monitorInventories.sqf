// Remove existing PFH if any
if (!isNil "IGC_CE_inventoryPFH") then {
    [IGC_CE_inventoryPFH] call CBA_fnc_removePerFrameHandler;
};

// Create new PFH
IGC_CE_inventoryPFH = [{
    private _lastUpdate = uiNamespace getVariable ["IGC_CE_lastInventoryCheck", 0];
    if (diag_tickTime - _lastUpdate > 1) then {
        [] call IGC_CE_fnc_updateNearObjects;
        uiNamespace setVariable ["IGC_CE_lastInventoryCheck", diag_tickTime];
    };
}, 0.5] call CBA_fnc_addPerFrameHandler;