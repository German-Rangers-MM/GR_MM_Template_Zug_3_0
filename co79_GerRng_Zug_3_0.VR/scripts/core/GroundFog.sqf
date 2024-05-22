/*

handle = [] execVM "scripts\GroundFog.sqf";

*/

if (!isDedicated) then {
	waitUntil {!isNull player};
	_pos = position vehicle player;
	_ps = "#particlesource" createVehicleLocal _pos;
	_ps setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [4], [[1, 1, 1, 0], [1, 1, 1, 0.02], [1, 1, 1, 0]], [1000], 1, 0, "", "",""];
	_ps setParticleRandom [3, [40, 40, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
	_ps setParticleCircle [0.1, [0, 0, 0]];
	_ps setDropInterval 0.01;

	while {true} do {
		waitUntil {vehicle player == player};
		sleep 2;
		_ps setPos position vehicle player;
	};
};