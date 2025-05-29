/*
	by SmartGun

 	Description:		
	
 	Paramameters:		
	-none	
	
	Return values:
	-none		
*/

// check if a listbox entry is selected
if (lbCurSel 1500 < 0) exitWith { systemchat "Kein Loadout ausgewählt"; };

removeallWeapons player;
[lbData [1500, lbCurSel 1500]] spawn {
	params ["_data"];
	sleep 2;
	call compile preprocessFileLineNumbers format ['loadouts\%1\loadout\%2.sqf', fraktionV, _data];
	[tarnfarbeV] call SGN_fnc_replaceTarnfarbe;	
	[player, _data] execVM format ["loadouts\%1\aceUnitTraits.sqf", fraktionV];
	//	Waffe sichern
	[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;
	sleep 2;
	// Waffe senken
	player action ["WeaponOnBack", player];
};

closeDialog 0;