/*	
	by SmartGun	
	
 	Description:
	Check for Saved Loadout, replace Camo, apply Loadout to Player
	
 	Paramameters:	
	0: STRING - Unit Loadout Type
	
	Return values:
	-none	
*/
params ["_unitLoadOut"];
	
// check for saved loadout
private _loadoutArray = profileNamespace getVariable [format ["GerRng_standardLoadout_%1", _unitLoadOut], []];	
private _textMsg = "Gespeichertes Loadout: %1";

// use default if no saved loadout found
if ((count _loadoutArray) < 1) then {
	_loadoutArray = getUnitLoadout player;	
	_textMsg = "Standard Loadout: %1";	
};

// check for camo to replace
private _newLoadoutArray = [_loadoutArray] call SGN_fnc_loadoutReplaceCamo;	

// show Message
systemChat format [_textMsg, _unitLoadOut];

// apply loadout
[_newLoadoutArray] spawn {
	params ["_newLoadoutArray"];
	
	removeAllWeapons player;
	sleep 1;	
	player setUnitLoadout _newLoadoutArray;	
	sleep 4.4;
	 
	//	Waffe sichern
	[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;
	
	// Waffe senken
	if (animationState player != "amovpercmstpslowwrfldnon") then {
		player action ["WeaponOnBack", player];
	};	
};