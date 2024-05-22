//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Mike_Fahrer
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Mike_Fahrer"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_MG36_wdl","","CUP_acc_LLM_od","CUP_optic_AIMM_MICROT1_OD",["CUP_100Rnd_556x45_BetaCMag_wdl",100],[],""],
	["CUP_launch_M72A6_Loaded","","","",["CUP_M72A6_M",1],[],""],
	[],
	["CUP_U_B_GER_Fleck_Crye",[["CUP_NVG_PVS15_black",1],["ACE_IR_Strobe_Item",1],["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_EntrenchingTool",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["HandGrenade",2,1],["SmokeShell",4,1]]],
	["B_Kitbag_rgr",[["ACE_packingBandage",4],["kat_chestSeal",1],["ACE_splint",2],["CUP_100Rnd_556x45_BetaCMag_wdl",9,100],[["CUP_launch_M72A6","","","",[],[],""],1]]],
	"CUP_H_OpsCore_Covered_Fleck","CUP_G_PMC_Facewrap_Tan_Glasses_Dark",["Rangefinder","","","",[],[],""],
	["ItemMap","","TFAR_anprc152","ItemCompass","ItemWatch",""]
];

//------------------------------------------------------------------
//	ACE Optionen fuer Spieler
//------------------------------------------------------------------
//	Medic:
player setVariable ["ACE_medical_medicClass",0,true];

//	Combat Engineer:
player setVariable ["ACE_isEngineer",0,true];

//	Explosive Specialist:
player setVariable ["ACE_isEOD",false,true];

//	Waffe sichern
player setVariable ["ace_safemode_safedweapons", []];
[ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_lockSafety;