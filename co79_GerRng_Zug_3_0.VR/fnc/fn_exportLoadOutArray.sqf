_br		= toString [13,10]; 
_tab 	= toString [9]; 
_c 		= "//";
_s 		= "//------------------------------------------------------------------";
_li		= "https://community.bistudio.com/wiki/Unit_Loadout_Array";
		
_loNa 	= player getVariable ["GR_unitLoadout", "UNDEFINED"];
_medT	= 0;
_engT	= 0;
_eodT	= false;

if (_loNa in ["Schuetze_EHB"])																			then { _medT = 1; 		}; // EHB
if (_loNa in ["Lima","ZugSani","Mike_AvD","Mike_Sani","Sanitaeter","Sanitaeter_WaGru","Sierra_NaSi"]) 	then { _medT = 2; 		}; // Arzt
if (_loNa in ["Lima"]) 																					then { _engT = 2; 		}; // Engineer
if (_loNa in ["Lima"]) 																					then { _eodT = true; 	}; // EOD

_lo 	= getUnitLoadout player;

_header = composeText [_s,_br,_s,_br,_c,_br,_c,_tab,_loNa,_br,_c,_br,_s,_br,_s,_br];
_setVar = composeText ["player setVariable [",str "GR_unitLoadout"+",",str _loNa,"];",_br];
_array	= composeText ["player setUnitLoadout [", _br, _tab, str (_lo #0)+",", _br, _tab, str (_lo #1)+",", _br, _tab, str (_lo #2)+",", _br, _tab, str (_lo #3)+",", _br, _tab, str (_lo #4)+",", _br, _tab, str (_lo #5)+",", _br, _tab, str (_lo #6)+",", str (_lo #7)+",", str (_lo #8)+",", _br, _tab, str (_lo #9), _br, "];"];

_medic 	= composeText ["player setVariable [",str "ACE_medical_medicClass"+",",str _medT,",","true","];",_br];
_engi 	= composeText ["player setVariable [",str "ACE_isEngineer"+",",str _engT,",","true","];",_br];
_eod 	= composeText ["player setVariable [",str "ACE_isEOD"+",",str _eodT,",","true","];",_br];
_lock	= "[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;";		
_options = composeText [_s,_br,_c,_tab,"ACE Optionen fuer Spieler",_br,_s,_br,_c,_tab,"Medic:",_br,_medic,_br,_c,_tab,"Combat Engineer:",_br,_engi,_br,_c,_tab,"Explosive Specialist:",_br,_eod,_br,_c,_tab,"Waffe sichern",_br,_lock];

_output = composeText [_header,_setVar,_br,_c,_tab,_li,_br,_array,_br,_br,_options]; 
copyToClipboard str _output;

hint "Export Successful";
systemChat " .txt Datei öffnen und Loadout mit STRG+V einfügen";
sleep 5;
hint "";