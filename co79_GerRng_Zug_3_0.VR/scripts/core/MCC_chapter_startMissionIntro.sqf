// Bestätigung per GUI
private _result = false;
_result = ["Soll die Mission gestartet werden?", "Confirm", true, true] call BIS_fnc_guiMessage;

// keine Bestätigung -> Vorgang abbrechen
if (!_result) exitWith {};

// get values from config
_einleitung = getMissionConfigValue "einleitung";
_auftrag = getMissionConfigValue "auftrag";
_titleOrtEinheit = getMissionConfigValue "titleOrtEinheit";
_titleMissionsname = getMissionConfigValue "titleMissionsname";
_tickerCountry = getMissionConfigValue "tickerCountry";
_tickerLocation = getMissionConfigValue "tickerLocation";

missionstarted = true;
publicVariable "missionstarted";

// get intro-type from config, defaults to "PR"
private _intro = getMissionConfigValue ["intro", "pr"];

_intropfad = "scripts\core\MCC_sequence_intro" + _intro + ".sqf";

_line1 = format ["<t color='#ffffff' size='2'>%1</t>",_einleitung];
_line2 = format ["<t color='#ffffff' size='2'>%1</t>",_auftrag];
_line3 = format ["<t color='#ffffff' size='1'>%1<br/>____________________</t><br/><t color='#ffffff' size='5'>%2</t><br/><br/><img image='images\GermanRangersLogo.paa' shadow='0' size='8'/>",_titleOrtEinheit,_titleMissionsname];

[[_line1, _line2, _line3, _tickerCountry, _tickerLocation], _intropfad] remoteExec ["execVM",[0, -2] select isDedicated];
//"scripts\MCC_sequence_startteleport.sqf" remoteExec ["execVM"];