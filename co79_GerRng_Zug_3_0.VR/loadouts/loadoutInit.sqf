private _unitLoadOut = "";
private _loadOutFile = "";

if(getMissionConfigValue "compileLoadout" == "true") then {
	systemChat "Compiling Loadout File...";
	switch (playerSide) do {
		case west: {
			
			_unitLoadOut = player getVariable "GR_unitLoadout";
			systemChat str _unitLoadOut;
			_loadOutFile = format ["loadouts\%1\loadout\%2.sqf", fraktionV, _unitLoadOut];
			systemChat str _loadOutFile;
			[tarnfarbeV] call SGN_fnc_replaceTarnfarbe;
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
	call compile preprocessFileLineNumbers _loadOutFile;
};