private _unitLoadOut = "";
private _loadOutFile = "";

if(getMissionConfigValue "compileLoadout" == "true") then {	
	switch (playerSide) do {
		case west: {
			
			_unitLoadOut = player getVariable "GR_unitLoadout";			
			_loadOutFile = format ["loadouts\%1\loadout\%2.sqf", fraktionV, _unitLoadOut];					
		};
		case east: {
			_unitLoadOut = player getVariable "OPF_unitLoadout";
			_loadOutFile = format ["loadouts\%1\loadout\%2.sqf", fraktionOV, _unitLoadOut];
		};
		case independent: {
			_unitLoadOut = player getVariable "IND_unitLoadout";
			_loadOutFile = format ["loadouts\%1\loadout\%2.sqf", fraktionIV, _unitLoadOut];
		};
		case civilian: {
			_unitLoadOut = player getVariable "CIV_unitLoadout";
			_loadOutFile = format ["loadouts\%1\loadout\%2.sqf", fraktionCV, _unitLoadOut];
		};
	};
	
	// apply default loadout & ACE Traits
	call compile preprocessFileLineNumbers _loadOutFile;
	
	// apply saved loadout & camo
	[_unitLoadOut] call SGN_fnc_loadoutApply;		
};