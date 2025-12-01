/*
	by SmartGun

 	Description:
	gespeichertes loadout löschen, spieler erhält default loadout 
	
 	Paramameters:		
	-none	
	
	Return values:
	-none	
*/
private _role = player getVariable ["GR_unitLoadout", ""];
private _variableToDelete = format ["GerRng_standardLoadout_%1", _role];

if (_role != "") then {
	// delete saved loadout
	if (count (profileNamespace getVariable [_variableToDelete, []]) > 0) then {	
		// destroy variable
		profileNamespace setVariable [_variableToDelete, nil];
		// save variable
		saveProfileNamespace;
	};
	// apply default loadout & ACE Traits
	call compile preprocessFileLineNumbers format ["loadouts\%1\loadout\%2.sqf", fraktionV, _role];	

	// apply saved loadout & camo
	[_role] call SGN_fnc_loadoutApply;	
};