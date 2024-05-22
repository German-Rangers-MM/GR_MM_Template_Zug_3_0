params ["_unit"];

createDialog "GR_guiNeuDialog";
private _display 		= findDisplay 7777;
private _confirmButton	= _display displayCtrl 1614;
private _listbox 		= _display displayCtrl 1500;

_groupName = toLower (groupId group _unit);
 
private _groupRoles = [];

// Zugführung
if (_groupName in ["foxtrott","victor"]) then {
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

// Mike - San-Unterstützungs Einheit
if (_groupName in ["mike"]) then {
	_groupRoles = GR_MikeRollen;
};

// Lima - Unterstützungstrupp
if (_groupName in ["lima"]) then {
	_groupRoles = GR_LimaRollen;
};


{
	_index = _listbox lbAdd (_x select 0);
	_listbox lbSetData [_index, (_x select 1)];
} forEach _groupRoles;

//lbSort _listbox; // sort ascending

if ((count _groupRoles) < 1) then {
	_confirmButton ctrlRemoveAllEventHandlers "ButtonClick";
};