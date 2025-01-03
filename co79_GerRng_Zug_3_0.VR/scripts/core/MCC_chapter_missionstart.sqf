_result = false;
private _result = ["Soll die Mission gestartet werden?", "Confirm", true, true] call BIS_fnc_guiMessage;

if (!_result) exitWith {};

_einleitung = getMissionConfigValue "einleitung";;
_auftrag = getMissionConfigValue "auftrag";;
_titleOrtEinheit = getMissionConfigValue "titleOrtEinheit";;
_titleMissionsname = getMissionConfigValue "titleMissionsname";;
_tickerCountry = getMissionConfigValue "tickerCountry";;
_tickerLocation = getMissionConfigValue "tickerLocation";;

missionstarted = true;
publicVariable "missionstarted";

_intro = getMissionConfigValue "intro";
switch(_intro) do {
    case "PR": {};
    case "Rock": {};
    case "Sic": {};
    case "BHD": {};
    case "KA": {};
    case "Video": {};
    default {_intro = "PR"};
};

_intropfad = "scripts\core\MCC_sequence_intro" + _intro + ".sqf";

_line1 = format ["<t color='#ffffff' size='2'>%1</t>",_einleitung];
_line2 = format ["<t color='#ffffff' size='2'>%1</t>",_auftrag];
_line3 = format ["<t color='#ffffff' size='1'>%1<br/>____________________</t><br/><t color='#ffffff' size='5'>%2</t><br/><br/><img image='images\GermanRangersLogo.paa' shadow='0' size='8'/>",_titleOrtEinheit,_titleMissionsname];

//"scripts\MCC_sequence_intro.sqf" remoteExec ["execVM"];
[[_line1, _line2, _line3, _tickerCountry, _tickerLocation],_intropfad] remoteExec ["execVM",[0, -2] select isDedicated];
//"scripts\MCC_sequence_startteleport.sqf" remoteExec ["execVM"];
