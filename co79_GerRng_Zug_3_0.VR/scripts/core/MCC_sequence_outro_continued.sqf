// Stops running the Sequence on the Server or HC
if (! hasInterface) exitWith {};

playMusic "Outro_Continue";

titleText ["<img image='images\GermanRangersLogo.paa' shadow='0' size='10'/> <br/>
			<t color='#ffffff' size='5' font='RobotoCondensed' shadow = '2' >T O   B E   C O N T I N U E D</t>
			<br/>
			<br/>
			<t color='#ffffff' size='1.5' font='RobotoCondensed' shadow = '2' >Die Mission wird nächsten Montag fortgesetzt.</t>", 
			"PLAIN", 2, true, true
		];

sleep 8;

titleText ["", "BLACK OUT", 1, true, true];
sleep 2.5;
cutText ["", "BLACK IN", 3, true, true];

_playerName = (toUpper profileName) splitString "" joinString " ";;

_personalText =  format ["<br/><br/><br/><br/><img image='images\GermanRangersLogo.paa' shadow='0' size='10'/><br/><br/><t color='#ffffff' size='3' font='RobotoCondensed' shadow = '2' >G U T E   A R B E I T ,   %1</t><br/><br/><t color='#ffffff' size='1.5' font='RobotoCondensed' shadow = '2' >Danke für deinen Einsatz bei den German Rangers!</t>", _playerName];
titleText [_personalText, "PLAIN", 2, true, true];

//Camera creating - always add to the script to make the camera work
_camera = "camera" camCreate [0,0,0];
_camera cameraEffect ["internal","back"];

showCinemaBorder true;

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

//Camera Zooms Up above the Player
while {_height < 50} do {
	_height = _height + 1;

	_camera camSetRelPos [0,0,_height];
	_camera camCommit 0.4;
	sleep 0.4;
	
	if (_height > 40 && _fade == false) then {
		cutText ["", "BLACK OUT", 1, true, true];
		_fade = true;
	};

};

sleep 1;

cutText ["", "BLACK IN", 3, true, true];
_fade = false;

_height = 4;

//Camera circles around the Player
while {_angle < _maxAngle} do {
	_angle = _angle + 1;

	_camera camSetRelPos [_distance*cos(_angle),_distance*sin(_angle),_height];
	_camera camCommit 0.04;
	sleep 0.04;

	if (_angle > 337 && _fade == false) then {
		cutText ["", "BLACK OUT", 1, true, true];
		_fade = true;
	};
	
};

_camera camSetRelPos [0,60,4];

sleep 1;

cutText ["", "BLACK IN", 3, true, true];
_fade = false;

_range = 60;

//Camera swoops towards and over the Player
while {_range > -65} do {
	_range = _range - 0.7;

	_camera camSetRelPos [0,_range,4];
	_camera camCommit 0.07;
	sleep 0.07;
	
	if (_range < -50  && _fade == false) then {
		cutText ["", "BLACK OUT", 2, true, true];
		_fade = true;
	};

};

cutText ["", "BLACK FADED", 1, true, true];

sleep 5;

//Camera destroying - terminates the 'camera view'
_camera CameraEffect ["Terminate","back"];
CamDestroy _camera;
cutText ["", "BLACK IN", 1, true, true];
