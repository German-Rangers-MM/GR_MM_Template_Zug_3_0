params ["_playerLoadoutChoice","_medicalLoadChoice","_hungerLoadChoice","_markerLoadChoice","_rimmySlotLoadout","_rimmySlotMedical","_rimmySlotHunger","_rimmySlotMarkers"];

sleep (1 + random 5);

diag_log text "";
diag_log text format["|================== GR_PERSIST: Player Loadout Start; Time: %1 =============================|", time];
diag_log text "";

hint "GR_PERSIST: Player Loadout Starting.";

if (_playerLoadoutChoice == 1) then {
_loadout = [];
_loadout = profileNamespace getVariable "rimmy_camp_var_playerLoadout";
player setUnitLoadout _loadout;

if (_medicalLoadChoice == 1) then {
_medicalPass = profileNamespace getVariable "rimmy_camp_var_playerMedical";
[{[(_this select 0),(_this select 1)] call ace_medical_fnc_deserializeState},[player,_medicalPass]] call CBA_fnc_directCall;
};

if (_hungerLoadChoice == 1) then {
_hungerPreLoad = profileNamespace getVariable "rimmy_camp_var_playerHunger";
_recVarThirst = _hungerPreLoad select 0;
_recVarHunger = _hungerPreLoad select 1;

player setVariable ["acex_field_rations_thirst", _recVarThirst];
player setVariable ["acex_field_rations_hunger", _recVarHunger];
};

_radioFixer = ((_loadout select 9) select 2);
if (_radioFixer != "") then {
_radioClass = [ configFile >> "CfgWeapons" >> _radioFixer, true ] call BIS_fnc_returnParents;
_radioFixed = _radioClass select 1;
player linkItem _radioFixed;
};
};

if (_playerLoadoutChoice == 2) then {
_loadout = [];
if ((vehicleVarName player) in _rimmySlotLoadout) then {
_loadout = _rimmySlotLoadout get (vehicleVarName player);
player setUnitLoadout _loadout;
};

if (_medicalLoadChoice == 1) then {
if ((vehicleVarName player) in _rimmySlotMedical) then {
_medicalPass = _rimmySlotMedical get (vehicleVarName player);
[{[(_this select 0),(_this select 1)] call ace_medical_fnc_deserializeState},[player,_medicalPass]] call CBA_fnc_directCall;
};
};

if (_hungerLoadChoice == 1) then {
if ((vehicleVarName player) in _rimmySlotHunger) then {
_hungerPreLoad = _rimmySlotHunger get (vehicleVarName player);
_recVarThirst = _hungerPreLoad select 0;
_recVarHunger = _hungerPreLoad select 1;

player setVariable ["acex_field_rations_thirst", _recVarThirst];
player setVariable ["acex_field_rations_hunger", _recVarHunger];
};
};

sleep 3;

_radioFixer = ((_loadout select 9) select 2); // CHANGES
if (_radioFixer != "") then {
	sleep (1 + random 5);
	_radioClass = [ configFile >> "CfgWeapons" >> _radioFixer, true ] call BIS_fnc_returnParents;
	_radioFixed = _radioClass select 1;
	if ( (_radioFixed find ["_1", 5]) != -1 ) then {
		_radioFixed = _radioClass select 2;
	};
	player linkItem _radioFixed;
};

if (_markerLoadChoice == 1) then {
if ((vehicleVarName player) in _rimmySlotMarkers) then {
_mapData = _rimmySlotMarkers get (vehicleVarName player);
{
_x call RCOP_fnc_RCOPstringToMarker;
} forEach _mapData;
};
};
};

hint "PERSIST Player Loadout Complete.";

diag_log text "";
diag_log text format["|================== GR_PERSIST: Player Loadout Ende; Time: %1 =============================|", time];
diag_log text "";
	