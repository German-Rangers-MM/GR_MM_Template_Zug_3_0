_player = (_this select 0);
_clientID = (_this select 1);

_inidbi = ["new",str _player] call OO_INIDBI;

_gear = ["read", ["Player Gear", "Gear", []]] call _inidbi;

loadData = _gear;
_clientID publicVariableClient "loadData";