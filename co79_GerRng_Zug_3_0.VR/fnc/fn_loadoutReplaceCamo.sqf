/*	
	by SmartGun	
	
 	Description:	
	Ersetzt Tarnmuster entsprechend der im File config.hpp eingestellten Tarnfarbe
	
 	Paramameters:	
	0: ARRAY - Unit Loadout Array
	
	Return values:
	ARRAY - modified Unit Loadout Array	
	
	_newLoadoutArray = [_loadoutArray] call SGN_fnc_loadoutReplaceCamo;
*/
params ["_loadoutArray"];

private _camoType = toLowerANSI tarnfarbeV;
private _camoIndex = switch _camoType do {
	case "bwfleck":	 		{ 0 };
	case "bwtropen": 		{ 1 };		
	case "bwwinter": 		{ 2 };	
	case "bwwinterfleck": 	{ 0 };		
	case "bwwintertropen": 	{ 1 };	
};

// classNames
private _uniform 	= "";
private _weste	 	= "";
private _ruck		= "";
private _helm 		= _loadoutArray#6; // H_MilCap_gry

// get data from given loadout array -> inventory cargo container
private _uniformArray 	= _loadoutArray#3;
private _westeArray 	= _loadoutArray#4;
private _ruckArray	 	= _loadoutArray#5;

if ((count _uniformArray) > 0) 	then {_uniform 	= _uniformArray#0;};
if ((count _westeArray) > 0) 	then {_weste 	= _westeArray#0;};
if ((count _ruckArray) > 0) 	then {_ruck		= _ruckArray#0;};

// Weste
{
	// className hinterlegt? ToDo: lowercase verwenden?
	if (_weste in _x) then {	
		// gesuchte tarnung verfügbar?
		if ((_x select _camoIndex) != "") then {	
			// neue tarnung auswählen
			_weste = _x select _camoIndex;
		};
	};	
} forEach [	
	// [FleckTarn, TrtopenTarn, WinterTarn]
	["CUP_V_B_GER_PVest_Fleck_Gren",	"CUP_V_B_GER_PVest_Trop_Gren", 		"gerrng_PlateCarrier1_Wintertarn"],
	["CUP_V_B_GER_PVest_Fleck_Gren_LT",	"CUP_V_B_GER_PVest_Trop_Gren_LT", 	"gerrng_PlateCarrier1_Wintertarn"],
	["gerrng_PlateCarrier1_Flecktarn",	"gerrng_PlateCarrier1_Tropentarn", 	"gerrng_PlateCarrier1_Wintertarn"],
	["CUP_V_B_GER_Armatus_BB_Fleck",	"CUP_V_B_GER_Armatus_BB_Trop", 		"gerrng_PlateCarrier1_Wintertarn"]
];

// Rucksack
{
	if (_ruck in _x) then {		
		if ((_x select _camoIndex) != "") then {			
			_ruck = _x select _camoIndex;
		};
	};	
} forEach [	
	["B_AssaultPack_rgr",			"B_AssaultPack_cbr", 			""],
	["B_Carryall_green_F",			"B_Carryall_cbr", 				""],
	["B_Kitbag_rgr",				"B_Kitbag_tan", 				""],
	["CFP_Kitbag_Flecktarn",		"CFP_Kitbag_Tropentarn", 		""],
	["CUP_B_GER_Pack_Flecktarn",	"CUP_B_GER_Pack_Tropentarn", 	""],
	["CUP_B_GER_Medic_Flecktarn",	"CUP_B_GER_Medic_Tropentarn", 	""],
	["CFP_Camelbak_Mule_RngrGrn",	"CFP_Camelbak_Mule_Drab", 		""],
	["tfw_ilbeRT1523_whip_flk",		"tfw_ilbeRT1523_whip_trp", 		""],
	["tfw_ilbeRT1523_DD_flk",		"tfw_ilbeRT1523_DD_trp", 		""],
	["tfw_ilbeRT1523_blade_flk",	"tfw_ilbeRT1523_blade_trp", 	""],
	["ace_gunbag",					"ace_gunbag_Tan", 				""]		
];

// Helm
{
	if (_helm in _x) then {		
		if ((_x select _camoIndex) != "") then {			
			_helm = _x select _camoIndex;
		};
	};	
} forEach [	
	["CUP_H_Ger_M92_Cover",				"CUP_H_Ger_M92_Cover_Trop", 			"CFP_BeanieHat_White"],
	["CUP_H_Ger_M92_Cover_GG_CB",		"CUP_H_Ger_M92_Cover_Trop_GG_CB", 		"CFP_BeanieHat_White"],
	["CUP_H_Ger_M92_Cover_GG_CF",		"CUP_H_Ger_M92_Cover_Trop_GG_CF", 		"CFP_BeanieHat_White"],
	["CUP_H_Ger_M92_Cover_GG",			"CUP_H_Ger_M92_Cover_Trop_GG", 			"CFP_BeanieHat_White"],
	["CUP_H_OpsCore_Covered_Fleck",		"CUP_H_OpsCore_Covered_Tropen", 		"CUP_H_PMC_Beanie_Headphones_Winter"],
	["CUP_H_OpsCore_Covered_Fleck_NoHS","CUP_H_OpsCore_Covered_Tropen_NoHS", 	"CFP_BeanieHat_White"],
	["CUP_H_OpsCore_Covered_Fleck_SF",	"CUP_H_OpsCore_Covered_Tropen_SF", 		"CUP_H_PMC_Beanie_Headphones_Winter"],
	["CUP_H_Ger_Boonie2_Flecktarn",		"CUP_H_Ger_Boonie2_desert", 			"SP_BoonieHat_NodUrban"],
	["CUP_H_Ger_Boonie_Flecktarn",		"CUP_H_Ger_Boonie_desert", 				"SP_BoonieHat_NodUrban"],
	["CUP_H_Ger_Cap_EP_Grn1",			"CUP_H_Ger_Cap_EP_Tan1", 				"SP_BaseballCap_NodUrban"],
	["H_HelmetSpecB_wdl",				"H_HelmetSpecB_sand", 					"SP_BaseballCap_NodUrban"]	
];

// Sonderfall Winter-Tarn Mix -> Gerödel bleibt Fleck oder Tropen; Uniform wird duch Wintertarn ersetzt
if (_camoType in ["bwwinterfleck","bwwintertropen"]) then {
	_camoIndex = 2;
};

// Uniform
{	
	if (_uniform in _x) then {		
		if ((_x select _camoIndex) != "") then {			
			//private _load = getContainerMaxLoad (uniform player);
			_uniform = _x select _camoIndex;
		};
	};	
} forEach [	
	["CUP_U_B_GER_Flecktarn_1",	"CUP_U_B_GER_Tropentarn_1", "CFP_U_FieldUniform_flecktarn_snow"],
	["CUP_U_B_GER_Flecktarn_2",	"CUP_U_B_GER_Tropentarn_2", "CFP_U_FieldUniform_flecktarn_snow"],
	["CUP_U_B_GER_Flecktarn_3",	"CUP_U_B_GER_Tropentarn_3", "CFP_U_FieldUniform_flecktarn_snow"],
	["CUP_U_B_GER_Flecktarn_4",	"CUP_U_B_GER_Tropentarn_4", "CFP_U_FieldUniform_flecktarn_snow"],
	["CUP_U_B_GER_Flecktarn_5",	"CUP_U_B_GER_Tropentarn_5", "CFP_U_FieldUniform_flecktarn_snow"],
	["CUP_U_B_GER_Flecktarn_6",	"CUP_U_B_GER_Tropentarn_6", "CFP_U_FieldUniform_flecktarn_snow"],
	["CUP_U_B_GER_Flecktarn_7",	"CUP_U_B_GER_Tropentarn_7", "CFP_U_FieldUniform_flecktarn_snow"],
	["CUP_U_B_GER_Flecktarn_8",	"CUP_U_B_GER_Tropentarn_8", "CFP_U_FieldUniform_flecktarn_snow"],
	["CUP_U_B_GER_Fleck_Crye",	"CUP_U_B_GER_Crye", 		"CFP_U_FieldUniform_flecktarn_snow"],
	["CUP_U_B_GER_Fleck_Crye2",	"CUP_U_B_GER_Crye2", 		"CFP_U_FieldUniform_flecktarn_snow"]
];

// Inventory Cargo Container im Loadout Array ersetzten; Inventory Cargo Items bleiben gleich
if ((count _uniformArray) > 0) 	then {_uniformArray set [0, _uniform];};
if ((count _westeArray) > 0) 	then {_westeArray 	set [0, _weste];};
if ((count _ruckArray) > 0) 	then {_ruckArray 	set [0, _ruck];};

_loadoutArray set [3, _uniformArray];
_loadoutArray set [4, _westeArray];
_loadoutArray set [5, _ruckArray];
_loadoutArray set [6, _helm];
//copytoclipboard str _loadoutArray;
// return modified array
_loadoutArray	