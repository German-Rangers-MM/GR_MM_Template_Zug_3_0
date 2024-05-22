params ["_unit"];		
_unit setVariable ["SGN_arsenalClosed", false];		
_test = call compile preprocessFileLineNumbers format ["loadouts\%1\packliste\MasterPackliste.sqf", fraktionV];		
// Create ACE Arsenal
[_unit, _test, false] call ace_arsenal_fnc_addVirtualItems;		
// Open ACE Arsenal
[_unit, _unit, false] call ace_arsenal_fnc_openBox;		
// Add Event Handler for closing the Arsenal
ARSENAL_DISPLAY_ID = ["ace_arsenal_displayClosed", { player setVariable ["SGN_arsenalClosed", true]; ["ace_arsenal_displayClosed", ARSENAL_DISPLAY_ID] call CBA_fnc_removeEventHandler; } ] call CBA_fnc_addEventHandler;		
// Wait until Arsenal is closed by Player
waitUntil { _unit getVariable "SGN_arsenalClosed" };
// clear Arsenal Items					
[_unit, true, false] call ace_arsenal_fnc_removeVirtualItems;