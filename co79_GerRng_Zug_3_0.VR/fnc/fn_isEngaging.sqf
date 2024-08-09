/*
  Author:
   rÃ¼be

  Description:
   returns true if anybody of the given unit(s)/group is engaging

  Parameter(s):
   _this: unit(s)/group (unit, array of units or group)

  Returns:
   boolean
*/

private ["_units", "_engaging"];

_units = [];
_engaging = false;

switch (true) do {
  case ((typeName _this) == "ARRAY"): {
     _units = _this;
  };
  case ((typeName _this) == "GROUP"): {
     _units = units _this;
  };
  default {
     _units = [_this];
  };
};

{
  if ((currentCommand _x) in ["ATTACK", "ATTACKFIRE", "FIRE"]) exitWith { _engaging = true; };
} forEach _units;


// return status
_engaging