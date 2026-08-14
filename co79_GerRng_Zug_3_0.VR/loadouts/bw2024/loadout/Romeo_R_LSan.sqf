//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Romeo_R_DM
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Romeo_TF"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["SPS_hk417_20_vfg_black_f","","sps_M300C_MAWL_IR","SPS_EOTech_Vudu_Black_PVS24LR",["SPS_20Rnd_762x51mm_M80A1_EPR",20],[],"bipod_01_F_blk"],
	[],
	["CUP_hgun_M17_Black","","CUP_acc_Glock17_Flashlight","optic_MRD_black",["CUP_21Rnd_9x19_M17_Green",21],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_CableTie",2],["ACE_EarPlugs",1],["ACE_IR_Strobe_Item",2],["tsp_lockpick",1],["ItemcTabHCam",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_RangeCard",1],["ACE_elasticBandage",10],["ACE_quikclot",5],["ACE_splint",2],["ACE_tourniquet",2],["kat_chestSeal",2]]],
	["CUP_V_B_GER_Armatus_BB_Fleck",[["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["SPS_20Rnd_762x51mm_M80A1_EPR",6,20],["CUP_17Rnd_9x19_M17_Black",2,17],["SmokeShell",2,1],["HandGrenade",2,1]]],
	["CUP_B_GER_Medic_Flecktarn",[["GerRng_rations_HydrationBladder_3L",1],["GerRng_rations_EPa_typ_i",1],["ACE_elasticBandage",10],["ACE_salineIV_500",8],["ACE_surgicalKit",1],["kat_IV_16",6],["kat_BVM",1],["kat_EACA",4],["kat_IO_FAST",2],["kat_ketamine",2],["kat_larynx",6],["kat_Pulseoximeter",3],["kat_TXA",6],["kat_stethoscope",1],["kat_Penthrox",1,10]]],
	"CUP_H_OpsCore_Covered_Fleck_SF","CUP_G_ESS_BLK_Facewrap_Black",["Rangefinder","","","",[],[],""],
	["ItemMap","ItemcTab","TFAR_anprc152","ItemCompass","ItemWatch","CUP_NVG_PVS15_black"]
];

//------------------------------------------------------------------
//	ACE Optionen fuer Spieler
//------------------------------------------------------------------
//	Medic:
player setVariable ["ACE_medical_medicClass",2,true];

//	Combat Engineer:
player setVariable ["ACE_isEngineer",0,true];

//	Explosive Specialist:
player setVariable ["ACE_isEOD",false,true];

//	Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;