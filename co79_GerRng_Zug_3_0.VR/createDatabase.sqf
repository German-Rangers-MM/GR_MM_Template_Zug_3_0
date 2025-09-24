private _player = (_this select 0);
private _playerName = (_this select 1);

private _inidbi = ["new",str _player] call OO_INIDBI;

["write", ["Player Info", "Name",_playerName]] call _inidbi;