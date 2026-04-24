params ["_line1","_line2","_line3","_tickerCountry","_tickerLocation"];

// Stops running the Sequence on the Server or HC
if (! hasInterface) exitWith {};

//Start Music

playMusic "PRIntro";

sleep 11;

//Camera creating - always add to the script to make the camera work
_camera = "camera" camCreate [0,0,0];
_camera cameraEffect ["internal","back"];

showCinemaBorder true;

//Camera moves in a circle around the player - advanced implementation example. Parameters, customization.
//launch = [target unit, distance, height, max angle, speed];
//Target unit - name of the unit the camera rotates around
//Distance - number, distance of the camera and the target
//Height - number, height in meters of the camera above the ground
//Max angle - number, maximum angle at which the rotation stops
//Speed - number, interval of a 'tick', or change. Lower for faster rotations.
//launch = [player,10,4,360,0.1] execVM "camera.sqf";

_target = player;
_fade = false;
_height = 2;

_camera camSetpos position _target;
_camera camSettarget _target;
_center = [position _target select 0, position _target select 1,_height];
_camera camSetPos _center;
_camera camSetTarget _target;
_camera camCommit 0;

titleText [_line1, "PLAIN", 1, true, true];

while {_height < 50} do {
	_height = _height + 2.3;

	_camera camSetRelPos [0,0,_height];
	_camera camCommit 0.5;
	sleep 0.5;
};

//Camera destroying - terminates the 'camera view'
_camera CameraEffect ["Terminate","back"];
CamDestroy _camera;

titleText [_line2, "BLACK FADED", 2, true, true];

sleep 10;

titleText [_line3, "BLACK FADED", 10, true, true];
waitUntil { camCommitted _camera; };
sleep 4;
titleText [_line3, "BLACK IN", 5, true, true];
sleep 5;

//Text Ticker
[[[_tickerCountry,"size = '0.7' font='PuristaBold'"],["","<br/>"],[_tickerLocation,"size = '0.7'","#aaaaaa"]],safeZoneX / 4, safeZoneH / 2,true,"<t font='PuristaBold'>%1</t>",[],{ false },true] spawn BIS_fnc_typeText2;	
sleep 8;
private _t = [daytime, "HH:MM"] call BIS_fnc_timeToString;			// time at missionstart as a string
[["Time: "+_t],safeZoneX / 4, safeZoneH / 2,true,"<t font='PuristaBold'>%1</t>",[],{ false },true] spawn BIS_fnc_typeText2;
