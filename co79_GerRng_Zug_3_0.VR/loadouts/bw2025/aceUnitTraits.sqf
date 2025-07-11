/*
	by SmartGun

 	Description:
	Hier werden jeder Rolle ACE Eigenschaften zugewiesen.
	Die Eigenschaften sind jetzt unabhängig vom Loadout-File um Persistenz-Systeme zu unterstützen.
	
 	Paramameters:		
		_this select 0: unit 	-> object
		_this select 1: rolle 	-> "STRING"	
	
	Return values:
	-none		
*/
params ["_unit", "_rolle"];

// Default für alle Rollen
private _aceTraits = [0, 0, false];

private _hashMap = createHashMapFromArray [
//--- ["Variable", 		[medic, engineer, eod]] -------------------------------
	["GrpFhr_WaGru",			[2, 0, false]], 
//-----------------------------------------------------------------------------
	["Lima", 					[2, 2, true]], 	
//-----------------------------------------------------------------------------
	["Lima_Pilot", 				[2, 2, true]],
//-----------------------------------------------------------------------------
	["Mike_AvD", 				[2, 0, false]],
//-----------------------------------------------------------------------------
	["Mike_Fahrer", 			[0, 2, true]],
//-----------------------------------------------------------------------------
	["Mike_Sani", 				[2, 0, false]],
//-----------------------------------------------------------------------------
	["Mike_SaniL", 				[2, 0, false]],
//-----------------------------------------------------------------------------
	["Mike_SchM", 				[2, 0, true]],
//-----------------------------------------------------------------------------
	["Mike_SvD", 				[2, 0, false]],
//-----------------------------------------------------------------------------
	["Mike_Techniker", 			[0, 2, true]],
//-----------------------------------------------------------------------------
	["Mike_TF", 				[1, 2, true]],
//-----------------------------------------------------------------------------
	["Sanitaeter", 				[2, 0, false]],
//-----------------------------------------------------------------------------
	["Sanitaeter_WaGru", 		[2, 0, false]],
//-----------------------------------------------------------------------------
	["GrpFhr_WaGru", 			[2, 0, false]],
//-----------------------------------------------------------------------------
	["Schuetze_EHB", 			[1, 0, false]],
//-----------------------------------------------------------------------------
	["Sierra_AufSan", 			[2, 0, false]],
//-----------------------------------------------------------------------------
	["Sierra_Breacher", 		[0, 0, true]],
//-----------------------------------------------------------------------------
	["Sierra_GrpFhr", 			[2, 0, true]],
//-----------------------------------------------------------------------------
	["Sierra_NaSi", 			[2, 0, false]],
//-----------------------------------------------------------------------------
	["Sierra_San", 				[2, 0, false]],
//-----------------------------------------------------------------------------
	["Spezialpionier", 			[0, 0, true]],
//-----------------------------------------------------------------------------
	["Spezialpionier_Moerser", 	[0, 0, true]],
//-----------------------------------------------------------------------------
	["Spezialpionier_TriLow", 	[0, 0, true]],
//-----------------------------------------------------------------------------
	["Spezialpionier_TriNorm", 	[0, 0, true]],
//-----------------------------------------------------------------------------
	["Sierra_Breacher", 		[0, 0, true]],
//-----------------------------------------------------------------------------
	["ZugSani", 				[2, 0, false]]
];

if (_rolle in _hashMap) then {
	_aceTraits = _hashMap get _rolle;	
};

// apply ace unit traits to player
_unit setVariable ["ACE_medical_medicClass",_aceTraits#0,true];
_unit setVariable ["ACE_isEngineer",_aceTraits#1,true];
_unit setVariable ["ACE_isEOD",_aceTraits#2,true];	

// save traits to hashMap in case of persistent scenario
if (getMissionConfigValue "loadPlayers" == "true") then {
	if (vehicleVarName _unit != "") then {		
		GR_savedAceTraitsMap set [vehicleVarName _unit, _aceTraits];
	};
};