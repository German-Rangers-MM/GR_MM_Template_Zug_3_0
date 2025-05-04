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
sleep 1;

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
