if (isServer) exitWith {};

_sleepRandom = random [5, 25, 40];

sleep _sleepRandom;

// Teleport Player
_vehicle = objectParent player;

switch (_vehicle) do {
		case transport_1: 	{ player moveInAny start_1; };
		case transport_2: 	{ player moveInAny start_2; };
		case transport_3: 	{ player moveInAny start_3; };
		case transport_4: 	{ player moveInAny start_4; };
		case transport_5: 	{ player moveInAny start_5; };
		case transport_6: 	{ player moveInAny start_6; };
};

_vehicle2 = objectParent player;

if (_vehicle == _vehicle2) then {

	_a = 1;
	_name = name player;
	
	while {_vehicle == _vehicle2} do
	{

		if (_a > 6) exitWith {};
		
		(format ["%1 wurde nicht teleportiert. Versuch %2", _name, _a]) remoteExec ["diag_log", 2];
		
		switch (_vehicle) do {
			case transport_1: 	{ player moveInAny start_1; };
			case transport_2: 	{ player moveInAny start_2; };
			case transport_3: 	{ player moveInAny start_3; };
			case transport_4: 	{ player moveInAny start_4; };
			case transport_5: 	{ player moveInAny start_5; };
			case transport_6: 	{ player moveInAny start_6; };
		};
		
		sleep 2;
		
		_vehicle2 = objectParent player;
		
		_a = _a + 1;

	};
};
