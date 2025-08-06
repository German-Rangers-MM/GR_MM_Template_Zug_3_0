//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Romeo_Pilot
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Romeo_Pilot"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["sps_hk416d_10_4_smr_hk_black_f","","sps_M300C_MAWL_IR","sps_aimpoint_T1_Black_High50",["SPS_HKG3PMAG_30Rnd_556x45_B",30],[],""],
	[],
	["CUP_hgun_M17_Black","","","",["CUP_21Rnd_9x19_M17_Green",21],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_IR_Strobe_Item",1],["ItemcTabHCam",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_PlottingBoard",1],["ACE_artilleryTable",1],["ACE_elasticBandage",10],["ACE_quikclot",5],["kat_chestSeal",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_salineIV_500",2]]],
	["CUP_V_B_Armatus_Black",[["ACE_EntrenchingTool",1],["tsp_lockpick",1],["SPS_HKG3PMAG_30Rnd_556x45_B",4,30],["CUP_21Rnd_9x19_M17_Black",1,21],["Laserbatteries",1,1]]],
	["tfw_ilbeARC210_whip_flk",[["GerRng_rations_EPa_typ_xv",1],["ace_flags_purple",5],["GerRng_rations_HydrationBladder_3L",1],["SmokeShellYellow",2,1],["SmokeShellPurple",2,1],["SmokeShellBlue",2,1],["ACE_HandFlare_Green",2,1],["ACE_HandFlare_Red",2,1],["ACE_Chemlight_HiBlue",2,1]]],
	"GerRng_helmets_helmet_pilot_w","G_Bandanna_blk",["Laserdesignator_02_ghex_F","","","",["Laserbatteries",1],[],""],
	["ItemMap","ItemcTab","TFAR_anprc152","ItemCompass","ItemWatch","CUP_NVG_GPNVG_black_WP"]
];

//------------------------------------------------------------------
//	ACE Optionen fuer Spieler
//------------------------------------------------------------------
//	Medic:
player setVariable ["ACE_medical_medicClass",2,true];

//	Combat Engineer:
player setVariable ["ACE_isEngineer",2,true];

//	Explosive Specialist:
player setVariable ["ACE_isEOD",true,true];

//	Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;