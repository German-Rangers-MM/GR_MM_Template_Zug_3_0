_result = false;
private _result = ["Ist die Mission fehlgeschlagen?", "Confirm", true, true] call BIS_fnc_guiMessage;

if (!_result) exitWith {};

"scripts\core\MCC_sequence_outro_failed.sqf" remoteExec ["execVM"];

sleep 63;

"scripts\core\MCC_chapter_ocapend.sqf" remoteExec ["execVM", 2];
