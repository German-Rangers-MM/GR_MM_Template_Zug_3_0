params ["_delay", "_gameType", "_endingType"];

private _win = true;
if (_endingType isEqualTo "end3") then {
	_win = false;
};

// warten bis Outo zu ende ist
sleep _delay;

// OCAP Export
[west, "Mission erfolgreich beendet!", _gameType] call ocap_fnc_exportData;

// Mission beenden
[_endingType, _win, 0, false, false] remoteExec ["BIS_fnc_endMission", 0, true];