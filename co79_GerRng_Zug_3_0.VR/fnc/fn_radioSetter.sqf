//radio setter
_groupName = toLower (groupId group player);

switch(_groupName) do
{
	case "foxtrott": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["49","60","61","71","75","80.1","80.2","80.3"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
	case "alpha": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["30","31","32","61","71","80.1","80.2","80.3"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
	case "bravo": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["35","36","37","61","71","80.1","80.2","80.3"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
	case "charlie": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["40","41","42","61","71","80.1","80.2","80.3"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};

	case "victor": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["99","60","62","72","75","80.1","80.2","80.3"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
	case "zulu": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["80","81","82","62","72","80.1","80.2","80.3"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
	case "yankee": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["85","86","87","62","72","80.1","80.2","80.3"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
	case "x-ray": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["90","91","92","62","72","80.1","80.2","80.3"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};

	case "hotel": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["50","60","67","80.1","80.2","80.3","80.4","80.5"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
	case "kilo": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["50","60","67","80.1","80.2","80.3","80.4","80.5"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
	case "mike": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["53","67","75","80.1","80.2","80.3","80.4","80.5"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
	case "lima": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["51","52","67","80.1","80.2","80.3","80.4","80.5"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
	case "sierra": {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["45","60","75","80.1","80.2","80.3","80.4","80.5"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};

	default {
		_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [2,["30","35","40","45","50","55","75","80.1"]];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
		};
};

if (call TFAR_fnc_haveLRRadio) then {

	switch(_groupName) do
	{
		case "foxtrott": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["60","61","67","71","75","80.1","80.2","80.3","80.4"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
		case "alpha": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["61","71","80.1","80.2","80.3","80.4","80.5","80.6","80.7"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
		case "bravo": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["61","71","80.1","80.2","80.3","80.4","80.5","80.6","80.7"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
		case "charlie": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["61","71","80","80.1","80.2","80.3","80.4","80.5","80.6"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};

		case "victor": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["60","62","67","72","75","80.1","80.2","80.3","80.4"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
		case "zulu": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["62","72","80.1","80.2","80.3","80.4","80.5","80.6","80.7"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
		case "yankee": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["62","72","80.1","80.2","80.3","80.4","80.5","80.6","80.7"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
		case "x-ray": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["62","72","80.1","80.2","80.3","80.4","80.5","80.6","80.7"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};

		case "hotel": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["60","67","63","64","65","68","80.1","80.2","80.3"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
		case "kilo": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["60","67","63","64","65","68","80.1","80.2","80.3"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
		case "mike": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["67","75","60","61","62","63","64","68","80.1"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
		case "lima": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["67","52","63","64","65","68","75","80.1","80.2"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
		case "sierra": {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["67","60","75","63","64","65","68","80.1","80.2"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};

		default {
			_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
			_settings set [2,["60","61","62","63","64","65","67","68","80.1"]];
			[(call TFAR_fnc_activeLrRadio), _settings] call TFAR_fnc_setLrSettings;
			};
	};
};

//[0,5,["60","67","63","64","65","68","80.1","80.2"],0,"_bluefor",-1,0,any,false,true]
//[22beacdc100# 620124: clf_prc117g_ap.p3d,"radio_settings"]