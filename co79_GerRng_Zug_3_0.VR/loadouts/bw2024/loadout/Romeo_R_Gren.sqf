//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Romeo_R_Gren
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Romeo_TF"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["SPS_hk417_16_vfg_black_f","","sps_M300C_MAWL_IR","CUP_optic_Elcan_SpecterDR_KF_RMR_black",["20Rnd_762x51_Mag",20],[],""],
	["CUP_launch_M136_Loaded","","","",["CUP_M136_M",1],[],""],
	["CUP_hgun_M17_Black","","CUP_acc_Glock17_Flashlight","optic_MRD_black",["CUP_21Rnd_9x19_M17_Green",21],[],""],
	["CUP_U_B_GER_Fleck_Crye2",[["ACE_CableTie",2],["ACE_EarPlugs",1],["ACE_IR_Strobe_Item",2],["ItemcTabHCam",1],["tsp_lockpick",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_packingBandage",10],["ACE_quikclot",5],["ACE_splint",2],["ACE_tourniquet",2],["kat_chestSeal",2]]],
	["CUP_V_B_GER_Armatus_BB_Fleck",[["GerRng_rations_HydrationBladder_3L",1],["GerRng_rations_EPa_typ_i",1],["SPS_20Rnd_762x51mm_M80A1_EPR",6,20],["SmokeShell",2,1],["HandGrenade",2,1]]],
	[],
	"CUP_H_OpsCore_Covered_Fleck_SF","CUP_G_ESS_BLK_Scarf_Face_Grn",["Rangefinder","","","",[],[],""],
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