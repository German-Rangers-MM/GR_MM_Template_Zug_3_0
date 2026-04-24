#include "..\script_component.hpp"

params["_unit","_classname"];

TRACE_2("Attempting to assign loadout", _unit, _classname);

if(!isPlayer _unit) exitWith {false};

if!([_unit, _classname] call gr_fnc_getLoadoutConfig) exitWith {false};

_unit setVariable ["GR_unitLoadout", _classname, true];

true