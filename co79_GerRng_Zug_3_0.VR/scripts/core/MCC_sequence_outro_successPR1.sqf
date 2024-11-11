// Stops running the Sequence on the Server or HC
if (! hasInterface) exitWith {};

playMusic "Outro_SuccessPR1";

titleText ["<img image='images\GermanRangersLogo.paa' shadow='0' size='10'/> <br/>
			<t color='#ffffff' size='5' font='RobotoCondensed' shadow = '2' >M I S S I O N   E R F Ü L L T</t>
			<br/>
			<br/>
			<t color='#ffffff' size='1.5' font='RobotoCondensed' shadow = '2' >Auftrag erfolgreich abgeschlossen.</t>", 
			"PLAIN", 2, true, true
		];

sleep 4;

titleText ["", "BLACK OUT", 1, true, true];
sleep 2.5;
cutText ["", "BLACK IN", 3, true, true];

_playerName = (toUpper profileName) splitString "" joinString " ";;

_personalText =  format ["<br/><br/><br/><br/><img image='images\GermanRangersLogo.paa' shadow='0' size='10'/><br/><br/><t color='#ffffff' size='3' font='RobotoCondensed' shadow = '2' >G U T E   A R B E I T ,   %1</t><br/><br/><t color='#ffffff' size='1.5' font='RobotoCondensed' shadow = '2' >Danke für deinen Dienst bei den German Rangers!</t>", _playerName];
titleText [_personalText, "PLAIN", 1, true, true];

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
_distance = 10;
_height = 1;
_angle = 0;
_maxAngle = 360;
_speed = 0.061;
_fade = false;

_camera camSetpos position _target;
_camera camSettarget _target;
_center = [position _target select 0, position _target select 1,_height];
_camera camSetPos _center;
_camera camSetTarget _target;
_camera camCommit 0;

while {_height < 50} do {
	_height = _height + 0.1;

	_camera camSetRelPos [0,0,_height];
	_camera camCommit 0.015;
	sleep 0.01;
	
	if (_height > 40 && _fade == false) then {
		cutText ["", "BLACK OUT", 1, true, true];
		_fade = true;
	};

};

sleep 1;

cutText ["", "BLACK IN", 3, true, true];
_fade = false;

_height = 4;
		
while {_angle < _maxAngle} do {
	_angle = _angle + 0.65;

	_camera camSetRelPos [_distance*cos(_angle),_distance*sin(_angle),_height];
	_camera camCommit 0.01;
	sleep 0.01;

	if (_angle > 310 && _fade == false) then {
		cutText ["", "BLACK OUT", 1, true, true];
		_fade = true;
	};
	
};

_camera camSetRelPos [0,60,4];

sleep 1;

cutText ["", "BLACK IN", 3, true, true];
_fade = false;

_range = 60;

while {_range > -60} do {
	_range = _range - 0.25;

	_camera camSetRelPos [0,_range,4];
	_camera camCommit 0.01;
	sleep 0.01;
	
	if (_range < -50  && _fade == false) then {
		cutText ["", "BLACK OUT", 1, true, true];
		_fade = true;
	};

};

cutText ["", "BLACK FADED", 1, true, true];

//Camera destroying - terminates the 'camera view'
sleep 5;
_camera CameraEffect ["Terminate","back"];
CamDestroy _camera;
cutText ["", "BLACK IN", 1, true, true];

