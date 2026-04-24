_player = (_this select 0);
_playerName = (_this select 1);

_inidbi = ["new",str _player] call OO_INIDBI;

["write", ["Player Info", "Name",_playerName]] call _inidbi;