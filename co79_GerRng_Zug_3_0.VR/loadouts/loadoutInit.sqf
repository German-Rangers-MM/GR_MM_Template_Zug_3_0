if (playerSide == west) then { 
	private _unitLoadOut 	= player getVariable "GR_unitLoadout";
	private _loadOutFile 	= format ["loadouts\%1\loadout\%2.sqf", fraktionV, _unitLoadOut];
	call compile preprocessFileLineNumbers _loadOutFile;
	[tarnfarbeV] call SGN_fnc_replaceTarnfarbe;
	[player, _unitLoadOut] execVM format ["loadouts\%1\aceUnitTraits.sqf", fraktionV];
	//	Waffe sichern
	[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;
	// Waffe senken
	[] spawn { sleep 2; player action ["WeaponOnBack", player]; };
};