if (! isServer) exitWith {};

params ["_supply", "_point"];

// Static Supply Point = Default
// Ermittel die Position Relativ zur Position des Fahrzeuges (Bei HEMTT muss 7 eingestellt sein, damit die Box nicht unter dem LKW steht und 180, damit sie am Heck gespawnt wird)
_boxPos = switch(_point) do 
{
	case limaPalettPointStatic: {limaPalettPointStaticMarker getRelPos [0,0];};
};

//Setzt die Höhe auf der die Box nachher Positioniert wird. Wird benötigt wenn die Static Station in einem Gebäude oder ähnlichem steht.
_boxHeight = 1;
_boxDir = switch(_point) do 
{
	case limaPalettPointStatic: {getDir limaPalettPointStaticMarker;};
};


_box = objNull;
//plcasetan
switch (toLower _supply) do {
	// Achtung! alle cases müssen lowercase sein!
	case "plmaster": {
		_box = "Land_Boxloader_Pallet_5_Net" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "pl_typ_1_master.sqf";
	};

	case "plammosmall": {
		_box = "Boxloader_SmallPallet_Ammo" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "pl_typ_2.sqf";
	};

	case "plcasetan": {
		_box = "Land_Boxloader_Case_Tan" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "pl_typ_3.sqf";
	};

	case "plcasemed": {
		_box = "Land_Boxloader_Case_Med" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "pl_typ_4_san.sqf";
	};
	
	case "plfmun": {
		_box = "Boxloader_VehicleAmmo_West" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "pl_typ_5.sqf";
	};

	case "plfuels": {
		_box = "Boxloader_drumpallet_fuel" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "pl_typ_6.sqf";
	};

	case "plfuell": {
		_box = "Boxloader_Sixcon_Fuel" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "pl_typ_7.sqf";
	};

	case "plrepair": {
		_box = "Boxloader_BigPallet_Repair" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "pl_typ_7.sqf";
	};
};

// für ALLE von Lima gespawnte Boxen Gewichtslimit Ignorieren
// [_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
// [_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;

// Fallschaden der Box verhindern (hoffentlich)
_box allowDamage false;

[_box] spawn {
	//systemchat str _this;
	params ["_box"];
	sleep 2;
	_box allowDamage true;
};
