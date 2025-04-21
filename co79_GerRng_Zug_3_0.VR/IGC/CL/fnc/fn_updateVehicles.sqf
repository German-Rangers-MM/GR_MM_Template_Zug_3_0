private _dialog = findDisplay 222901;
private _listVehicles = _dialog displayCtrl 220912;
private _radius = uiNamespace getVariable "currentRadius";
private _center = uiNamespace getVariable "currentSupplyObject";

lbClear _listVehicles;


{
    if (_x distance _center <= _radius && {!(_x isKindOf "Man") && !((_x isKindOf "ReammoBox_F") || (_x isKindOf "ThingX")) && ((_x isKindOf "LandVehicle") || (_x isKindOf "Air") || (_x isKindOf "Ship")) && (_x != _center)}) then {
        private _displayName = getText (configOf _x >> "displayName");
        private _distance = _x distance _center;
        private _cargoLeft = [_x] call ACE_cargo_fnc_getCargoSpaceLeft;
        _distance = [_distance, 2] call BIS_fnc_cutDecimals;
        private _index = _listVehicles lbAdd format["%1 (%2m) %3 Slots", _displayName, _distance, _cargoLeft];
        _listVehicles lbSetData [_index, netId _x];
        _listVehicles lbSetValue [_index, _forEachIndex];
    };
} forEach (nearestObjects [_center, ["All"], _radius]);