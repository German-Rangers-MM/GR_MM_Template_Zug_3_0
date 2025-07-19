params ["_oldSlot"];
if (isNil "_oldSlot") then { _oldSlot = true; };
if (isNil "RCOPsaveComplete") then { RCOPsaveComplete = 0 };

diag_log text "";
diag_log text format["|================== [GR_PERSIST]: Speicher-Prozess Start - Time: %1   =============================|", time];
diag_log text "";

hint "GR_PERSIST: Starting PERSIST save.";

// SUSPICIOUS CODE, MAY BE CAUSING MAP LOAD PROBLEMS
if (isPlayer player) then {
	_markerData = [];
	_markerData = call RCOP_fnc_RCOPsavingMarkers;

	player setVariable ["rimmy_camp_var_markerPass",_markerData,true];
	};

hint "GR_PERSIST: Your map marker data has been saved, full save proceeding...";

sleep 1;

if (isServer) then {	

	diag_log text "";
	diag_log text format["|================== [GR_PERSIST SERVER]: Speicher-Prozess Start - Time: %1   =============================|", time];
	diag_log text "";

	{if (count units _x == 0) then {deleteGroup _x}} forEach allGroups;
	
	private _recGroupLeaderSide = [];
	private _recGroupLocation = [];
	private _recGroupVehicle = [];
	private _recGroupLeader = [];
	private _recGroupLeaderType = [];
	private _recGroupCallsign = [];
	private _recGroupNumbers = [];
	private _recContainerArray = [];
	private _fobAnchorLoc = [];
	private _list = [];
	private _finalPass = [];
	private _finalMinePass = [];
	private _DAMminefieldMarkerPass = [];
	private _finalCrateCargo = [];
	private _finalCratePass = [];
	private _finalCrateStats = [];	
	private _vehicleDamage = [];
	private _vehicleTurrets = [];
	private _vehiclePylonInfo = [];
	private _crateBudget = [];
	private _FOBMarker = rimmy_camp_var_FOBMarker;
	private _permittedObjects = rimmy_camp_var_permittedFOBObjects;
	private _cratesToSave = rimmy_camp_var_cratesToSave;
	private _permittedMines = rimmy_camp_var_permittedMines;
	fobDeleteBlockerGlobal = rimmy_camp_var_fobDeleteBlocker;
	
	if (_FOBMarker == "") then {_FOBMarker = "Land_PortableCabinet_01_closed_black_F";};
	if (_permittedObjects isEqualTo []) then {_permittedObjects= ["Land_BagFence_Long_F","Land_BagBunker_Small_F","Land_Plank_01_4m_F","Land_PortableCabinet_01_closed_black_F"];};
	if (_cratesToSave isEqualTo []) then {_cratesToSave = ["B_supplyCrate_F","B_Truck_01_box_F"];};
	if (_permittedMines isEqualTo []) then {_permittedMines = ["ATMine_Range_Ammo","APERSMine_Range_Ammo"];};

	FOBMarkerGlobal = _FOBMarker;
	finalPassGlobal = [];
	FOBAnchorLocGlobal = [];
	finalMinePassGlobal = [];
	DAMminefieldMarkerPassGlobal = [];
	recGroupLeaderSideGlobal = [];
	recGroupLocationGlobal = [];
	recGroupVehicleGlobal = [];
	recGroupLeaderTypeGlobal = [];
	recGroupCallsignGlobal = [];
	recGroupNumbersGlobal = [];
	finalCrateCargoGlobal = [];
	finalCratePassGlobal = [];
	finalCrateBudgetGlobal = [];
	finalCrateStatsGlobal = [];
	mineListToDelete = [];
		 
	{	
	
	_list = nearestObjects [getPosATL _x, _permittedObjects, 100]; 
	
	{ 
	if ((_x getVariable ["rimmy_camp_var_checkIfAlreadySaved",0]) != 1) then {
	_midBuildType = typeOf _x;
	_midBuildLoc = getPosATL _x; 
	_midBuildDir = vectorDir _x; 
	_midBuildUp = vectorUp _x;  
	_x setVariable ["rimmy_camp_var_checkIfAlreadySaved", 1, true];
	_finalPass pushBack [_midBuildType,_midBuildLoc,_midBuildDir,_midBuildUp]; 
	};
	} forEach _list; 
  
	finalPassGlobal = _finalPass;
	
	_FOBAnchorOrg = getPosATL _x;
	_FOBAnchorLoc pushBack _FOBAnchorOrg;
	FOBAnchorLocGlobal = _FOBAnchorLoc;
	
	} forEach allMissionObjects _FOBMarker;

	{
	_mineType = typeOf _x;
	if (_mineType in _permittedMines) then {
	_mineLoc = getPosATL _x; 
	_mineDir = vectorDir _x; 
	_mineUp = vectorUp _x; 
	_mineRevealSides = [];	
	if (_x mineDetectedBy west) then {_mineRevealSides pushBack west};
	if (_x mineDetectedBy east) then {_mineRevealSides pushBack east};
	if (_x mineDetectedBy resistance) then {_mineRevealSides pushBack resistance};
	_finalMinePass pushBack [_mineType,_mineLoc,_mineDir,_mineUp,_mineRevealSides]; 
	
	finalMinePassGlobal = _finalMinePass;
	
	};
	} forEach allMines;
	
	mineListToDelete = _permittedMines;
	
	if (!(isNil "RCODAM_fnc_RCODAMcheckGroupMines")) then {
	_DAMminefieldMarkerPass = call RCOP_fnc_RCOPminefieldMarkers;

	DAMminefieldMarkerPassGlobal = _DAMminefieldMarkerPass;
	};
	
	{ 
	if ({ alive _x } count units _x > 0) then {
	_groupLeaderSide = side leader _x;
	_recGroupLeaderSide pushBack _groupLeaderSide;
	recGroupLeaderSideGlobal = _recGroupLeaderSide;
	
	_groupLocation = getPosATL leader _x;
	_recGroupLocation pushBack _groupLocation;
	recGroupLocationGlobal = _recGroupLocation;
	
	_groupVehicle = typeOf vehicle leader _x;
	_recGroupVehicle pushBack _groupVehicle;
	recGroupVehicleGlobal = _recGroupVehicle;
	
	_groupLeaderType = typeOf leader _x;
	_recGroupLeaderType pushBack _groupLeaderType;
	recGroupLeaderTypeGlobal = _recGroupLeaderType;
	
	_groupCallsign = groupId _x;
	_recGroupCallsign pushBack _groupCallsign;
	recGroupCallsignGlobal = _recGroupCallsign;
	
	_groupNumbers = count units _x;
	_recGroupNumbers pushBack _groupNumbers;
	recGroupNumbersGlobal = _recGroupNumbers;
	};
	} forEach allGroups;
	
	{
	{
	_crateType = typeOf _x;
	_crateLoc = getPosATL _x; 
	_crateDir = vectorDir _x; 
	_crateUp = vectorUp _x;  
	_finalCratePass pushBackUnique [_crateType,_crateLoc,_crateDir,_crateUp]; 
	finalCratePassGlobal = _finalCratePass;
	} forEach allMissionObjects _x;
	} forEach _cratesToSave;

	{
	_crateRecorder = nearestObject [(_x select 1), (_x select 0)];
	
	_magazineInCrate = MagazineCargo _crateRecorder;
	_weaponInCrate = WeaponCargo _crateRecorder; 
	_itemInCrate = ItemCargo _crateRecorder;
	
	_containerFinder = [];
	_finalContainerCargo = [];
	_containerFinder = everyContainer _crateRecorder;
	
	{
		_containerType = (_x select 0);
		_magazineInContainer = MagazineCargo (_x select 1);
		_weaponInContainer = WeaponCargo (_x select 1); 
		_itemInContainer = ItemCargo (_x select 1); 
		_finalContainerCargo pushBack [_containerType,_magazineInContainer,_weaponInContainer,_itemInContainer]; 
	} forEach _containerFinder;
	
	_finalCrateCargo pushBack [_magazineInCrate,_weaponInCrate,_itemInCrate, _finalContainerCargo]; 
	finalCrateCargoGlobal = _finalCrateCargo;
	
	if !(isNil {_crateRecorder getVariable "rimmy_camp_var_fortifyBudget"}) then {
	_crateBudget = _crateRecorder getVariable "rimmy_camp_var_fortifyBudget";
	finalCrateBudgetGlobal pushBack _crateBudget;
	} else {
	_crateBudget = -1;
	finalCrateBudgetGlobal pushBack _crateBudget;
	};
	
	_vehicleFuel = 0;
	_vehicleTurrets = [];
	
	if ((typeOf _crateRecorder) isKindOf "AllVehicles") then {
	_vehicleFuel = fuel _crateRecorder;
	_vehicleFuelCargo = _crateRecorder call ace_refuel_fnc_getFuel;
	_vehicleDamage = getAllHitPointsDamage _crateRecorder;
	_vehicleTurrets = magazinesAllTurrets _crateRecorder;	
	_vehicleAmmoCargo = _crateRecorder call ace_rearm_fnc_getSupplyCount;
	_vehiclePylonInfo = getAllPylonsInfo _crateRecorder;
	_finalCrateStats pushBack [_vehicleFuel,_vehicleFuelCargo,_vehicleDamage,_vehicleTurrets,_vehicleAmmoCargo,_vehiclePylonInfo]; 
	finalCrateStatsGlobal = _finalCrateStats;
	} else {
	_vehicleFuel = -1;
	_vehicleFuelCargo = -1;
	_vehicleAmmoCargo = -1;
	_vehiclePylonInfo = [];
	_finalCrateStats pushBack [_vehicleFuel,_vehicleFuelCargo,_vehicleDamage,_vehicleTurrets,_vehicleAmmoCargo,_vehiclePylonInfo];
	finalCrateStatsGlobal = _finalCrateStats;
	};	
	} forEach finalCratePassGlobal;

	recSavedSlotLoadout = createHashMap;
	recSavedSlotMedical = createHashMap;
	recSavedSlotHunger = createHashMap;
	recSavedSlotMarkers = createHashMap;
	
	{
	if (vehicleVarName _x != "") then {
			private _loadout = getUnitLoadout _x;

			// Check if player has earplugs in
			if (_x getVariable ["ACE_hasEarPlugsin", false]) then {
				// Uniform/Vest/Backpack is always represented by (_loadout select 3/4/5)
				private _gear = [_loadout select 3, _loadout select 4, _loadout select 5];
				private _slot = _gear findIf {_x isNotEqualTo []};

				// If any of the above are valid, insert an instance of earplugs into saved inventory				
				if (_slot > -1) then {
					((_gear select _slot) select 1) append [["ACE_Earplugs", 1]];
				};
			};

			recSavedSlotLoadout set [vehicleVarName _x, _loadout];

			if (!(isnil "ace_medical_fnc_serializeState")) then {
				_recSavedSlotMedicalJSON = [{_this call ace_medical_fnc_serializeState}, _x] call CBA_fnc_directCall;
				recSavedSlotMedical set [vehicleVarName _x, _recSavedSlotMedicalJSON];
			};

			_hungerNilTester = nil;
			_hungerNilTester = _x getvariable "acex_field_rations_hunger";
			private _recRationPass = [];

			if (!(isnil "_hungerNilTester")) then {
				// Get current thirst and hunger
				_recVarThirst = _x getVariable ["acex_field_rations_thirst", 0];
				_recVarHunger = _x getVariable ["acex_field_rations_hunger", 0];
				_recRationPass pushBack _recVarThirst;
				_recRationPass pushBack _recVarHunger;	
			};

			recSavedSlotHunger set [vehicleVarName _x, _recRationPass];

			_slotMarkerGet = _x getVariable "rimmy_camp_var_markerPass";
			recSavedSlotMarkers set [vehicleVarName _x, _slotMarkerGet];
		};
	} forEach allPlayers;
	
	private _previousSlots = profileNamespace getVariable "rimmy_camp_var_slotLoadout";
	
	if ((!isNil "_previousSlots") && _oldSlot) then {
	{
	if (!(_x in recSavedSlotLoadout)) then {
	recSavedSlotLoadout set [_x, _y];
	};
	}forEach _previousSlots;
	};
	
	diag_log text "";
	diag_log text format["|================== [GR_PERSIST SERVER]: Sende Global Variables - Time: %1   =============================|", time];
	diag_log text "";
	
	"GR_PERSIST: Server sendet Global Variables" remoteExec ["hint",0];

	publicVariable "FOBMarkerGlobal";
	publicVariable "finalPassGlobal";
	sleep 1;
	publicVariable "FOBAnchorLocGlobal";
	publicVariable "finalMinePassGlobal";
	sleep 1; // changes
	publicVariable "DAMminefieldMarkerPassGlobal";
	publicVariable "recGroupLeaderSideGlobal";
	sleep 1;
	publicVariable "recGroupLocationGlobal";
	publicVariable "recGroupVehicleGlobal";
	sleep 1;
	publicVariable "recGroupLeaderTypeGlobal";
	publicVariable "recGroupCallsignGlobal";
	sleep 1;
	publicVariable "recGroupNumbersGlobal";
	publicVariable "finalCrateCargoGlobal";
	sleep 1;
	publicVariable "finalCratePassGlobal";
	publicVariable "finalCrateBudgetGlobal";
	sleep 1;
	publicVariable "finalCrateStatsGlobal";
	publicVariable "fobDeleteBlockerGlobal";
	sleep 1;
	publicVariable "recSavedSlotLoadout";
	publicVariable "recSavedSlotHunger";
	sleep 1;
	publicVariable "recSavedSlotMedical";
	publicVariable "recSavedSlotMarkers";
	sleep 1;
	publicVariable "mineListToDelete";
	publicVariable "rimmy_camp_var_permittedFOBObjects";

	sleep 2;

	RCOPsaveComplete = 1;
	publicVariable "RCOPsaveComplete";
	
	"GR_PERSIST: Server Save Complete" remoteExec ["hint",0];
	
	diag_log text "";
	diag_log text format["|================== [GR_PERSIST SERVER]: Speicher-Prozess Ende - Time: %1   =============================|", time];
	diag_log text "";

};
	
waitUntil {sleep 1; RCOPsaveComplete == 1};

diag_log text "";
diag_log text format["|================== [GR_PERSIST CLIENT]: Schreibe Global Variables in profileNamespace - Time: %1   =============================|", time];
diag_log text "";

profileNamespace setVariable ["rimmy_camp_var_FOBMarkerForDelete", FOBMarkerGlobal];
profileNamespace setVariable ["rimmy_camp_var_recBuilding", finalPassGlobal];
profileNamespace setVariable ["rimmy_camp_var_recFOBAnchorLoc", FOBAnchorLocGlobal];
profileNamespace setVariable ["rimmy_camp_var_recMine", finalMinePassGlobal];
sleep 1; // changes
profileNamespace setVariable ["rimmy_camp_var_recDAMMinefieldLocation", DAMminefieldMarkerPassGlobal];
profileNamespace setVariable ["rimmy_camp_var_recGroupLeaderSide", recGroupLeaderSideGlobal];
profileNamespace setVariable ["rimmy_camp_var_recGroupLocation", recGroupLocationGlobal];
profileNamespace setVariable ["rimmy_camp_var_recGroupVehicle", recGroupVehicleGlobal];
sleep 1;
profileNamespace setVariable ["rimmy_camp_var_recGroupLeaderType", recGroupLeaderTypeGlobal];
profileNamespace setVariable ["rimmy_camp_var_recGroupCallsign", recGroupCallsignGlobal];
profileNamespace setVariable ["rimmy_camp_var_recGroupNumbers", recGroupNumbersGlobal];
profileNamespace setVariable ["rimmy_camp_var_recCrateCargo", finalCrateCargoGlobal]; 
sleep 1;
profileNamespace setVariable ["rimmy_camp_var_recCrateLocation", finalCratePassGlobal]; 
profileNamespace setVariable ["rimmy_camp_var_recCrateBudget", finalCrateBudgetGlobal]; 
profileNamespace setVariable ["rimmy_camp_var_recCrateStats", finalCrateStatsGlobal]; 
profileNamespace setVariable ["rimmy_camp_var_recFOBDeleteBlocker", fobDeleteBlockerGlobal]; 
sleep 1;
profileNamespace setVariable ["rimmy_camp_var_slotLoadout", recSavedSlotLoadout];
profileNamespace setVariable ["rimmy_camp_var_slotHunger", recSavedSlotHunger]; 
profileNamespace setVariable ["rimmy_camp_var_slotMedical", recSavedSlotMedical]; 
profileNamespace setVariable ["rimmy_camp_var_slotMarkers", recSavedSlotMarkers]; 
sleep 1;
profileNamespace setVariable ["rimmy_camp_var_recMineListToDelete", mineListToDelete];
profileNamespace setVariable ["rimmy_camp_var_permittedFOBObjects", rimmy_camp_var_permittedFOBObjects];

_savedPlayerLoadout = getUnitLoadout player;
profileNamespace setVariable ["rimmy_camp_var_playerLoadout", _savedPlayerLoadout]; 

if(!(isnil "ace_medical_fnc_serializeState")) then
{
_recSavedProfileMedicalJSON = [{_this call ace_medical_fnc_serializeState}, player] call CBA_fnc_directCall;
profileNamespace setVariable ["rimmy_camp_var_playerMedical", _recSavedProfileMedicalJSON]; 
};

_hungerNilTesterPlayer = player getvariable "acex_field_rations_hunger";
if(!(isnil "_hungerNilTesterPlayer")) then {
// Get current thirst and hunger
private _recPlayerRationPass = [];
_recPlayerVarThirst = player getVariable ["acex_field_rations_thirst", 0];
_recPlayerVarHunger = player getVariable ["acex_field_rations_hunger", 0];
_recPlayerRationPass pushBack _recPlayerVarThirst;
_recPlayerRationPass pushBack _recPlayerVarHunger;	
profileNamespace setVariable ["rimmy_camp_var_playerHunger", _recPlayerRationPass]; 
};

diag_log text "";
diag_log text format["|================== [GR_PERSIST CLIENT]: Speicher-Prozess Ende - Time: %1   =============================|", time];
diag_log text "";

hint "GR_PERSIST: FOBs, Mines, Vehicles, Player Loadouts and Group Locations saved successfully.";