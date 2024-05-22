_result = false;
private _result = ["Soll die Mission beendet werden?", "Confirm", true, true] call BIS_fnc_guiMessage;

if (!_result) exitWith {};

_outro = getMissionConfigValue "outro";
_outropfad = "scripts\core\MCC_sequence_outro_success" + _outro + ".sqf";

_outropfad remoteExec ["execVM"];

_sleepy = 31;

switch (_outro) do
{
	case "PR1": {_sleepy = 32;};
	case "PR2": {_sleepy = 32;};
	case "MGS": {_sleepy = 78;};
	case "Rock": {_sleepy = 42;};
	case "AFO": {_sleepy = 37;};
	case "Video": {_sleepy = 37;};
};

sleep _sleepy;

"scripts\core\MCC_chapter_ocapend.sqf" remoteExec ["execVM", 2];
