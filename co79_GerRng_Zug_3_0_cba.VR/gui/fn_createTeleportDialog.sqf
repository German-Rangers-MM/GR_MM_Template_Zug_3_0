/*
	by SmartGun

 	Description:		
	
 	Paramameters:		
	-none	
	
	Return values:
	-none		
*/

params ["_unit"];

createDialog "GR_guiNeuDialog";
private _display 		= findDisplay 7777;
private _confirmButton	= _display displayCtrl 1614;
private _listbox 		= _display displayCtrl 1500;

ctrlSetText [2000, "Teleport"];
ctrlSetText [1614, "Bestätigen"];

// get all player-groups
private _PlayableGroups = [];
{
	if (isPlayer (leader _x)) then { 		
		_PlayableGroups pushBackUnique (groupID _x);		
	};
} forEach groups (side player);

// fill listbox
{ 
	lbAdd [1500, _x];
	lbSetData [1500, _forEachIndex, _PlayableGroups select _forEachIndex];		
} forEach _PlayableGroups;	

lbSort _listbox; // sort ascending

_confirmButton ctrlAddEventHandler [ "ButtonClick", { [] call GR_fnc_teleport; }];