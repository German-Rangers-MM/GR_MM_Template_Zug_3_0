/*
	by SmartGun

 	Description:
	speichert das inventar des spielers als standard-loadout für seine aktuelle rolle
	
 	Paramameters:		
	0: OBJECT - player unit
	
	player spawn SGN_fnc_saveStdLoadout;
	
	Return values:
	-none	
*/
// create variable for the current role
private _role = player getVariable ["GR_unitLoadout", ""];
private _variableToSave = format ["GerRng_standardLoadout_%1", _role];

private _loadoutArray = getUnitLoadout [player, true];

// get current head-gear
private _currentHelmet = _loadoutArray#6;

// check for OpsCore helmet
if ("opscore" in (tolowerANSI _currentHelmet)) then {
	// reset to Opscore Base - PLS fix fnc_selectHelmet.sqf
	_tempFunction = compile preprocessFileLineNumbers "y\gerrng\addons\helmets\functions\fnc_selectHelmet.sqf";
	["reset"] call _tempFunction;	
	
	// set Opscore Base in LoadoutToSave
	_loadoutArray set [6, headGear player];
	
	// re-apply current head-gear
	removeHeadgear player;
	player addHeadgear _currentHelmet;
};

// set variable
profileNamespace setVariable [_variableToSave, _loadoutArray];

// save variable
saveProfileNamespace;

// show info-hint to player
[_role] spawn {
	params ["_role"];
	hint format ["Gespeichert: %1", _role];
	sleep 6;
	hint "";
};