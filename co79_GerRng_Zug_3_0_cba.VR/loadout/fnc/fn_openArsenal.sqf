#include "..\script_component.hpp"

params["_unit"];

TRACE_1("Attempting to open arsenal for unit", _unit);

if(!isPlayer _unit) exitWith {false};

// Get the loadout classname from unit var
private _classname = _unit getVariable ["GR_unitLoadout", ""];
if (_classname isEqualTo "") exitWith {false};

private _items = [];
private _cfg = GET_MISSION_CONFIG(QGVAR(loadoutConfig), _classname);
TRACE_1("Loadout config for arsenal", _cfg);
private _commonItems = missionConfigFile >> QGVAR(commonItems);
TRACE_1("Common items config", _commonItems);
if !(isClass _cfg) exitWith {false};

{
    private _entry = _cfg >> _x;
    TRACE_1("Processing common items for category", _x);
    if(getNumber(_entry) isEqualTo 1) then {
        _items append getArray(_commonItems >> _y);
        TRACE_1("Added common items for category", _y);
        TRACE_1("Current items list", _items);
    };
} forEach createHashMapFromArray [["hasCommonWeapons","weapons"], ["hasCommonMagazines","magazines"], ["hasCommonThrowables","throw"], ["hasCommonAttachments","attachments"], ["hasCommonUniforms","uniformItems"], ["hasCommonItems","items"]];

_items append getArray(_cfg >> "uniqueItems");
TRACE_1("Final items list", _items);

// If no items are defined, add the current loadout to the arsenal to allow modifications
if (_items isEqualTo []) then {
    _items append itemsWithMagazines _unit;
    _items append uniform _unit;
    _items append vest _unit;
    _items append backpack _unit;
    _items append headgear _unit;
    _items append goggles _unit;
};

[_unit, _items, false] call ace_arsenal_fnc_addVirtualItems;

private _arsenal = [_unit, _unit, false] call ace_arsenal_fnc_openBox;

GR_ARSENAL_DISPLAY_ID = [
    "ace_arsenal_displayClosed", 
    {
        ["ace_arsenal_displayClosed", GR_ARSENAL_DISPLAY_ID] call CBA_fnc_removeEventHandler;
        [_unit, true, false] call ace_arsenal_fnc_removeVirtualItems;
    } 
] call CBA_fnc_addEventHandler;

true