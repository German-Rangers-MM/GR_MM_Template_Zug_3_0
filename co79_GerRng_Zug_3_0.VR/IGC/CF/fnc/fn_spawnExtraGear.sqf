params ["_type"];
private _dialog = findDisplay 220901;
if (isNull _dialog) exitWith {};


// Add items based on category
switch (_type) do {
    case "mre": {
        [] execVM limapfad + "box_san_typ_3.sqf";
    };
    
    case "tire": {
        // Get box class from dialog variable
        private _boxClass = "ACE_Wheel";


        // Get reference object and offset
        private _sourceObject = uiNamespace getVariable ["currentSupplyObject", objNull];
        private _offset = _sourceObject getVariable ["supply_offset", [0,3,0]];

        // Calculate spawn position with offset
        private _spawnPos = _sourceObject modelToWorld _offset;

        // Create supply box at calculated position
        private _supplyBox = createVehicle [_boxClass, _spawnPos, [], 0, "CAN_COLLIDE"];
        _supplyBox setDir (getDir _sourceObject);
        _supplyBox setPosATL ASLToATL AGLToASL _spawnPos;

        _supplyBox allowDamage false;

        [_supplyBox] spawn {
            //systemchat str _this;
            params ["_supplyBox"];
            sleep 2;
            _supplyBox allowDamage true;
        };
    };
    
    case "track": {
        // Get box class from dialog variable
        private _boxClass = "ACE_Track";


        // Get reference object and offset
        private _sourceObject = uiNamespace getVariable ["currentSupplyObject", objNull];
        private _offset = _sourceObject getVariable ["supply_offset", [0,3,0]];

        // Calculate spawn position with offset
        private _spawnPos = _sourceObject modelToWorld _offset;

        // Create supply box at calculated position
        private _supplyBox = createVehicle [_boxClass, _spawnPos, [], 0, "CAN_COLLIDE"];
        _supplyBox setDir (getDir _sourceObject);
        _supplyBox setPosATL ASLToATL AGLToASL _spawnPos;

        _supplyBox allowDamage false;

        [_supplyBox] spawn {
            //systemchat str _this;
            params ["_supplyBox"];
            sleep 2;
            _supplyBox allowDamage true;
        };
    };

    case "supply": {
        [] execVM limapfad + "box_empty.sqf"
    };

};