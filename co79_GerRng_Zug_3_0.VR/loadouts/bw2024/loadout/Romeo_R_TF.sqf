//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Romeo_R_TF
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Romeo_R_TF"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["SPS_hk416_14_5_glm_hk_ctr_black_f","","sps_M300C_MAWL_IR","CUP_optic_Elcan_SpecterDR_KF_black",["SPS_HKG3PMAG_30Rnd_556x45_B",30],["1Rnd_Smoke_Grenade_shell",1],""],
	[],
	["CUP_hgun_M17_Black","","CUP_acc_Glock17_Flashlight","optic_MRD_black",["CUP_21Rnd_9x19_M17_Green",21],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_CableTie",2],["ACE_EarPlugs",1],["ACE_IR_Strobe_Item",1],["ItemcTabHCam",1],["tsp_lockpick",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_elasticBandage",10],["ACE_quikclot",5],["kat_chestSeal",2],["ACE_splint",2],["ACE_tourniquet",2],["acex_intelitems_notepad",1,1]]],
	["CUP_V_B_GER_Armatus_BB_Fleck",[["CUP_1Rnd_HEDP_M203",6,1],["SPS_HKG3PMAG_30Rnd_556x45_M855A1_B",6,30],["CUP_17Rnd_9x19_M17_Black",1,17],["Laserbatteries",1,1],["1Rnd_Smoke_Grenade_shell",3,1],["ACE_40mm_Flare_ir",2,1],["SmokeShell",2,1],["CUP_HandGrenade_M67",2,1],["SmokeShellPurple",2,1],["SmokeShellYellow",2,1]]],
	["tfw_ilbeRT1523_whip_flk",[["tfw_rf3080Item",1],["GerRng_rations_HydrationBladder_3L",1],["GerRng_rations_EPa_typ_i",1]]],
	"CUP_H_OpsCore_Covered_Fleck_SF","G_Bandanna_shades",["Laserdesignator_02_ghex_F","","","",["Laserbatteries",1],[],""],
	["ItemMap","ItemAndroid","TFAR_anprc152","ItemCompass","ItemWatch","CUP_NVG_PVS15_black"]
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
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;