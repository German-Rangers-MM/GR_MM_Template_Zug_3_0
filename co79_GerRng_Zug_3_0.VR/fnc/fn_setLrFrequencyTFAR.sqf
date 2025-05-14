/*
	by SmartGun	
	
	Description:
	set TFAR LR Frequency according to vehicle kind
	
	Paramameters:
	-vehicle
		
	Return values:	
	-none	
	
	_vehicle call SGN_fnc_setLrFrequencyTFAR;   
*/

params ["_vehicle"];

// get LR radio of vehicle
private _vehicleLR = player call TFAR_fnc_VehicleLR;

// TFAR_fnc_VehicleLR will return nil if no Vehicle radio was found
if (! isNil "_vehicleLR") then {	
	
	private _vehicleType = typeOf _vehicle; // get classname	
	private _frequency = "68"; // default frequenz	
	
	if (_vehicleType isKindOf "Car") then {
		_frequency = "63";
	};
	
	if (_vehicleType isKindOf "Air") then {
		_frequency = "64";
	};  

	// set frequency for channel 1
	[_vehicleLR, 1, _frequency] call TFAR_fnc_SetChannelFrequency;	
};