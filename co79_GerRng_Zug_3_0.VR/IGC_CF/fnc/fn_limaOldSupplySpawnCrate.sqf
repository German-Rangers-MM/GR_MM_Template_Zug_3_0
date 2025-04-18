params ["_object", "_file"];

// Store offset in object variable
private _offset = _object getVariable ["supply_offset", [0,0,0]];

// Calculate spawn position with offset
private _spawnPos = _object modelToWorld _offset;


private _fileContent = [];

private _filePath = limapfad + _file +".sqf";

systemChat str _filePath;

if (fileExists _filePath) then {
    _fileContent = preprocessFileLineNumbers _filePath;
    _fileContent = call compile _fileContent;
} else {
    _fileContent = ["Config missing", "B_supplyCrate_F", ["Error: File not found", 0]];
};

// Extract box class and store in dialog
private _boxClass = "B_supplyCrate_F";
if (count _fileContent > 1) then {
    _boxClass = _fileContent select 1;
    _boxName = _fileContent select 0;
};

// Remove header and box class from items
_fileContent deleteRange [0,2];


// Create supply box at calculated position
private _supplyBox = createVehicle [_boxClass, _spawnPos, [], 0, "CAN_COLLIDE"];
_supplyBox setDir (getDir _object);
_supplyBox setPosATL ASLToATL AGLToASL _spawnPos;


_supplyBox setVariable ["ACE_cargo_customName", _boxName, true];



// Clear default contents
clearWeaponCargoGlobal _supplyBox;
clearMagazineCargoGlobal _supplyBox;
clearItemCargoGlobal _supplyBox;
clearBackpackCargoGlobal _supplyBox;

// Add items to crate
{
    _x params ["_class", "_quantity"];
    private _pathToConfig = [_class] call IGC_CF_fnc_getConfigPath;
    // Add items based on type
    switch (_pathToConfig) do {
        case ("CfgWeapons"): {
            private _isToolOrMedItem = getNumber(configFile >> "CfgWeapons" >> _class >> "ACE_isMedicalItem") + getNumber(configFile >> "CfgWeapons" >> _class >> "ACE_isMedicalItem");
            if (_isToolOrMedItem == 0) then 
            {
                if (_class isKindOf  "Rifle_Base_F" || _class isKindOf  "Pistol_Base_F" || _class isKindOf  "Launcher_Base_F") then {
                    _supplyBox addWeaponCargoGlobal [_class, _quantity];
                } else {
                    _supplyBox addItemCargoGlobal [_class, _quantity];
                };
            } else 
            {
                _supplyBox addItemCargoGlobal [_class, _quantity];
            }
        };
        case ("CfgMagazines"): {
            private _isToolOrMedItem = getNumber(configFile >> "CfgWeapons" >> _class >> "ACE_isMedicalItem") + getNumber(configFile >> "CfgWeapons" >> _class >> "ACE_isMedicalItem");
            if (_isToolOrMedItem == 0) then 
            {
                _supplyBox addMagazineCargoGlobal [_class, _quantity];
            } else 
            {
                _supplyBox addItemCargoGlobal [_class, _quantity];
            }
        };
        case ("CfgVehicles"): {
            _supplyBox addBackpackCargoGlobal [_class, _quantity];
        };
        case ("CfgGlasses"): {
            _supplyBox addItemCargoGlobal [_class, _quantity];
        };
        default {
            systemChat format["[ERROR] Invalid class: %1", _class];
        };
    };
} forEach _fileContent;


[] spawn { sleep 0.1; systemChat "Supply box created successfully!"; };
[_supplyBox] spawn {
	//systemchat str _this;
	params ["_supplyBox"];
	sleep 2;
	_supplyBox allowDamage true;
};