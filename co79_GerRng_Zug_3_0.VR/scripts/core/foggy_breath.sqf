/*
Foggy breath Script 20110122
modified by Xeno

//initPlayerLocal.sqf at the end of file
//FoggyBreath____________________________________________________________
	_units = if (!isMultiplayer) then {switchableUnits} else {playableUnits};
	{[_x, 0.03] execVM "scripts\foggy_breath.sqf"} forEach _units;

*/

private ["_unit", "_int"];
_unit = _this select 0;
_int = _this select 1; //intensity of fog (0 to 1)

while {alive _unit} do {
    sleep (2 + random 2); // random time between breaths

    _source = "logic" createVehicleLocal (getpos _unit);
    _fog = "#particlesource" createVehicleLocal getpos _source;
    _fog setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 13,0],
    "", 
    "Billboard", 
    0.5, 
    0.5, 
    [0,0,0],
    [0, 0.2, -0.2], 
    1, 1.275,    1, 0.2, 
    [0, 0.2,0], 
    [[1,1,1, _int], [1,1,1, 0.01], [1,1,1, 0]], 
    [1000], 
    1, 
    0.04, 
    "", 
    "", 
    _source];
    _fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
    _fog setDropInterval 0.001;

    _source attachto [_unit,[0,0.15,0], "neck"]; // get fog to come out of player mouth

    sleep 0.5; // 1/2 second exhalation
    deletevehicle _source;
    deleteVehicle _fog;
};