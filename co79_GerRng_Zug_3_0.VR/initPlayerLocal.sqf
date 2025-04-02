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
//						Sandstorm Effect
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

if (getMissionConfigValue "limaSupplyPoints" == "true") then {
	if (_playerGrp == grplima || _playerGrp == grpkilo || _playerGrp == grphotel || _playerGrp == grpmike) then {
		
		// Icon für Boxen-deploy
		_icon = "a3\ui_f\data\igui\cfg\cursors\iconboardin_ca.paa";
		_iconEod = "a3\ui_f\data\igui\cfg\simpletasks\types\mine_ca.paa";
		_iconCBRN = "z\ace\addons\medical_gui\data\categories\airway_management.paa";
		_iconWaGru = "a3\ui_f\data\gui\rsc\rscdisplayarsenal\secondaryweapon_ca.paa";
		_iconWaGruStatic = "a3\ui_f\data\map\vehicleicons\iconcrategrenades_ca.paa";
		_iconZug = "a3\ui_f\data\gui\rsc\rscdisplayarsenal\cargomagall_ca.paa";
		_iconErsatz = "a3\ui_f\data\igui\cfg\actions\repair_ca.paa";
		_iconSan = "a3\ui_f\data\igui\cfg\simpletasks\types\heal_ca.paa";
		_iconBodybags = "z\ace\addons\medical_gui\ui\grave.paa";
		_iconSierra = "a3\weapons_f\data\ui\icon_sniper_ca.paa";
		_iconVerpflegung ="z\ace\addons\field_rations\ui\icon_hud_hungerstatus.paa";


		// Lima Supply Point Static & Mobile
		{
			// Parent Action für Zug Boxen
			_zugBoxen = ["Zug Boxen","Zug Boxen",_iconZug,{ },{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _zugBoxen] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
				_zug1 = ["Zug1","Zug Typ 1 - Munition",_icon,{[["zug1",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug1] call ace_interact_menu_fnc_addActionToObject;

				_zug2 = ["Zug2","Zug Typ 2 - LMG-Munnition",_icon,{[["zug2",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug2] call ace_interact_menu_fnc_addActionToObject;

				_zug3 = ["Zug3","Zug Typ 3 - Unterlaufgranaten",_icon,{[["zug3",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug3] call ace_interact_menu_fnc_addActionToObject;

				_zug4 = ["Zug4","Zug Typ 4 - Granaten",_icon,{[["zug4",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug4] call ace_interact_menu_fnc_addActionToObject;

				_zug5 = ["Zug5","Zug Typ 5 - Ausrüstung",_icon,{[["zug5",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug5] call ace_interact_menu_fnc_addActionToObject;

				_zug6 = ["Zug6","Zug Typ 6 - Anti-Tank",_icon,{[["zug6",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug6] call ace_interact_menu_fnc_addActionToObject;

				_zug7 = ["Zug7","Zug Typ 7 - Elektronik",_icon,{[["zug7",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug7] call ace_interact_menu_fnc_addActionToObject;

				_zug8 = ["Zug10","Zug Typ 8 - Munition HK417",_icon,{[["zug8",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug8] call ace_interact_menu_fnc_addActionToObject;

				_zug9 = ["Zug10","Zug Typ 9 - Flashbangs",_icon,{[["zug9",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Zug Boxen"], _zug9] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
			// Parent Action für WaGru Boxen
			_waGruBoxen = ["WaGru Boxen","WaGru Boxen",_iconWaGru,{ },{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _waGruBoxen] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
				_wagru1 = ["WaGru1","WaGru Typ 1 - MG3",_icon,{[["WaGru1",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru1] call ace_interact_menu_fnc_addActionToObject;
							
				_wagru2 = ["wagru2","WaGru Typ 2 - Mk48",_icon,{[["WaGru2",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru2] call ace_interact_menu_fnc_addActionToObject;
							
				_wagru3 = ["wagru3","WaGru Typ 3 - MAAWS",_icon,{[["wagru3",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru3] call ace_interact_menu_fnc_addActionToObject;

				_wagru4 = ["wagru4","WaGru Typ 4 - MAAWS Sondermunition",_icon,{[["wagru4",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru4] call ace_interact_menu_fnc_addActionToObject;
							
				_wagru5 = ["wagru4","WaGru Typ 5 - Titan AT",_icon,{[["wagru5",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru5] call ace_interact_menu_fnc_addActionToObject;
							
				_wagru6 = ["wagru6","WaGru Typ 6 - Titan AA",_icon,{[["wagru6",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru6] call ace_interact_menu_fnc_addActionToObject;
							
				_wagru7 = ["wagru7","WaGru Typ 7 - Metis",_icon,{[["wagru7",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru7] call ace_interact_menu_fnc_addActionToObject;
				
				_wagru8 = ["wagru8","WaGru Typ 8 - Combat Engineering",_icon,{[["wagru8",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen"], _wagru8] call ace_interact_menu_fnc_addActionToObject;

			
			_waGruBoxenStatic = ["WaGru Boxen Static","WaGru Boxen Static",_iconWaGruStatic,{ },{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _waGruBoxenStatic] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
				_wagrustat1 = ["WaGruStat1","WaGruStat Typ 1 - M2 Waffe",_icon,{[["WaGruStat1",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat1] call ace_interact_menu_fnc_addActionToObject;

				_wagrustat2 = ["WaGruStat2","WaGruStat Typ 2 - M2 Munition",_icon,{[["WaGruStat2",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat2] call ace_interact_menu_fnc_addActionToObject;

				_wagrustat3 = ["WaGruStat3","WaGruStat Typ 3 - Mk19 Waffe",_icon,{[["WaGruStat3",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat3] call ace_interact_menu_fnc_addActionToObject;

				_wagrustat4 = ["WaGruStat4","WaGruStat Typ 4 - Mk19 Munition",_icon,{[["WaGruStat4",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat4] call ace_interact_menu_fnc_addActionToObject;

				_wagrustat5 = ["WaGruStat5","WaGruStat Typ 5 - TOW Waffe",_icon,{[["WaGruStat5",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat5] call ace_interact_menu_fnc_addActionToObject;

				_wagrustat6 = ["WaGruStat6","WaGruStat Typ 6 - TOW Munition",_icon,{[["WaGruStat6",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat6] call ace_interact_menu_fnc_addActionToObject;

				_wagrustat7 = ["WaGruStat7","WaGruStat Typ 7 - 82mm Mörser Waffe",_icon,{[["WaGruStat7",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat7] call ace_interact_menu_fnc_addActionToObject;

				_wagrustat8 = ["WaGruStat8","WaGruStat Typ 8 - 82mm Munition HE",_icon,{[["WaGruStat8",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat8] call ace_interact_menu_fnc_addActionToObject;

				_wagrustat9 = ["WaGruStat9","WaGruStat Typ 9 - 82mm Sondermunition",_icon,{[["WaGruStat9",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat9] call ace_interact_menu_fnc_addActionToObject;

				_wagrustat10 = ["WaGruStat10","WaGruStat Typ 10 - 60mm Mörser und Standardmunition",_icon,{[["WaGruStat10",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat10] call ace_interact_menu_fnc_addActionToObject;

				_wagrustat11 = ["WaGruStat1","WaGruStat Typ 11 - 60mm Sondermunition",_icon,{[["WaGruStat11",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "WaGru Boxen Static"], _wagrustat11] call ace_interact_menu_fnc_addActionToObject;


				//------------------------------------------------------------------
			// Parent Action für EOD Boxen
			_eodBoxen = ["EOD Boxen","EOD Boxen",_iconEod,{ },{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _eodBoxen] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
				_eod1 = ["EOD1","EOD Typ I - Anzug",_icon,{[["eod1",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions","EOD Boxen"], _eod1] call ace_interact_menu_fnc_addActionToObject;	
			
				_eod2 = ["EOD2","EOD Typ II - Drohne",_icon,{[["eod2",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions","EOD Boxen"], _eod2] call ace_interact_menu_fnc_addActionToObject;	
			
				_eod3 = ["EOD3","EOD Typ III - Ausrüstung",_icon,{[["eod3",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions","EOD Boxen"], _eod3] call ace_interact_menu_fnc_addActionToObject;

				_eod4 = ["EOD3","EOD Typ IV - Zug",_icon,{[["eod4",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions","EOD Boxen"], _eod4] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
			// Parent Action für CBRN Boxen
			_cbrnBoxen = ["CBRN Boxen","CBRN Boxen",_iconCBRN,{ },{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _cbrnBoxen] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
				_cbrn1 = ["CBRN1","Typ 1 - CBRN-Schutz",_icon,{[["cbrn1",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "CBRN Boxen"], _cbrn1] call ace_interact_menu_fnc_addActionToObject;

				_cbrn2 = ["CBRN2","Typ 2 - CBRN-Erkundung",_icon,{[["cbrn2",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "CBRN Boxen"], _cbrn2] call ace_interact_menu_fnc_addActionToObject;

				_cbrn3 = ["CBRN3","Typ 3 - CBRN-UGV",_icon,{[["cbrn3",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "CBRN Boxen"], _cbrn3] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
			// Parent Action für San Boxen
			_sanBoxen = ["San Boxen","San Boxen",_iconSan,{ },{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _sanBoxen] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
				_san1 = ["San1","San Typ 1 - SanMat",_icon,{[["san1",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "San Boxen"], _san1] call ace_interact_menu_fnc_addActionToObject;	
			
				_san2 = ["San2","San Typ 2 - Leichensäcke",_iconBodybags,{[["san2",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "San Boxen"], _san2] call ace_interact_menu_fnc_addActionToObject;	

				_san3 = ["San3","San Typ 3 - Verpflegung",_iconVerpflegung,{[["san3",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "San Boxen"], _san3] call ace_interact_menu_fnc_addActionToObject;	
				//------------------------------------------------------------------
			// Parent Action für Ersatzteile
			_ersatzteile = ["Ersatzteile","Ersatzteile",_iconErsatz,{ },{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _ersatzteile] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
				_ersatzKette = ["ersatzKette","Ersatzkette",_icon,{[["ersatzkette",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Ersatzteile"], _ersatzKette] call ace_interact_menu_fnc_addActionToObject;

				_ersatzRad = ["ersatzRad","Ersatzrad",_icon,{[["ersatzrad",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions", "Ersatzteile"], _ersatzRad] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------

// Parent Action für Sierra
			_Sierra = ["Sierra","Sierra",_iconSierra,{ },{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _Sierra] call ace_interact_menu_fnc_addActionToObject;
				//------------------------------------------------------------------
			_sierra1 = ["Sierra1","Sierra Typ 1- Trupp 1 - S",_icon,{[["sierra1",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions", "Sierra"], _sierra1] call ace_interact_menu_fnc_addActionToObject;

			_sierra2 = ["Sierra2","Sierra Typ 2 - Trupp 1 - A",_icon,{[["sierra2",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions", "Sierra"], _sierra2] call ace_interact_menu_fnc_addActionToObject;

			_sierra3 = ["Sierra3","Sierra Typ 3 - Trupp 2 - U",_icon,{[["sierra3",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions", "Sierra"], _sierra3] call ace_interact_menu_fnc_addActionToObject;

			_sierra4 = ["Sierra4","Sierra Typ 4 - Trupp 2 - ST",_icon,{[["sierra4",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions", "Sierra"], _sierra4] call ace_interact_menu_fnc_addActionToObject;

			_sierra5 = ["Sierra5","Sierra Typ 5 - Ausrüstung",_icon,{[["sierra5",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions", "Sierra"], _sierra5] call ace_interact_menu_fnc_addActionToObject;
			//------------------------------------------------------------------

			_supply = ["Supply","Transport Box (leer)",_icon,{[["supply",_this#0], limapfad + "limaSupplyPoints.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
			[_x, 0, ["ACE_MainActions"], _supply] call ace_interact_menu_fnc_addActionToObject;


			
		} forEach [limasupplypointstatic,limasupplypointmobile];		
	};
};

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

//FoggyBreath
//_units = if (!isMultiplayer) then {switchableUnits} else {playableUnits};
//{[_x, 0.03] execVM "scripts\core\foggy_breath.sqf"} forEach _units;

//Ground Fog
//null = [] execVM "scripts\core\GroundFog.sqf";

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
