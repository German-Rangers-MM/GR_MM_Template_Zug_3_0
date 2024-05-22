if (! isServer) exitWith {};

params ["_supply", "_point"];

// Static Supply Point = Default
// Ermittel die Position Relativ zur Position des Fahrzeuges (Bei HEMTT muss 7 eingestellt sein, damit die Box nicht unter dem LKW steht und 180, damit sie am Heck gespawnt wird)
_boxPos = limaSupplyPointStaticMarker getRelPos [0,0];

//Setzt die Höhe auf der die Box nachher Positioniert wird. Wird benötigt wenn die Static Station in einem Gebäude oder ähnlichem steht.
_boxHeight = 1;

// Mobile Supply Point
if (_point == limaSupplyPointMobile) then {
	_boxPos = limaSupplyPointMobile getRelPos [7,180];
	_boxHeight = 0.8;
};

_box = objNull;

switch (toLower _supply) do {
	// Achtung! alle cases müssen lowercase sein!
	case "zug1": {
		_box = "ACE_Box_Ammo" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_zug_typ_1.sqf";
	};
	case "zug2": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_zug_typ_2.sqf";
	};

	case "zug3": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_zug_typ_3.sqf";
	};

	case "zug4": {
		_box = "Box_NATO_Equip_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_zug_typ_4.sqf";
	};

	case "zug5": {
		_box = "ACE_Box_Chemlights" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_zug_typ_5.sqf";
	};
	
	case "zug6": {
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_zug_typ_6.sqf";
	};

	case "zug7": {
		_box = "ACE_Box_Chemlights" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_zug_typ_7.sqf";
	};

	case "zug8": {
		_box = "ACE_Box_Chemlights" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_zug_typ_8.sqf";
	};	
	
	case "wagru1": {
		_box = "Box_NATO_Wps_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagru_typ_1.sqf";
	};	
	
	case "wagru2": {
		_box = "Box_NATO_Wps_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagru_typ_2.sqf";
	};	
	
	case "wagru3": {
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagru_typ_3.sqf";
	};	
	
	case "wagru4": {
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagru_typ_4.sqf";
	};	
	
	case "wagru5": {
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagru_typ_5.sqf";
	};	
	
	case "wagru6": {
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagru_typ_6.sqf";
	};	
	
	case "wagru7": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagru_typ_7.sqf";
	};
		
	case "sierra1": {
		_box = "ACE_Box_Ammo" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_sierra_typ_1.sqf";
	};
	
	case "san1": {
		_box = "ACE_medicalSupplyCrate" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_san_typ_1.sqf";
	};
	
	case "san2": {
		_box = "ACE_medicalSupplyCrate" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_san_typ_2.sqf";
	};		
	
	case "supply": {
		_box = "ACE_Box_Chemlights" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_empty.sqf";
	};
	
	case "eod1": {
		_box = "Box_NATO_Equip_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_eod_typ_1.sqf";
	};
	
	case "eod2": {
		_box = "ACE_Box_Chemlights" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_eod_typ_2.sqf";
	};
	
	case "eod3": {
		_box = "ACE_Box_Misc" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_eod_typ_3.sqf";
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