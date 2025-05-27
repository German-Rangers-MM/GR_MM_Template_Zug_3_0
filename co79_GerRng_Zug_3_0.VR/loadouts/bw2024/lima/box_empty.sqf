private _dialog = findDisplay 220901;
if (isNull _dialog) exitWith {};


// Get box class from dialog variable
        private _boxClass = "ACE_Box_Chemlights";


        // Get reference object and offset
        private _sourceObject = uiNamespace getVariable ["currentSupplyObject", objNull];
        private _offset = _sourceObject getVariable ["supply_offset", [0,3,0]];

        // Calculate spawn position with offset
        private _spawnPos = _sourceObject modelToWorld _offset;

        // Create supply box at calculated position
        private _supplyBox = createVehicle [_boxClass, _spawnPos, [], 0, "CAN_COLLIDE"];
        _supplyBox setDir (getDir _sourceObject);
        _supplyBox setPosATL ASLToATL AGLToASL _spawnPos;

        clearWeaponCargoGlobal _supplyBox; 
        clearMagazineCargoGlobal _supplyBox;
        clearItemCargoGlobal _supplyBox;
        clearBackpackCargoGlobal _supplyBox;

        _supplyBox allowDamage false;

        [_supplyBox] spawn {
            //systemchat str _this;
            params ["_supplyBox"];
            sleep 2;
            _supplyBox allowDamage true;
        };