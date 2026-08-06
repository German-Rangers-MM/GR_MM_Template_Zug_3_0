//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						Player Initialisierung
//
//------------------------------------------------------------------
//------------------------------------------------------------------
waitUntil{!isNull(player)};
setTerrainGrid 25;
enableEnvironment [false, true];
titleText ["Missionsvorbereitung", "BLACK FADED" ];

// briefingName
[] execVM "scripts\core\briefing.sqf";

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//							Dynamic Groups
//
//------------------------------------------------------------------
//------------------------------------------------------------------

//DynamicGroups_Function Function needs to be initialized on server and client. Clients can then use action TeamSwitch ("U" by default) to access the Dynamic Groups interface.
if (getMissionConfigValue "dynamicGroupsFeat" == "true") then {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;	//Exec on client
};

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//							Loadouts
//
//------------------------------------------------------------------
//------------------------------------------------------------------
// warten auf die Variablen für Fraktion und Tarnfarbe vom Server
waitUntil { sleep 1; !isNil "fraktionV" && !isNil "tarnfarbeV" };

//Abfrage ob Datenbank oder frisches Loadout
if (getMissionConfigValue "loadPlayers" == "true") then {

	// INIDB
	_clientID = clientOwner;
	_UID = getPlayerUID player;
	_name = name player;
	checkForDatabase = [_clientID, player, _name];
	publicVariableServer "checkForDatabase";
	_hasLoadout = false;

	"loadData" addPublicVariableEventHandler
	{
		_gear = (_this select 1);
		player setUnitLoadout _gear;
		_hasloadout = true;
	};
	
	if (_hasloadout == false) then {
		call compile preprocessFileLineNumbers "loadouts\loadoutInit.sqf";
	};
}
else {
	call compile preprocessFileLineNumbers "loadouts\loadoutInit.sqf";
};

// Loadouts pro Gruppe zuweisen
call compile preprocessFileLineNumbers format ["loadouts\%1\gruppenLoadouts.sqf", fraktionV];

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//							Recolor
//
//------------------------------------------------------------------
//------------------------------------------------------------------

/*
// Recolor Post-Processing - Night
PPeffect_colorC = ppEffectCreate ["ColorCorrections",1500];
PPeffect_colorC ppEffectAdjust [1.04,0.9,-0.00279611,[0.147043,0,0.0476897,-0.34],[1,1,0.94,1.15],[1.39,0.95,-1.34,0]];
PPeffect_colorC ppEffectEnable true;
PPeffect_colorC ppEffectCommit 0;
*/

/*
// Recolor Post-Processing - Desert/Winter
"colorCorrections" ppEffectAdjust 	[1,1,-0.01,[0.0, 0.0, 0.0, 0.0],[1, 0.8, 0.6, 0.6],[0.199, 0.587, 0.114, 0.0]]; 
"colorCorrections" ppEffectEnable true; 
"colorCorrections" ppEffectCommit 0; 
"filmGrain" ppEffectAdjust 	[0.04,1,1,0.1,1,false];      
"filmGrain" ppEffectEnable true;    
*/

/*
// Recolor Post-Processing - Winter Day
"colorCorrections" ppEffectAdjust  [1.1,1.2,-0.01,[0.0, 0.0, 0.0, 0.0],[0.8, 0.8, 1, 0.6],[0.199, 0.587, 0, 0.0]];  
"colorCorrections" ppEffectEnable true;  
"colorCorrections" ppEffectCommit 0; 
"filmGrain" ppEffectAdjust 	[0.04,1,1,0.1,1,false];      
"filmGrain" ppEffectEnable true;
"filmGrain" ppEffectCommit 0;  
*/

/*
// Recolor Post-Processing - brownish, bright african
PPeffect_colorC = ppEffectCreate ["ColorCorrections",1500];
PPeffect_colorC ppEffectAdjust [1,1,-0.00279611,[0.399248,0.452746,0.307538,0.1042],[1.36009,1,0.320698,0.95],[2.50966,0.263398,3.22694,0]];
PPeffect_colorC ppEffectEnable true;
PPeffect_colorC ppEffectCommit 0;
*/

/*
// Recolor Post-Processing - Jungle Rainy
PPeffect_colorC = ppEffectCreate ["ColorCorrections",1500]; 
PPeffect_colorC ppEffectAdjust [1,1,0,[0,1,0.3,0.04],[1,1,1,1],[0.3,0.587,0.114,0]]; 
PPeffect_colorC ppEffectEnable true; 
PPeffect_colorC ppEffectCommit 0;
"filmGrain" ppEffectAdjust  [0.04,1,1,0.1,1,false];
"filmGrain" ppEffectEnable true;
*/

/*
// Recolor Post-Processing - Jungle
PPeffect_colorC = ppEffectCreate ["ColorCorrections",1500]; 
PPeffect_colorC ppEffectAdjust [1,1,0,[0,1,0.1,0.04],[1,1,1,1],[0.3,0.587,0.114,0]]; 
PPeffect_colorC ppEffectEnable true; 
PPeffect_colorC ppEffectCommit 0;
*/
//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						Effects
//
//------------------------------------------------------------------
//------------------------------------------------------------------

/*
	[object,interval,brightness,newspapers] call BIS_fnc_sandstorm
	position: Object - sandstorm center (should be player)
	interval (Optional): Number - particle refresh time (default is 0.07)
	brightness (Optional): Number - brightness coeficient (default is 1)
	newspapers (Optional): Boolean - true if flying newspapers will be present (default is true)
*/

//[player, 0.9, 0.5, true] call BIS_fnc_sandstorm;

//FoggyBreath
//_units = if (!isMultiplayer) then {switchableUnits} else {playableUnits};
//{[_x, 0.03] execVM "scripts\core\foggy_breath.sqf"} forEach _units;

//Ground Fog
//null = [] execVM "scripts\core\GroundFog.sqf";

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//					Kisten Dragable mit ACE
//
//------------------------------------------------------------------
//------------------------------------------------------------------

/*
check the weight:	[cursorTarget] call ace_dragging_fnc_getweight;
max weight is:		ACE_maxWeightCarry = 800;
					ACE_maxWeightDrag = 1000;
*/

/*
if isClass (configFile >> "CfgPatches" >> "ace_main") then {
    [crate1, true, [0, 1, 1], 0] call ace_dragging_fnc_setCarryable;
    [crate1, true, [0, 2, 0], 90] call ace_dragging_fnc_setDraggable;
};
*/


//------------------------------------------------------------------
//------------------------------------------------------------------
//
//					TFAR Longrange in Fahrzeugen
//
//------------------------------------------------------------------
//------------------------------------------------------------------

// Wird benötigt um West TFAR Longrange Funk in Fahrzeugen anderer Fraktionen zu integrieren

/*
if (isClass(configFile >> "cfgPatches" >> "task_force_radio")) then {
    car1 setVariable ["tf_side", west];
    car1 setVariable ["tf_hasRadio", true];
    car1 setVariable ["TF_RadioType", "tfar_rt1523g"];
};
*/

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						German Rangers GUI
//
//------------------------------------------------------------------
//------------------------------------------------------------------

_playerGrp = group player;

//Bestimmt wann das GR Menü angezeigt wird. Im Umkreis der Basis (Radius 50m)und vor Missionsstart.
_condition = {player distance GR_baseFlag < 100 || missionstarted == false};

// Creating a Sub Menu Category GR Base with Logo
_base_menu = ["GR Base","GR Base","images\GermanRangersLogo.paa",{  },_condition] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _base_menu] call ace_interact_menu_fnc_addActionToClass;

//Add Waffenkammer to ACE Menu GR Base
if (getMissionConfigValue "allowWaffenkammer" == "true") then { 
	_waffenkammer = ["Waffenkammer","Waffenkammer","a3\ui_f\data\gui\rsc\rscdisplayarsenal\spacegarage_ca.paa",{ execVM waffenkammerpfad; },_condition] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","GR Base"], _waffenkammer] call ace_interact_menu_fnc_addActionToClass;
	_saveLoadout_action = ["Loadout_Speichern","Loadout Speichern","a3\modules_f\data\iconsavegame_ca.paa",{ player call SGN_fnc_loadoutSave; },_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","GR Base","Waffenkammer"], _saveLoadout_action] call ace_interact_menu_fnc_addActionToObject;
	_resetLoadout_action = ["Loadout_Zuruecksetzten","Loadout Zurücksetzten","a3\3den\data\cfgwaypoints\cycle_ca.paa",{ player call SGN_fnc_loadoutReset; },_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","GR Base","Waffenkammer"], _resetLoadout_action] call ace_interact_menu_fnc_addActionToObject;
};

// Add Teleport to ACE Menu GR Base
_teleport_action = ["Teleporter","Teleporter","a3\ui_f\data\igui\cfg\simpletasks\types\move_ca.paa",{ [player] spawn GR_fnc_createTeleportDialog; },_condition] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","GR Base"], _teleport_action] call ace_interact_menu_fnc_addActionToObject;

// Add Loadout to ACE Menu GR Base
if (getMissionConfigValue "allowLoadouts" == "true") then {
	// neue function für Zug 3.0	
	_loadout_action = ["Loadouts","Loadouts","a3\ui_f\data\gui\rsc\rscdisplayarsenal\handgun_ca.paa",{ [player] spawn GR_fnc_createLoadoutDialog; },_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","GR Base"], _loadout_action] call ace_interact_menu_fnc_addActionToObject;	
};

// Add Würfeln Category to ACE Menu GR Equipment
_diceMain = ["GR_diceMain","Würfeln","a3\3den\data\displays\display3den\toolbar\widget_local_ca.paa",{  },{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "GerRng_equip"], _diceMain] call ace_interact_menu_fnc_addActionToObject; 

_actionDice20 = ["GR_rollDice20","(W20)","",{ [player,"(W20)", floor (random 20)+1,8] spawn SGN_fnc_rollDice; },{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","GerRng_equip","GR_diceMain"], _actionDice20] call ace_interact_menu_fnc_addActionToObject; 

_actionDice6 = ["GR_rollDice6","(W6)","",{ [player,"(W6)", floor (random 6)+1,8] spawn SGN_fnc_rollDice; },{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "GerRng_equip","GR_diceMain"], _actionDice6] call ace_interact_menu_fnc_addActionToObject;

// Debug Funktionen - Nur im Editor / SP verfügbar
if (! isMultiplayer) then {		
	// Full ACE Arsenal Action
	_action = ["open","<t color='#52fc03'>Full ACE Arsenal</t>",["","#52fc03"],{ [player] spawn SGN_fnc_createArsenalACE; },{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject; 	
	
	// Master Packliste Action
	_actionPckList = ["openPackliste","<t color='#fcba03'>Master Packliste</t>",["","#fcba03"],{ [player] spawn SGN_fnc_createPacklisteACE; },{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _actionPckList] call ace_interact_menu_fnc_addActionToObject; 	
	
	// Export Loadout Action
	_export = ["export", "<t color='#eb34d5'>Export LoadOut To Clipboard</t>", ["","#eb34d5"], {[player] spawn SGN_fnc_exportLoadOutArray;}, {true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _export] call ace_interact_menu_fnc_addActionToObject; 
};

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						Zeus Mission Control
//
//------------------------------------------------------------------
//------------------------------------------------------------------

// Creating a Sub Menu Category GR Base with Logo
_mission_control = ["Mission Control","Mission Control","images\GermanRangersLogo.paa",{}, {true}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _mission_control] call ace_interact_menu_fnc_addActionToZeus;

_start_mission = ["Missionsstart","Missionsstart","",{ execVM "scripts\core\MCC_chapter_startMissionIntro.sqf"; },{missionstarted == false}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions","Mission Control"], _start_mission] call ace_interact_menu_fnc_addActionToZeus;

_mission_succesful = ["Ende: Mission Erfüllt","Ende: Mission Erfüllt","",{ ["End1"] execVM "scripts\core\MCC_chapter_startMissionOutro.sqf"; },{missionstarted}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions","Mission Control"], _mission_succesful] call ace_interact_menu_fnc_addActionToZeus;

_to_be_continued = ["Ende: TO BE CONTINUED","Ende: TO BE CONTINUED","",{ ["End2"] execVM "scripts\core\MCC_chapter_startMissionOutro.sqf"; },{missionstarted}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions","Mission Control"], _to_be_continued] call ace_interact_menu_fnc_addActionToZeus;

_mission_failed = ["Ende: Mission Failed","Ende: Mission Failed","",{ ["End3"] execVM "scripts\core\MCC_chapter_startMissionOutro.sqf"; },{missionstarted}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions","Mission Control"], _mission_failed] call ace_interact_menu_fnc_addActionToZeus;

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						Admin Control Menu
//
//------------------------------------------------------------------
//------------------------------------------------------------------

if (_playerGrp == grplima || _playerGrp == grpkilo || _playerGrp == grpfox || _playerGrp == grpvictor || _playerGrp == grphotel) then {
	// Creating the Admin Control Menu Category GR Base with Logo
	_adminmenu = ["GR Admin Menu","GR Admin Menu","images\GermanRangersLogo.paa",{}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions"], _adminmenu] call ace_interact_menu_fnc_addActionToClass;

	_avdheal = ["AvD Heal","AvD Heal","a3\ui_f\data\igui\cfg\simpletasks\types\heal_ca.paa",{[player, cursorObject] call ace_medical_treatment_fnc_fullHeal},{true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","GR Admin Menu"], _avdheal] call ace_interact_menu_fnc_addActionToClass;

	[(typeOf player), 1, ["ACE_SelfActions","GR Admin Menu"], _start_mission] call ace_interact_menu_fnc_addActionToClass;

	[(typeOf player), 1, ["ACE_SelfActions","GR Admin Menu"], _mission_succesful] call ace_interact_menu_fnc_addActionToClass;
	
	[(typeOf player), 1, ["ACE_SelfActions","GR Admin Menu"], _to_be_continued] call ace_interact_menu_fnc_addActionToClass;
	
	[(typeOf player), 1, ["ACE_SelfActions","GR Admin Menu"], _mission_failed] call ace_interact_menu_fnc_addActionToClass;
	
	_checkHCs = ["Check HCs","Check HCs","a3\ui_f\data\igui\cfg\simpletasks\types\intel_ca.paa",{[[player], SGN_fnc_infoHintHC] remoteExec ["spawn", 2];},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","GR Admin Menu"], _checkHCs] call ace_interact_menu_fnc_addActionToObject;
};

if (_playerGrp == grpmike) then {
	// Creating the Admin Control Menu Category GR Base with Logo
	_avdmenu = ["GR AvD Menu","GR Avd Menu","images\GermanRangersLogo.paa",{}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions"], _avdmenu] call ace_interact_menu_fnc_addActionToClass;

	_avdheal = ["AvD Heal","AvD Heal","a3\ui_f\data\igui\cfg\simpletasks\types\heal_ca.paa",{[player, cursorObject] call ace_medical_treatment_fnc_fullHeal},{true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","GR AvD Menu"], _avdheal] call ace_interact_menu_fnc_addActionToClass;
};

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						LIMA Supply Point
//
//------------------------------------------------------------------
//------------------------------------------------------------------

//Deprecated moved to IGC_CF

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						LIMA Paletten Supply Point
//
//------------------------------------------------------------------
//------------------------------------------------------------------

if (getMissionConfigValue "limaSupplyPoints" == "true") then {
	if (_playerGrp == grplima || _playerGrp == grpkilo || _playerGrp == grphotel || _playerGrp == grpmike) then {
		
		// Icon für Paletten-deploy
		_icon = "a3\ui_f\data\igui\cfg\cursors\iconboardin_ca.paa";
		_iconPl = "a3\ui_f\data\igui\cfg\simpletasks\types\container_ca.paa";

		// Lima Palett Point Static
		{
			// Parent Action für Luftfracht Paletten  - Leer
			_palettenLF = ["Luftfracht Paletten - Leer","Luftfracht Paletten  - Leer",_iconPl,{ },{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _palettenLF] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
				_plmaster = ["plmaster","Typ 1 - Master",_icon,{[["plmaster",_this#0], limapfad + "limaPalettPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Luftfracht Paletten - Leer"], _plmaster] call ace_interact_menu_fnc_addActionToObject;

				_plammosmall = ["plammosmall","Typ 2 - Klein",_icon,{[["plammosmall",_this#0], limapfad + "limaPalettPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Luftfracht Paletten - Leer"], _plammosmall] call ace_interact_menu_fnc_addActionToObject;

				_plcasetan = ["plcasetan","Typ 3 - Hardcase",_icon,{[["plcasetan",_this#0], limapfad + "limaPalettPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Luftfracht Paletten - Leer"], _plcasetan] call ace_interact_menu_fnc_addActionToObject;

				_plcasemed = ["plcasetan","Typ 4 - Hardcase San",_icon,{[["plcasemed",_this#0], limapfad + "limaPalettPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Luftfracht Paletten - Leer"], _plcasemed] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
			// Parent Action für Luftfracht Paletten  - Logistik
			_palettenLF = ["Luftfracht Paletten - Logistik","Luftfracht Paletten  - Logistik",_iconPl,{ },{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _palettenLF] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
				_plfmun = ["plfmun","Typ 5 - Fahrzeugmunition",_icon,{[["plfmun",_this#0], limapfad + "limaPalettPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Luftfracht Paletten - Logistik"], _plfmun] call ace_interact_menu_fnc_addActionToObject;

				_plfuels = ["plfuels","Typ 6 - Treibstoff Klein",_icon,{[["plfuels",_this#0], limapfad + "limaPalettPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Luftfracht Paletten - Logistik"], _plfuels] call ace_interact_menu_fnc_addActionToObject;

				_plfuell = ["plfuell","Typ 7 - Treibstoff Gross",_icon,{[["plfuell",_this#0], limapfad + "limaPalettPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Luftfracht Paletten - Logistik"], _plfuell] call ace_interact_menu_fnc_addActionToObject;

				_plrepair = ["plcasetan","Typ 8 - Instandsetzung",_icon,{[["plrepair",_this#0], limapfad + "limaPalettPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Luftfracht Paletten - Logistik"], _plrepair] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
		} forEach [limapalettpointstatic];
	};
};

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						
//
//------------------------------------------------------------------
//------------------------------------------------------------------

//Wenn das Missionsintro gestartet wurde, werden alle Spieler die reconnecten oder später dazu kommen in die Basis teleportiert.
if (getMissionConfigValue "missionstartedfeat" == "true") then {
	if missionstarted then {
		player setPos getPos GR_baseFlag;
	};
};

sleep 1;

titleText ["Missionsvorbereitung", "BLACK IN" ];

//Blurry Back to Visuals
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 3;

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						Mod Check
//
// 			Checks Loaded Mods and logs Non Whitelisted
//------------------------------------------------------------------
//------------------------------------------------------------------

_modCheck = ["GR_modCheckParam", 1] call BIS_fnc_getParamValue;
if (_modCheck != 0) then {
	[] execVM "scripts\core\modcheck.sqf";
};

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//					CTAB Templates
//
//------------------------------------------------------------------
//------------------------------------------------------------------

["maps-beta.plan-ops.fr#72",0,"Lima Bestellung","NACHSCHUB",
    "https://maps-beta.plan-ops.fr/MessageTemplates/Details/72?t=IuD-E8bp3bR6YMgy5FchCdiEwA5NpaRv80CgM61cqSA",
    [
        ["NACHSCHUB","",[]],
        ["","",[["• 1.0-ALL: ","Bedarf aller Gruppen des Zuges abgefragt",0],[" • 1.1-OKK: ","Freigabe von Kilo",0]]],
        ["","",[["• 2.1-ANF: ","Anfordernde Stelle",3],[" • 2.2-FRQ: ","Frequenz der Anforderer",4],[" • 2.3-BLZ: ","Blufor an LZ",0]]],
        ["","",[["• 3.1-TYP: ","Typ + Menge der Kisten",8]]],
        ["","",[["• 4.1-LZN: ","LZ Position/Name",5],[" • 4.2-LZI: ","LZ Markierung (Rauch/Licht)",0],[" • 4.3-LZW: ","LZ Hindernisse",0]]],
        [": • 5.1-RST","",[["rückführen","",6],["zurücklassen","",6]]],
        ["","",[["• 6.1-AUS: ","Ausführung (ASAP/Zeit/Befehl)",0],[" • 6.2-CHK: ","gecheckt von",0]]]
    ]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#106",0,"SANSTAT","SANSTAT",
    "https://maps-beta.plan-ops.fr/MessageTemplates/Details/106?t=i5su5j6-gSMte_qUqtg0sqL0lX14zPs-IHg7LlzY8DM",
    [
        ["SANSTATUS","",[]],
        ["","Auskunft",[["1.0-AUS: ","Auskünftige Stelle",3]]],
        ["","Status Auskunft",[["2.0-LAUS:","Sanlage",6],["0","Grün",6],["1","Gelb",6],["2","Rot",6],["A","Blau",6],["B","Schwarz",6],["2.1-MAUS:","Sanmat",6],["0","Grün",6],["1","Gelb",6],["2","Rot",6]]],
        ["","Status Alpha/Zulu",[["3.0-LSE:","Sanlage",6],["0","Grün",6],["1","Gelb",6],["2","Rot",6],["A","Blau",6],["B","Schwarz",6],["3.1-MSE:","Sanmat",6],["0","Grün",6],["1","Gelb",6],["2","Rot",6]]],
        ["","Status Bravo/Yankee",[["4.0-LWG:","Sanlage",6],["0","Grün",6],["1","Gelb",6],["2","Rot",6],["A","Blau",6],["B","Schwarz",6],["4.1-MWG:","Sanmat",6],["0","Grün",6],["1","Gelb",6],["2","Rot",6]]],
        ["","Status Charlie/X-Ray",[["5.0-LSZ:","Sanlage",6],["0","Grün",6],["1","Gelb",6],["2","Rot",6],["A","Blau",6],["B","Schwarz",6],["5.1-MSZ:","Sanmat",6],["0","Grün",6],["1","Gelb",6],["2","Rot",6]]],
        ["","Status Sonstige",[["6.0-LEX:","Sanlage",6],["0","Grün",6],["1","Gelb",6],["2","Rot",6],["A","Blau",6],["B","Schwarz",6],["6.1-MEX:","Sanmat",6],["0","Grün",6],["1","Gelb",6],["2","Rot",6],["6.2-CEX","Callsign",0]]]
    ]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#134",3,"LZ Briefing (Lima)","LZ Briefing (Lima)",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/134?t=fygGyJ1NySMG_sL9OmHirTziuDQu3UleSSual7J8d_U",
		[
			["LZ Briefing (Lima)","",[]],
			["Line 1","",[["Anfordernde Einheit: ","",0],["Frequenz: ","",0]]],
			["Line 2","",[["LZ Name: ","",0],["LZ Markierung: ","",0]]],
			["Line 3","",[["Hindernisse: ","",0],["Göße & Lage: ","",0],["LZ Status: ","",0]]],
			["Line 4","",[["Auftragsart: ","",0]]],
			["Line 5","",[["Ausführungsansatz: ","",0],["Weitere Informationen: ","",0]]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#133",3,"LZ Briefing (Romeo):","LZ Briefing (Romeo):",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/133?t=OQgChw5LM0QPohp4NYjgaeqwaux6hoae8DfE63TcENs",
		[
			["LZ Briefing (Romeo):","",[]],
			["Coordinator Callsign","",[["","",0]]],
			["Aircraft Callsign","",[["","",0]]],
			["Coordination Frequency","",[["","",0]]],
			["LZ Position","",[["","",0]]],
			["Mark","",[["","",0]]],
			["Altitude & Size","",[["","",0]]],
			["Obstacles","",[["","",0]]],
			["Friendly Position","",[["","",0]]],
			["Hostile Position","",[["","",0]]],
			["Situation","",[["","",0]]],
			["Routing","",[["Ingress: ","",0],["Egress: ","",0]]],
			["Cargo","",[["Passengers: ","",0],["Cargo: ","",0]]],
			["Remarks","",[["","",0]]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#114",3,"CCA Check-In","CCA Check-In",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/114?t=-raxWlW2prP2GSXweE--6nnANTpyH-03yaP-3ANTGdg",
	[
		["CCA Check-In","",[]],
		["Line 1","",[["","Callsign Bodeneinheit",0],[", this is ","Callsign LFZ",0]]],
		["Line 2","",[["Aircraft Team Composition and Location: ","",0]]],
		["Line 3","",[["Munitions available: ","",0],["Guns, ","",6],["Rockets, ","",6],["Missiles","",6]]],
		["Line 4","",[["Nightvision available, ","",6],["Thermals available, ","",6],["Radar available","",6]]],
		["Line 5","",[["Station Time: ","",0]]]
	]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#115",3,"CCA","CCA",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/115?t=Q-z2udQadY2OtQn_mF8kgf1WZaA5Pf0mCVmOwzn2nkg",
		[
			["CCA","",[]],
			["Line 1","",[["Aircraft Callsign: ","",0],["Observer Callsign: ","",0]]],
			["Line 2","",[["My position ","TRP, Grid, etc.)",0],[", marked by","(Rauch, Flare, etc.)",0]]],
			["Line 3","",[["Target Location: ","",0]]],
			["Line 4","",[["","Description",0],[", maked by ","(Smoke, Laser, etc.)",0]]],
			["Line 5","",[]],
			["AA-Threat","",[["AAA,","",6],["MANPADS,","",6],["SAM,","",6],["Aircraft,","",6],["Fighters","",6]]],
			["Danger Close","",[["Yes, ","Position & Markierung",0],["No","",6]]],
			["Restrictions:","",[["Yes, ","",0],["No","",6]]],
			["At my Command","",[["Yes","",6],["No","",6]]],
			["Over.","",[]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#109",3,"Check-In","Check-In",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/109?t=OB5iHHtfNKFBdi9t3BZXKd4Nf1gYuSJb2XMnT8kIfVU",
		[
			["Check-In","",[]],
			["1","",[["Callsign: ","",0]]],
			["2","",[["Package Composition: ","(z.b. 1 Lynx)",0]]],
			["3","",[["Position: ","(z.B. Verfügungsraum Kiel)",0],[", Altitude: ","(in m)",0]]],
			["4","",[["Ordnance: ","(z.B. 4x Hellfire radar Guided, 20mm Canon)",0]]],
			["5","",[["Time on Station: ","(z.b. 90min)",0]]],
			["6","",[["Sensors & Capabilities: ","(z.B. Radar, 8 Transport slots)",0]]],
			["7","",[["Abort Code: ","(z.B. "" 3x Sonne oder Gelber Rauch/Flare"")",0]]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#113",0,"SpotRep","SpotRep",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/113?t=q8vFuLc83UXjsxdbmBngSYUGiST5wYLg0UW5GfNUI4I",
		[
			["SpotRep","",[]],
			["Line 1","",[["Size: ","",0]]],
			["Line 2","",[["Activity: ","",0]]],
			["Line 3","",[["Uniform / Unit: ","",0]]],
			["Line 4","",[["Time: ","",0]]],
			["Line 5","",[["Equipment: ","",0]]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#110",0,"Situation Report","Situation Report",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/110?t=NKi3rjL9PQFMKUmF6Uyf0oCkvPGIcWoOzX0rZF4XLZw",
		[
			["Situation Report","",[]],
			["Threats","",[["","",0]]],
			["Enemy Situation","",[["","",0]]],
			["Friendly Situation","",[["","",0]]],
			["Artillery","",[["","",0]]],
			["Clearance Auth.","",[["","",0]]],
			["Hazards","",[["","",0]]],
			["Restrictions","",[["","",0]]],
			["Remarks","",[["","",0]]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#131",3,"Sensor Tasking","Sensor Tasking",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/131?t=xnNWWNOjhG1dEKAsTwysBRAmUNtU_FoW2AcHT9k4jkU",
		[
			["Sensor Tasking","",[]],
			["Line 1","",[["Aircraft Callsign: ","",0],[" JTAC Callsign: ","",0]]],
			["Line 2","",[["Requested Sensor: ","",0]]],
			["Line 3","",[["Target Area: ","",0],["Radius: ","",0]]],
			["Line 4","",[["Friendly Units: ","",0]]],
			["Line 5","",[["Purpose of Sensor Tasking: ","",0]]],
			["Line 6","",[["Remarks: ","",0]]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#108",3,"5 Line RW CAS","5 Line RW CAS",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/108?t=aVlvWsJkG9b33GlkEsLnnw5GSfX4nYw0SdEv9hDPdcI",
		[
			["5 Line RW CAS","",[]],
			["Line 1","",[["","Aircraft Callsign",0],[",","JTAC Callsign",0],[", 5-Line, Type 1 Control,","",6],[", 5-Line, Type 2 Control,","",6],[", 5-Line, Type 3 Control,","",6],["MoA BoC,","",6],["MoA BoT,","",6],["Ordnance Requested:","",0]]],
			["Line 2","",[["My Position:","",5],[", marked by: ","(Smoke, Strobe, etc.)",0]]],
			["Line 3","",[["Target Location,","(TRP; Grid; etc.)",0]]],
			["Line 4","",[["","(Target Description)",0],[", marked by ","(Laser, IR point, Smoke, etc.)",0]]],
			["Line 5","",[]],
			["AA-Threat","",[["No","",6],["MANPADS, ","",6],["AAA, ","",6],["SAM,","",6],["Aircraft,","",6],["Fighters","",6]]],
			["Final Attack Heading","",[["","",0]]],
			["Laser Code","",[["","",0]]],
			["Danger Close","",[["No","",6],["Yes, ","(Gruppen & Position)",8]]],
			["Ingress via","",[["","(e.g. North West)",0],[", Egress via: ","(e.g. South East)",0]]],
			["Additonal Calls Requested","",[["No","",6],["Yes,","",0]]],
			["Additional Remarks","",[["","",0]]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#132",3,"9-Line","9-Line",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/132?t=5-xeHVKpcRwxiD7e5FewzsZTQ0QO5363wpb4wiVbwsY",
		[
			["9-Line","",[]],
			["Game Plan:","",[["Type of Control: ","",0],["Method of Attack: ","",0],["Ordnance: ","",0]]],
			["Line 1. IP","",[["","",0]]],
			["Line 2. Heading","",[["","",0]]],
			["Line 3. Distance","",[["","",0]]],
			["Line 4. TGT Elevation","",[]],
			["Line 5. TGT Description","",[["","",0]]],
			["Line 6. TGT Location","",[["","",0]]],
			["Line 7. Mark","",[["","",0]]],
			["Line 8. Friendlies","",[["","",0]]],
			["Line 9. Egress","",[["","",0]]],
			["Remarks / Restrictions","",[["","",0]]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#112",2,"CFF","CFF",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/112?t=cvPtVtb3lzRe4q7OSoM_deL4e9jJEsl76s7DzyHnXUw",
		[
			["CFF","",[]],
			["Line 1","",[["JTAC Callsign: ","",0],[", Battery Callsign: ","",0],[", Firemission ID:","",0]]],
			["Line 2","",[["Type of Mission: Adjust Fire","",6],["Type of Mission: Fire for Effect","",6],["Type of Mission: Suppress","",6],["Type of Mission: Immediate Suppression","",6],[", Size of Element to Fire: ","(z.B. Batterie, 2 Geschütze, etc.)",0],[", Method of Target Location: Grid","",6],[", Method of Target Location: Polar","",6],[", Method of Target Location: Shift from known Point","",6]]],
			["Line 3: Target Location","",[["Grid - ","",0],["Polar - ","",0],["Shift from Known Point - ","",0]]],
			["Line 4","",[["Target Description: ","",8]]],
			["Line 5: Method of Engagement","",[["Fire Type: Area, ","",6],["Fire Type: Precision, ","",6],["Danger Close: Yes, ","",0],["Danger Close: No, ","",6],["Ammo Load: Uniform, ","",6],["Ammo Load: Mixed, ","",6],["Ammo Type & Amount: ","",0],[", Sheaf: Converged","",6],[", Sheaf: Special: ","",0],[", Sheaf: Open","",6],[", Sheaf: Parallel","",6],[", Sheaf: Standard","",6],["Suppression Time: ","",0],["RPM: ","",0]]],
			["Line 6: Method of Control","",[["Fire when Ready","",6],["At my Command","",6],["Time on Target: ","",0],["Check Fire","",6],["Cannot Observe","",6],["Continuous Illum.","",6],["Continuos Fire: ","",0],["Cease Loading","",6],["Repeat","",6]]],
			["Line 7","Comments",[["Comments: ","",0]]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#111",0,"BDA","BDA",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/111?t=0XnLZlGcpssZXrkPZSSXRgCfo9PN9HtOwdbuw_BtBks",
		[
			["BDA","",[]],
			["Hits","",[["Direct Hit","",6],["Close Hit","",6],["Deviation","",6],["Miss","",6]]],
			["Effect","",[["Good Effect","",6],["Effect","",6],["Bad Effect","",6],["No Effect","",6]]],
			["TGT Status","",[["","",0]]],
			["Observer Target Line (in Mil)","",[["","",1]]],
			["Deviation","",[["Add: ","",0],["Drop: ","",0],["Left: ","",0],["Right: ","",0]]],
			["Behavior","",[["Repeat","",6],["Repeat with corrections","",6],["End of Firemission","",6]]]
		]
] call ctab_fnc_registerMessageTemplate;


["maps-beta.plan-ops.fr#117",2,"Batteriebefehl","Batteriebefehl",
	"https://maps-beta.plan-ops.fr/MessageTemplates/Details/117?t=E2HADcKnKbfqYGqXgNdNEza6qLIGBLaDp9MbnOOJpYw",
		[
			["Batteriebefehl","",[]],
			["Sheaf","",[["Converged","",6],["Open","",6],["Parallel","",6],["Standard","",6],["Special: ","",0]]],
			["Einzelberechnung?","",[["Ja","",6],["Nein","",6]]],
			["Geschütz Alpha","",[["Azimuth: ","",0],["Charge: ","",0],["Elevation: ","",0],["Munitionstyp: ","",0],["Delay: ","",0]]],
			["Geschütz Bravo","",[["Azimuth:","",0],["Charge:","",0],["Elevation:","",0],["Munitionstyp:","",0],["Delay:","",0]]],
			["Geschütz Charlie","",[["Azimuth:","",0],["Charge: ","",0],["Elevation:","",0],["Munitionstyp:","",0],["Delay:","",0]]],
			["Geschütz Delta","",[["Azimuth:","",0],["Charge: ","",0],["Elevation:","",0],["Munitionstyp:","",0],["Delay:","",0]]]
		]
] call ctab_fnc_registerMessageTemplate;