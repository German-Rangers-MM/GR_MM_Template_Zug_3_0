params ["_playerLoadoutChoice","_medicalLoadChoice","_hungerLoadChoice","_markerLoadChoice","_JIPChoice"];

sleep 2;

// detailedLoadInfoPassComplete = 0;


if ((vehicleVarName player) == "persist1") then {	
	
	diag_log text "";
	diag_log text format["|================== GR_PERSIST: Player %1 in Slot %2 startet PERSIST-Loading; Time: %3 Admin State: %4  =============================|", name player, vehicleVarName player, time, call BIS_fnc_admin];
	diag_log text "";
	
	"GR_PERSIST: Lade Variable aus profileNamespace" remoteExec ["hint",0];

	if (isNil "_playerLoadoutChoice") then { _playerLoadoutChoice = 2; }; // CHANGES (moved from outside check to inside)
	if (isNil "_medicalLoadChoice") then { _medicalLoadChoice = 0; };
	if (isNil "_hungerLoadChoice") then { _hungerLoadChoice = 0; };
	if (isNil "_markerLoadChoice") then { _markerLoadChoice = 0; };
	if (isNil "_JIPChoice") then { _JIPChoice = false; };

	// major changes here
	// private _crateCargoPass = [];
	// private _crateSpawnerPass = [];
	// private _crateBudgetPass = [];
	// private _crateStatsPass = [];
	private _rimmySlotLoadout = [];
	private _rimmySlotMedical = [];
	private _rimmySlotHunger = [];
	private _rimmySlotMarkers = [];
	// changes
	// crateCargoPass = profileNamespace getVariable "rimmy_camp_var_recCrateCargo";	
	// crateSpawnerPass = profileNamespace getVariable "rimmy_camp_var_recCrateLocation";
	sleep 1;
	// crateBudgetPass = profileNamespace getVariable "rimmy_camp_var_recCrateBudget";
	// crateStatsPass = profileNamespace getVariable "rimmy_camp_var_recCrateStats";
	sleep 1; // CHANGES
	
	diag_log text "";
	diag_log text format["|================== GR_PERSIST: Lade Variables aus profileNamespace Start; Time: %1 =============================|", time];
	diag_log text "";
	
	_rimmySlotLoadout = profileNamespace getVariable "rimmy_camp_var_slotLoadout"; 
	_rimmySlotMedical = profileNamespace getVariable "rimmy_camp_var_slotMedical"; 
	sleep 1;
	_rimmySlotHunger = profileNamespace getVariable "rimmy_camp_var_slotHunger";
	_rimmySlotMarkers = profileNamespace getVariable "rimmy_camp_var_slotMarkers"; 
	
	diag_log text "";
	diag_log text format["|================== GR_PERSIST: Lade Variables aus profileNamespace Ende; Time: %1 =============================|", time];
	diag_log text "";
	
	// MAJOR CHANGES
	// publicVariable "crateCargoPass";
	// publicVariable "crateSpawnerPass";
	// publicVariable "crateBudgetPass";
	// publicVariable "crateStatsPass";
	// publicVariable "rimmySlotLoadout";
	// publicVariable "rimmySlotMedical";
	// publicVariable "rimmySlotHunger";
	// publicVariable "rimmySlotMarkers";
	// detailedLoadInfoPassComplete = 1;
	// publicVariable "detailedLoadInfoPassComplete";

	"GR_PERSIST: Detailed Server Load Beginning..." remoteExec ["hint",0];
	
	diag_log text "";
	diag_log text format["|================== GR_PERSIST: startet Detailed Server Load; Time: %1 =============================|", time];
	diag_log text "";

	[[_playerLoadoutChoice,_medicalLoadChoice,_hungerLoadChoice,_markerLoadChoice,_rimmySlotLoadout,_rimmySlotMedical,_rimmySlotHunger,_rimmySlotMarkers],"RCOP\RCOPersist\RCOPplayerLoadout.sqf"] remoteExec ["execVM",0,_JIPChoice];

};

// waitUntil {sleep 3; detailedLoadInfoPassComplete == 1}; // changes


// if ((vehicleVarName player) == "persist1") then {


// };

