if (! isServer) exitWith {};

params ["_supply", "_point"];

// Static Supply Point = Default
// Ermittel die Position Relativ zur Position des Fahrzeuges (Bei HEMTT muss 7 eingestellt sein, damit die Box nicht unter dem LKW steht und 180, damit sie am Heck gespawnt wird)
_boxPos = switch(_point) do 
{
	case limasupplypointstatic: {limasupplypointstaticmarker getRelPos [0,0];};
	case limasupplypointmobile: {limasupplypointmobile getRelPos [7,180];};
};

//Setzt die Höhe auf der die Box nachher Positioniert wird. Wird benötigt wenn die Static Station in einem Gebäude oder ähnlichem steht.
_boxHeight = switch(_point) do 
{
	case limasupplypointmobile: {0.8};
	default {1};
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
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
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
		_box = "ACE_Box_Ammo" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_zug_typ_8.sqf";
	};

		case "zug9": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_zug_typ_9.sqf";
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
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagru_typ_7.sqf";
	};	
	
	case "wagru8": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagru_typ_8.sqf";
	};

		case "wagrustat1": {
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_1.sqf";
	};

			case "wagrustat2": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_2.sqf";
	};

			case "wagrustat3": {
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_3.sqf";
	};

			case "wagrustat4": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_4.sqf";
	};

			case "wagrustat5": {
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_5.sqf";
	};

			case "wagrustat6": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_6.sqf";
	};

			case "wagrustat7": {
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_7.sqf";
	};

			case "wagrustat8": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_8.sqf";
	};

			case "wagrustat9": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_9.sqf";
	};

			case "wagrustat10": {
		_box = "Box_NATO_WpsLaunch_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_10.sqf";
	};

			case "wagrustat11": {
		_box = "ACE_Box_82mm_Mo_HE" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_wagrustat_typ_11.sqf";
	};
		
	case "sierra1": {
		_box = "ACE_Box_Ammo" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_sierra_typ_1.sqf";
	};

	case "sierra2": {
		_box = "ACE_Box_Ammo" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_sierra_typ_2.sqf";
	};

	case "sierra3": {
		_box = "ACE_Box_Ammo" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_sierra_typ_3.sqf";
	};

	case "sierra4": {
		_box = "ACE_Box_Ammo" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_sierra_typ_4.sqf";
	};

	case "sierra5": {
		_box = "Box_NATO_Equip_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_sierra_typ_5.sqf";
	};
	
	case "san1": {
		_box = "ACE_medicalSupplyCrate" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_san_typ_1.sqf";
	};

	case "san2": {
		_box = "Land_PlasticCase_01_medium_black_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_san_typ_2.sqf";
	};	

		case "san3": {
		_box = "Land_PlasticCase_01_medium_gray_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_san_typ_3.sqf";
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

	case "eod4": {
		_box = "ACE_Box_Misc" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_eod_typ_4.sqf";
	};

	case "cbrn1": {
		_box = "Land_PlasticCase_01_large_olive_CBRN_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_cbrn_typ_1.sqf";
	};

	case "cbrn2": {
		_box = "Land_PlasticCase_01_large_olive_CBRN_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_cbrn_typ_2.sqf";
	};

	case "cbrn3": {
		_box = "Land_PlasticCase_01_medium_olive_CBRN_F" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
		[_box] execvm limapfad + "box_cbrn_typ_3.sqf";
	};

	case "ersatzrad": {
		_box = "ACE_Wheel" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
	};

	case "ersatzkette": {
		_box = "ACE_Track" createVehicle _boxPos;
		_box setPosATL [_boxPos select 0,_boxPos select 1,_boxHeight];
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
