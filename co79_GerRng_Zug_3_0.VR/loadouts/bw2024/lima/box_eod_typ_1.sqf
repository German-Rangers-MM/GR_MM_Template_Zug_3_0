// Kiste EOD Typ I - Ausrüstung
/* Aufruf im Editor mit:

_path = format ["loadouts\%1\lima\box_eod_typ_i.sqf", getMissionConfigValue "fraktion"]; 
null = [this] execVM _path;

*/


if (! isServer) exitWith {};

_box = _this select 0;

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


_box addItemCargoGlobal ["CUP_H_RUS_Altyn_Shield_Down",2];
_box addItemCargoGlobal ["TFAR_anprc152",2];
_box addItemCargoGlobal ["G_AirPurifyingRespirator_01_F",2];
_box addItemCargoGlobal ["G_Balaclava_oli",2];
_box addItemCargoGlobal ["V_PlateCarrierIAGL_oli",1];
_box addItemCargoGlobal ["V_EOD_olive_F",1];
_box addItemCargoGlobal ["V_LegStrapBag_olive_F",4];
_box addBackpackCargoGlobal ["B_Messenger_Black_F",2];
_box addItemCargoGlobal ["CUP_U_B_USArmy_PilotOverall",2];
_box addItemCargoGlobal ["V_Safety_yellow_F",2];

// für diese Box Gewichtslimit Ignorieren
//[_box, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
//[_box, true, [0, 2, 0], 90, true] call ace_dragging_fnc_setDraggable;