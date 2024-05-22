params ["_line1","_line2","_line3","_tickerCountry","_tickerLocation"];

// Stops running the Sequence on the Server or HC
if (! hasInterface) exitWith {};

//Start Music

["Intro", true, 2] call BIS_fnc_blackOut;
sleep 2;

playMusic "PRIntro";
sleep 1.5;

// Check ob Intro Mod gelden wurde -> Video abspielen
if isClass (configFile >> "CfgPatches" >> "lightning_ressources") then	{	
	["\ressources\GR_Intro_mov.ogv"] call BIS_fnc_playVideo;
	sleep 0.5;
} else {
	// keine Intro Mod -> nur Text einblenden für die Dauer des Videos
	titleText ["<t size='1.6'>Du willst auch ein cooles Intro-Video sehen?<br/>Dann lade die<t color='#e5991a' > German Rangers Intro</t> Mod!</t>", "PLAIN DOWN", 1, true, true];	
	sleep 30; // Länge des Intro-Videos in Sekunden hier angeben
};

titleText [_line1, "PLAIN", 1, true, true];

titleText [_line2, "BLACK FADED", 2, true, true];

sleep 7;

["Intro", true, 1] call BIS_fnc_blackIn;
sleep 1;

titleText [_line3, "BLACK FADED", 10, true, true];
sleep 4;

titleText [_line3, "BLACK IN", 5, true, true];
sleep 5;

//Text Ticker
[[[_tickerCountry,"size = '0.7' font='PuristaBold'"],["","<br/>"],[_tickerLocation,"size = '0.7'","#aaaaaa"]],safeZoneX / 4, safeZoneH / 2,true,"<t font='PuristaBold'>%1</t>",[],{ false },true] spawn BIS_fnc_typeText2;	
sleep 8;
private _t = [daytime, "HH:MM"] call BIS_fnc_timeToString;			// time at missionstart as a string
[["Time: "+_t],safeZoneX / 4, safeZoneH / 2,true,"<t font='PuristaBold'>%1</t>",[],{ false },true] spawn BIS_fnc_typeText2;