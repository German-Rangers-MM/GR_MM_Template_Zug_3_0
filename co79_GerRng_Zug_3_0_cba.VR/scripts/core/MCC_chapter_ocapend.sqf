//
//	https://github.com/OCAP2/OCAP
//	https://community.bistudio.com/wiki/BIS_fnc_endMission
//
params ["_delay", "_gameType", "_endingType"];

private _win = true;
if (_endingType isEqualTo "end3") then {
	_win = false;
};

// warten bis Outro zu ende ist
sleep _delay;

// check ob OCAP geladen wurde
if isClass (configFile >> "CfgPatches" >> "OCAP") then	{
	// OCAP Export wenn Auto-Save aus
	if (! ocap_settings_saveMissionEnded) then {		
		[west, "Mission erfolgreich beendet!", _gameType] call ocap_fnc_exportData;
	};
};

// Mission beenden
[_endingType, _win, 0, false, false] remoteExec ["BIS_fnc_endMission", 0, true];