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

private _data = lbData [1500, lbCurSel 1500];

// apply default loadout & ACE Traits
call compile preprocessFileLineNumbers format ['loadouts\%1\loadout\%2.sqf', fraktionV, _data];

// apply saved loadout & camo
[_data] call SGN_fnc_loadoutApply;	

closeDialog 0;