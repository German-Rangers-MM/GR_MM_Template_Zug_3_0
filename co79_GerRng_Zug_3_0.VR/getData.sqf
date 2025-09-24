private _player = (_this select 0);
private _clientID = (_this select 1);

private _inidbi = ["new",str _player] call OO_INIDBI;

private _gear = ["read", ["Player Gear", "Gear", []]] call _inidbi;

loadData = _gear;
_clientID publicVariableClient "loadData";