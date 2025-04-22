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

_groupName = toLower (groupId group _unit);
 
private _groupRoles = [];

// Zugführung
if (_groupName in ["foxtrot","victor"]) then {
	_groupRoles = GR_ZugFhrRollen;
};

// Schützengruppe
if (_groupName in ["alpha","charlie","zulu","x-ray"]) then {
	_groupRoles = GR_SchuetzenRollen;
};

// Waffengruppe
if (_groupName in ["bravo","yankee"]) then {
	_groupRoles = GR_WaffenRollen;
};

// Scharfschützentrupps
if (_groupName in ["sierra","whiskey"]) then {
	_groupRoles = GR_ScharfRollen;
};

// Kilo - Kompanieführung
if (_groupName in ["kilo"]) then {
	_groupRoles = GR_KiloRollen;
};

// Hotel - Zeus
if (_groupName in ["hotel"]) then {
	_groupRoles = GR_HotelRollen;
};

// Mike - San-Unterstützungs Einheit
if (_groupName in ["mike"]) then {
	_groupRoles = GR_MikeRollen;
};

// Lima - Unterstützungstrupp
if (_groupName in ["lima"]) then {
	_groupRoles = GR_LimaRollen;
};

// fill listbox
{
	_index = _listbox lbAdd (_x select 0);
	_listbox lbSetData [_index, (_x select 1)];
} forEach _groupRoles;

_confirmButton ctrlAddEventHandler [ "ButtonClick", { [] spawn GR_fnc_loadout; }];