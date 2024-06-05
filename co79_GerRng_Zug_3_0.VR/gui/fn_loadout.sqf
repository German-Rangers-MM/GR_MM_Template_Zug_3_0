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
	sleep 2;
	player action ["WeaponOnBack", player];
};

closeDialog 0;