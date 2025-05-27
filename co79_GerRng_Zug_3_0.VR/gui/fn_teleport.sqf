/*
	by SmartGun

 	Description:		
	
 	Paramameters:		
	-none	
	
	Return values:
	-none		
*/

private ["_index","_targetGroup","_jumpTarget","_LX","_LY","_LZ"];
// check if a listbox entry is selected
_index = lbCurSel 1500;
if (_index < 0) exitWith { systemchat "Kein Ziel ausgewählt"; };

closeDialog 0;

_jumpTarget = player;

// get Jump-Target; convert STRING to object
//_jumpTarget = lbData [1500, _index] call BIS_fnc_objectFromNetId;
_targetGroup = lbdata[1500, _index];

switch (_targetGroup) do {
	case "Kilo": {		_jumpTarget = (units grpkilo select 0); };
	case "Lima": {		_jumpTarget = (units grplima select 0); };
	case "Mike": {		_jumpTarget = (units grpmike select 0); };
	case "Foxtrot": {	_jumpTarget = (units grpfox select 0); };
	case "Victor": {	_jumpTarget = (units grpvictor select 0); };
	case "Alpha": {		_jumpTarget = (units grpalpha select 0); };
	case "Bravo": {		_jumpTarget = (units grpbravo select 0); };
	case "Charlie": {	_jumpTarget = (units grpcharlie select 0); };
	case "Zulu": {		_jumpTarget = (units grpzulu select 0); };
	case "X-Ray": {		_jumpTarget = (units grpxray select 0); };
	case "Yankee": {	_jumpTarget = (units grpyankee select 0); };	
	case "Sierra": {	_jumpTarget = (units grpsierra select 0); };
	case "Whiskey": {	_jumpTarget = (units grpwhiskey select 0); };				
};

if (player == _jumpTarget) then {
	switch (_targetGroup) do {
		case "Kilo": {		_jumpTarget = (units grpkilo select 1); };
		case "Lima": {		_jumpTarget = (units grplima select 1); };
		case "Mike": {		_jumpTarget = (units grpmike select 1); };
		case "Foxtrot": {	_jumpTarget = (units grpfox select 1); };
		case "Victor": {	_jumpTarget = (units grpvictor select 1); };
		case "Alpha": {		_jumpTarget = (units grpalpha select 1); };
		case "Bravo": {		_jumpTarget = (units grpbravo select 1); };
		case "Charlie": {	_jumpTarget = (units grpcharlie select 1); };
		case "Zulu": {		_jumpTarget = (units grpzulu select 1); };
		case "X-Ray": {		_jumpTarget = (units grpxray select 1); };
		case "Yankee": {	_jumpTarget = (units grpyankee select 1); };	
		case "Sierra": {	_jumpTarget = (units grpsierra select 1); };
		case "Whiskey": {	_jumpTarget = (units grpwhiskey select 1); };	
	};
};

// Jump-Target on foot	
if (isNull objectParent _jumpTarget) then {
	//Getting the coords
	_LX = (getpos _jumpTarget select 0) + (3*sin ((getDir _jumpTarget) -180));
	_LY = (getpos _jumpTarget select 1) + (3*cos ((getDir _jumpTarget) -180));
	_LZ = (getpos _jumpTarget select 2);
	
	player setpos [_LX,_LY,_LZ];
	player setDir (getDir _jumpTarget);
} else {
	// Jump-Target in Vehicle
	if ((objectParent _jumpTarget) emptyPositions "cargo" > 0) then {
		player moveincargo (objectParent _jumpTarget);	
	} else {
		hint "No room in squad leader's vehicle.";	
	};
};	
// debug
systemchat format ["Verlegen zu Gruppe: %1", _targetGroup];
systemchat format ["Position 3m hinter: %1", name _jumpTarget];