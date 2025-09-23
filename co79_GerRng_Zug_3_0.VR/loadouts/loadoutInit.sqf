private _compileLoadout = getMissionConfigValue ["compileLoadout","true"];

private _unitLoadOut = "";
private _loadOutFile = "";

if(_compileLoadout isEqualTo "true") then {
	switch (playerSide) do {
		case west: {
			
			_unitLoadOut = player getVariable "GR_unitLoadout";
			_loadOutFile = format ["loadouts\%1\loadout\%2.sqf", fraktionV, _unitLoadOut];
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
		default {
			_unitLoadOut = nil;
			_loadOutFile = nil;
		};
	};
};

if !isNil _loadOutFile then {
	call compile preprocessFileLineNumbers _loadOutFile;
};