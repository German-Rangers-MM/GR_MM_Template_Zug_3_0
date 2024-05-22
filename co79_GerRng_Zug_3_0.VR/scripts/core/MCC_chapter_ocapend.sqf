if (!isServer) exitWith {};

[west, "Mission erfolgreich beendet!"] call ocap_fnc_exportData;

["MyEnding", true, 0, false, false] remoteExec ["BIS_fnc_endMission", 0, true];