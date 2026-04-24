#include "..\script_component.hpp"

params["_unit"];

private _grp =toLower (groupID group _unit);

TRACE_1("Attempting to get loadouts for group", _grp);

private _cfg = "true" configClasses (missionConfigFile >> "mappings");

private _grpType = "";

{
    if(_grp in getArray(_x >> "groups")) then {_grpType = getText(_x >> "type")};
} forEach _cfg;


TRACE_1("Group type for group", _grpType);

private _loadoutCfgs = "true" configClasses (missionConfigFile >> QGVAR(loadoutConfig));

private _loadouts = [];

{
    if(_grpType isEqualTo getText(_x >> "groupType")) then {_loadouts pushBack configName _x};
    TRACE_1("Found loadout", getText(_x >> "displayName"));

} forEach _loadoutCfgs;


_loadouts
