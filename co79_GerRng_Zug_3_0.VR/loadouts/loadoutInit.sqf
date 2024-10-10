if (playerSide == west) then { 
	private _unitLoadOut 	= player getVariable "GR_unitLoadout";
	private _loadOutFile 	= format ["loadouts\%1\loadout\%2.sqf", fraktionV, _unitLoadOut];
	call compile preprocessFileLineNumbers _loadOutFile;
	[tarnfarbeV] call SGN_fnc_replaceTarnfarbe;
};