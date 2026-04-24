//------------------------------------------------------------------
//------------------------------------------------------------------
//
//							Variablen
//
//------------------------------------------------------------------
//------------------------------------------------------------------

// Konfiguriert in description.ext

// DynamicGroups_Function Function needs to be initialized on server and client. Clients can then use action TeamSwitch ("U" by default) to access the Dynamic Groups interface.
if (getMissionConfigValue "dynamicGroupsFeat" == "true") then {
	["Initialize"] call BIS_fnc_dynamicGroups;	//Exec on Server
};
// Wird benötigt damit alle Spieler zu Beginn der Mission VOR DEM INTRO, egal an welchem Ort sie sich befinden, ein Personal Arsenal und das Loadoutmenü zur Verfügung haben. Wird mit Missionsstart auf true gesetzt. 
if (getMissionConfigValue "missionstartedfeat" == "true") then {
	missionstarted = false;
}
else {
	missionstarted = true;
};

publicVariable "missionstarted";

fraktionV = getMissionConfigValue "fraktion";
publicVariable "fraktionV";

tarnfarbeV = getMissionConfigValue "tarnfarbe";
publicVariable "tarnfarbeV";

waffenkammerpfad = format ["loadouts\%1\waffenkammer.sqf", fraktionV];
publicVariable "waffenkammerpfad";

limapfad = format ["loadouts\%1\lima\", fraktionV];
publicVariable "limapfad";

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//							Fortify Tool
//
//				Unterteilt in Woodland oder Arid 
//
//------------------------------------------------------------------
//------------------------------------------------------------------

/*
Fortify Tool
https://ace3.acemod.org/wiki/framework/fortify-framework.html

 Registers the given objects in the given side's player interaction menu.
* Players on that side must have the `Fortify Tool` item in their inventory to access the menu.
* Classnames must be in the format [<classname>, <cost>, <category(optional)>]
* MUST BE CALLED ON SERVER!
*
* Arguments:
* 0: Side <SIDE>
* 1: Budget <NUMBER>
* 2: Object Classnames <ARRAY>
*
* Example:
* [west, 5000, [["Land_BagFence_Long_F", 5], ["Land_BagBunker_Small_F", 50]]] call ace_fortify_fnc_registerObjects

Unterteilt in Woodland oder Arid 
Fortify Baumoeglichkeiten Objekt, kosten(bauzeit)
Bauzeit: Ist immer (x * 8) + 20, sprich eine Bauzeit "1" ist 28 Sekunden, "2" ist 36, "0.5" ist 24 und "-1" ist 12 Sekunden
*/
/*
//Woodland
if isClass (configFile >> "CfgPatches" >> "ace_main") then
{
	[west, -1, [

	["RoadCone_L_F",-2],
	["PortableHelipadLight_01_red_F",-2],
	
	["RoadBarrier_F",0],
	["Land_PortableLight_double_F",0],
	["Land_Plank_01_4m_F",0],

	["Land_Razorwire_F",1],
	["Land_Plank_01_8m_F",1],
	
	["Land_CzechHedgehog_01_new_F",2],
	["Land_CncBarrier_stripes_F",2],
	
	["Land_SandbagBarricade_01_half_F",3],
	
	["Land_SandbagBarricade_01_F",4],
	["Land_SandbagBarricade_01_hole_F",4],
	["Land_BarGate_F",4],
	
	//Woodland Specific
	["Land_BagFence_01_long_green_F",4],
	["Land_BagFence_01_round_green_F",4],
	
	["Land_BagBunker_01_small_green_F",15],
	
	["Land_HBarrier_01_line_3_green_F",20],
	
	["CamoNet_BLUFOR_F",5],
	["CamoNet_BLUFOR_open_F",5],
	["CamoNet_BLUFOR_big_F",5],
	["GerRng_MedTent_01",5]
	]] call acex_fortify_fnc_registerObjects;
};
*/
/*
//Arid
if isClass (configFile >> "CfgPatches" >> "ace_main") then
{
	[west, -1, [

	["RoadCone_L_F",-2],
	["PortableHelipadLight_01_red_F",-2],
	
	["RoadBarrier_F",0],
	["Land_PortableLight_double_F",0],
	["Land_Plank_01_4m_F",0],

	["Land_Razorwire_F",1],
	["Land_Plank_01_8m_F",1],
	
	["Land_CzechHedgehog_01_new_F",2],
	["Land_CncBarrier_stripes_F",2],
	
	["Land_SandbagBarricade_01_half_F",3],
	
	["Land_SandbagBarricade_01_F",4],
	["Land_SandbagBarricade_01_hole_F",4],
	["Land_BarGate_F",4],
	
	//Woodland Specific
	["Land_BagFence_Long_F",4],
	["Land_BagFence_Round_F",4],
	
	["Land_BagBunker_Small_F",15],
	
	["Land_HBarrier_3_F",20],
	
	["CamoNet_OPFOR_F",5],
	["CamoNet_OPFOR_open_F",5],
	["CamoNet_OPFOR_big_F",5],
	["GerRng_MedTent_01",5]
	]] call acex_fortify_fnc_registerObjects;
};
*/

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//							Datenbank
//
//------------------------------------------------------------------
//------------------------------------------------------------------

if (getMissionConfigValue "useDBMapMarkers" == "true") then {

	//LOADOUTS SPEICHERN
	"checkForDatabase" addPublicVariableEventHandler
	{
		private ["_data"];
		_data = (_this select 1);
		_clientID = (_data select 0);
		_player = (_data select 1);
		_playerName = (_data select 2);
		
		_inidbi = ["new",str _player] call OO_INIDBI;
		_fileExist = "exists" call _inidbi;
		
		if (_fileExist) then
		{
			hint "DATENEINTRAG VORHANDEN, WIRD ABGERUFEN";
			null = [_player, _clientID] execVM "getData.sqf";
		}
		else
		{
			hint "KEIN DATENEINTRAG VORHANDEN, WIRD ERSTELLT";
			null = [_player, _playerName] execVM "createDatabase.sqf";
		};
	};

	addMissionEventHandler ["HandleDisconnect",
	{
		_unit = _this select 0;
		_uid = _this select 2;
		_gear = getUnitLoadout _unit;
		
		_inidbi = ["new",str _unit] call OO_INIDBI;
		
		["write", ["Player Gear", "Gear", _gear]] call _inidbi;
		false;
	}];

	// MAP-MARKER SPEICHERN
	_inidbi = ["new", "MapMarkers"] call OO_INIDBI;
	_fileExist = "exists" call _inidbi;

	if(_fileExist) then
	{
		_markers = ["read",["markers","marker"]] call _inidbi;
		{
			if (_x find "_USER_DEFINED #" != -1) then {
				deleteMarker _x ;
			} ;
		} forEach allMapMarkers ;
		{
			_x params [
				"_name",
				"_pos",
				"_size",
				"_type",
				"_col",
				"_txt",
				"_dir"
			] ;
			
			_marker = createMarker [_name, _pos];
			_marker setMarkerShape "ICON" ;
			_marker setMarkerSize _size ;
			_marker setMarkerType _type ;
			_marker setMarkerColor _col ;
			_marker setMarkerText _txt ;
			_marker setMarkerDir _dir;
		} forEach _markers;
	};

	saveMarkers = {
		_inidbi = ["new", "MapMarkers"] call OO_INIDBI;
		_array = _this;
		
		["write", ["markers","marker",_array]] call _inidbi;

	};
};