/*
	by SmartGun

 	Description:
	ask server to show hc-info hint to caller
	
 	Paramameters:		
	[[player], SGN_fnc_infoHintHC] remoteExec ["spawn", 2];
	
	Return values:
	-none	
	
	// https://community.bistudio.com/wiki/Multiplayer_Scripting#Machine_network_ID
	// https://ace3.acemod.org/wiki/framework/headless-framework
*/
params ["_caller"];

// client IDs 
_ID_Server = 2;
_ID_HC1 = -1;
_ID_HC2 = -1;
_ID_HC3 = -1;

if (! isNil "HC1") then { _ID_HC1 = owner HC1; };
if (! isNil "HC2") then { _ID_HC2 = owner HC2; };
if (! isNil "HC3") then { _ID_HC3 = owner HC3; };

// get array with groups local to each machine
_grpsServer = allGroups select { _ID_Server == groupOwner _x };
_grpsHC1 = allGroups select { _ID_HC1 == groupOwner _x };
_grpsHC2 = allGroups select { _ID_HC2 == groupOwner _x };
_grpsHC3 = allGroups select { _ID_HC3 == groupOwner _x };

// count units in groups
_unitsServer = 0;
{ _unitsServer = _unitsServer + (count units _x); } forEach _grpsServer;

_unitsHC1 = 0;
{ _unitsHC1 = _unitsHC1 + (count units _x); } forEach _grpsHC1;

_unitsHC2 = 0;
{ _unitsHC2 = _unitsHC2 + (count units _x); } forEach _grpsHC2;

_unitsHC3 = 0;
{ _unitsHC3 = _unitsHC3 + (count units _x); } forEach _grpsHC3;

_txt2 = parseText format["<t size='1.2' color='#2db92d'>ID: %1 = HC 1 nicht verbunden</t>", _ID_HC1];
_txt3 = parseText format["<t size='1.2' color='#e6e600'>ID: %1 = HC 2 nicht verbunden</t>", _ID_HC2];
_txt4 = parseText format["<t size='1.2' color='#FF00FF'>ID: %1 = HC 3 nicht verbunden</t>", _ID_HC3];

// create Info Hint
_separator = parseText "<br />------------------------<br />";
_txt1 = parseText format["<t size='1.2' color='#F5F5F5'>ID: %3 = Server: %1 Units in %2 Groups</t>", _unitsServer, count _grpsServer, _ID_Server];
if (_ID_HC1 > 0) then { _txt2 = parseText format["<t size='1.2' color='#2db92d'>ID: %3 = HC 1: %1 Units in %2 Groups</t>", _unitsHC1, count _grpsHC1, _ID_HC1]; };
if (_ID_HC2 > 0) then { _txt3 = parseText format["<t size='1.2' color='#e6e600'>ID: %3 = HC 2: %1 Units in %2 Groups</t>", _unitsHC2, count _grpsHC2, _ID_HC2]; };
if (_ID_HC3 > 0) then { _txt4 = parseText format["<t size='1.2' color='#FF00FF'>ID: %3 = HC 3: %1 Units in %2 Groups</t>", _unitsHC3, count _grpsHC3, _ID_HC3]; };
_txt5 = parseText format["<t size='1.2' color='#F5F5F5'>Gesamt: %1 Units in %2 Groups</t>", (_unitsServer+_unitsHC1+_unitsHC2+_unitsHC3), (count _grpsServer)+(count _grpsHC1)+(count _grpsHC2)+(count _grpsHC3)];
_txtFinal = composeText [_txt1, _separator, _txt2, _separator, _txt3, _separator, _txt4, _separator, _txt5];

// Show Info Hint to Caller
[_txtFinal] remoteExec ["hintSilent", _caller];