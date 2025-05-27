/*
	by SmartGun	
	
	Description:
	roll a dice and show the number to players in proximity
	
	Paramameters:
	-none
		
	Return values:	
	-none	
	
	[player,"(W20)", floor (random 20)+1,8] spawn SGN_fnc_rollDice;	
*/
params ["_unit","_dice","_roll","_radius"];	
	
private _targets = (allPlayers select { _x distance2D _unit < _radius });	
[format ["%1 würfelt %2:  %3", name _unit, _dice, _roll]] remoteExec ["systemChat", _targets];