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
	["CUP_U_B_GER_Fleck_Crye",[["CUP_NVG_PVS15_black",1],["ACE_IR_Strobe_Item",1],["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_packingBandage",4],["ACE_splint",2],["kat_chestSeal",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["HandGrenade",2,1],["SmokeShell",4,1],["CUP_100Rnd_556x45_BetaCMag_wdl",6,100]]],
	["CFP_Camelbak_Mule_RngrGrn",[["ACE_EntrenchingTool",1],["CUP_100Rnd_556x45_BetaCMag_wdl",3,100],[["CUP_launch_M72A6","","","",[],[],""],1]]],
	"CUP_H_OpsCore_Covered_Fleck","CUP_G_PMC_Facewrap_Tan_Glasses_Dark",["Rangefinder","","","",[],[],""],
	["ItemMap","ItemAndroid","TFAR_anprc152","ItemCompass","ItemWatch",""]
];

//------------------------------------------------------------------
//	ACE Optionen fuer Spieler
//------------------------------------------------------------------
//	Medic:
player setVariable ["ACE_medical_medicClass",0,true];

//	Combat Engineer:
player setVariable ["ACE_isEngineer",2,true];

//	Explosive Specialist:
player setVariable ["ACE_isEOD",true,true];

//	Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;
