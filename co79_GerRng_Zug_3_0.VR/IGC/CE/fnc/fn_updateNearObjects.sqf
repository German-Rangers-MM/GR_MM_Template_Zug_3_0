private _dialog = findDisplay 221901;
private _listInventories = _dialog displayCtrl 220911;
private _radius = uiNamespace getVariable "currentRadius";
private _center = uiNamespace getVariable "currentSupplyObject";

lbClear _listInventories;


{
    if (_x distance _center <= _radius && {!(_x isKindOf "Man") && ((_x isKindOf "ReammoBox_F") || (_x isKindOf "ThingX") || (_x isKindOf "LandVehicle") || (_x isKindOf "Air") || (_x isKindOf "Ship")) && (_x != _center)}) then {
        private _displayName = getText (configOf _x >> "displayName");
        private _distance = _x distance _center;
        private _customName = _x getVariable ["ACE_cargo_customName", ""];
        if (_customName != "") then {_displayName = _customName;};
        _distance = [_distance, 2] call BIS_fnc_cutDecimals;
        private _index = _listInventories lbAdd format["%1 (%2m)", _displayName, _distance];
        _listInventories lbSetData [_index, netId _x];
        _listInventories lbSetValue [_index, _forEachIndex];
    };
} forEach (nearestObjects [_center, ["All"], _radius]);