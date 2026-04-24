/*
	by SmartGun

 	Description:
	start outro sequence for players, run OCAP export on server	
	
 	Paramameters:		
		_this select 0: endingType 	-> STRING	-> can be: "End1" or "End2" or "End3"	

	Return values:
	-none		

	["successful"] execVM "scripts\core\MCC_chapter_startMissionOutro.sqf";
*/
params ["_endingType"];

// get values from description.ext
private _sequence = getMissionConfigValue ["outro", "pr1"];
private _gameType = "COOP";

// default vars
private _guiText = "";
private _sequencePath = "";
private _sequenceDelay = 63;
private _result = false;

// switch is case-sensitive!
switch (toLowerANSI _endingType) do {
	// Mission Successful
	case "end1": { 	
		_guiText =  "Soll die Mission beendet werden?";
		_sequencePath = "scripts\core\MCC_sequence_outro_success" + _sequence + ".sqf";
		
		_sequenceDelay = switch (toLowerANSI _sequence) do {
			case "pr1": 	{ 32 };
			case "pr2": 	{ 32 };
			case "mgs": 	{ 78 };
			case "rock": 	{ 42 };
			case "afo": 	{ 37 };
			case "video": 	{ 37 };			
		};		
	};
	// Mission Continued
	case "end2": { 
		_guiText =  "Soll die Mission SPÄTER FORTGESETZT werden?";
		_sequencePath = "scripts\core\MCC_sequence_outro_continued.sqf";
	};	
	// Mission Failed
	case "end3": { 
		_guiText =  "Ist die Mission fehlgeschlagen?";
		_sequencePath = "scripts\core\MCC_sequence_outro_failed.sqf";
	};	
};

// Bestätigung per GUI
_result = [_guiText, "Confirm", true, true] call BIS_fnc_guiMessage;

// keine Bestätigung -> Vorgang abbrechen
if (!_result) exitWith {};

// Start Outro Sequence Client Side
_sequencePath remoteExec ["execVM",[0, -2] select isDedicated];

// Start OCAP export Server Side
[[_sequenceDelay, _gameType, _endingType], "scripts\core\MCC_chapter_ocapEnd.sqf"] remoteExec ["execVM", 2];