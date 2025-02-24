// Stops running the Sequence on the Server or HC
if (! hasInterface) exitWith {};

//Start Music
playMusic "PRIntro";

titleText ["<img image='images\GermanRangersLogo.paa' shadow='0' size='10'/> <br/>
			<t color='#ffffff' size='5' font='RobotoCondensed' shadow = '2' >M I S S I O N   E R F Ü L L T</t>
			<br/>
			<br/>
			<t color='#ffffff' size='1.5' font='RobotoCondensed' shadow = '2' >Auftrag erfolgreich abgeschlossen.</t>", 
			"PLAIN", 2, true, true
		];

sleep 4;

["Intro", true, 2] call BIS_fnc_blackOut;

sleep 4;

// Check ob Intro Mod gelden wurde -> Video abspielen
if isClass (configFile >> "CfgPatches" >> "lightning_ressources") then	{	
	["\ressources\GR_Intro_mov.ogv"] call BIS_fnc_playVideo;
	sleep 0.5;
} else {
	// keine Intro Mod -> nur Text einblenden für die Dauer des Videos
	titleText ["<t size='1.6'>Du willst auch ein cooles Intro-Video sehen?<br/>Dann lade die<t color='#e5991a' > German Rangers Intro</t> Mod!</t>", "PLAIN DOWN", 1, true, true];	
	sleep 30; // Länge des Intro-Videos in Sekunden hier angeben
};

["Intro", true, 1] call BIS_fnc_blackIn;
