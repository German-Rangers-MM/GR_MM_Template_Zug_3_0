if (!isServer) exitWith {};

[west, "Mission beendet!"] call ocap_fnc_exportData;

["end3", false, 0, false, false] remoteExec ["BIS_fnc_endMission", 0, true];