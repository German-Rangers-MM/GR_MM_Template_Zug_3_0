#include "..\script_component.hpp"

/*
    Usage Example:
    [this,"schuetze"] call GerRng_mm_fnc_getLoadoutConfig;

*/

params["_unit","_classname"];

TRACE_2("Attempt to get loadout", _unit, _classname);

private _cfg = GET_MISSION_CONFIG(QGVAR(loadoutConfig),_classname);

if (!isClass _cfg) exitWith {false};

TRACE_1("Loadout config", _cfg);

private _primary = _cfg >> "weaponPrimary";

TRACE_1("Primary weapon config", _primary);

private _launcher = _cfg >> "weaponLauncher";

TRACE_1("Launcher config", _launcher);

private _psitol = _cfg >> "weaponPistol";

TRACE_1("Pistol config", _psitol);

private _uniform = _cfg >> "uniform";

TRACE_1("Uniform config", _uniform);

private _vest = _cfg >> "vest";

TRACE_1("Vest config", _vest);

private _backpack = _cfg >> "backpack";

TRACE_1("Backpack config", _backpack);

private _headgear = getText(_cfg >> "headgearClass");

TRACE_1("Headgear config", _headgear);

private _facewear = getText(_cfg >> "facewearClass");

TRACE_1("Facewear config", _facewear);

private _designator = _cfg >> "designator";

TRACE_1("Designator config", _designator);

private _assigendItems = _cfg >> "assignedItems";

TRACE_1("Assigned items config", _assigendItems);

private _isMedic = getNumber(_cfg >> "isMedic");

TRACE_1("Is medic", _isMedic);

private _isEngineer = getNumber(_cfg >> "isEngineer");

TRACE_1("Is engineer", _isEngineer);

private _isEOD = getNumber(_cfg >> "isEOD");

TRACE_1("Is EOD", _isEOD);

_isEOD = if (_isEOD isEqualTo 0) then { false } else { true };

// Assemble loadout array

private _primaryArray = if(getText(_primary >> "weaponClass") isEqualTo "") then {
    []
} else {
    [
        getText(_primary >> "weaponClass"),
        getText(_primary >> "weaponMuzzle"),
        getText(_primary >> "weaponAttachment"),
        getText(_primary >> "weaponOptic"),
        getArray(_primary >> "weaponMagazinePrimary"),
        getArray(_primary >> "weaponMagazineSecondary"),
        getText(_primary >> "weaponBipod")
    ]
};

TRACE_1("Primary weapon array", _primaryArray);

private _launcherArray = if(getText(_launcher >> "weaponClass") isEqualTo "") then {
    []
} else {
    [
        getText(_launcher >> "weaponClass"),
        getText(_launcher >> "weaponMuzzle"),
        getText(_launcher >> "weaponAttachment"),
        getText(_launcher >> "weaponOptic"),
        getArray(_launcher >> "weaponMagazinePrimary"),
        getArray(_launcher >> "weaponMagazineSecondary"),
        ""
    ]
};

TRACE_1("Launcher array", _launcherArray);

private _pistolArray = if(getText(_psitol >> "weaponClass") isEqualTo "") then {
    []
} else {
    [
    getText(_psitol >> "weaponClass"),
    getText(_psitol >> "weaponMuzzle"),
    getText(_psitol >> "weaponAttachment"),
    getText(_psitol >> "weaponOptic"),
    getArray(_psitol >> "weaponMagazinePrimary"),
    getArray(_psitol >> "weaponMagazineSecondary"),
    ""
    ]
};

TRACE_1("Pistol array", _pistolArray);

private _uniformArray = if(getText(_uniform >> "uniformClass") isEqualTo "") then {
    []
} else {
    [
        getText(_uniform >> "uniformClass"),
        getArray(_uniform >> "uniformItems")
    ]
};

TRACE_1("Uniform array", _uniformArray);

private _vestArray = if(getText(_vest >> "vestClass") isEqualTo "") then {
    []
} else {
    [
        getText(_vest >> "vestClass"),
        getArray(_vest >> "vestItems")
    ];
};

TRACE_1("Vest array", _vestArray);

private _backpackArray = if(getText(_backpack >> "backpackClass") isEqualTo "") then {
    []
} else {
    [
        getText(_backpack >> "backpackClass"),
        getArray(_backpack >> "backpackItems")
    ]
};

TRACE_1("Backpack array", _backpackArray);

private _designatorArray = if(getText(_designator >> "designatorClass") isEqualTo "") then {
    []
} else {
    [
        getText(_designator >> "designatorClass"),
        "",
        "",
        "",
        getArray(_designator >> "designatorMagazine"),
        [],
        ""
    ]
};

TRACE_1("Designator array", _designatorArray);

private _assignedItemsArray = [
    getText(_assigendItems >> "map"),
    getText(_assigendItems >> "gps"),
    getText(_assigendItems >> "radio"),
    getText(_assigendItems >> "compass"),
    getText(_assigendItems >> "watch"),
    getText(_assigendItems >> "nvg")
];


private _loadoutArray = [
    _primaryArray,
    _launcherArray,
    _pistolArray,
    _uniformArray,
    _vestArray,
    _backpackArray,
    _headgear,
    _facewear,
    _designatorArray,
    _assignedItemsArray
];

TRACE_1("Final loadout array", _loadoutArray);

_unit setUnitLoadout _loadoutArray;

TRACE_1("Loadout after setUnitLoadout", getUnitLoadout _unit);

_unit setVariable ["ACE_medical_medicClass",_isMedic,true];

_unit setVariable ["ACE_isEngineer",_isEngineer,true];

_unit setVariable ["ACE_isEOD",_isEOD,true];

true



