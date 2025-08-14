//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Zug_JTAC
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Zug_JTAC"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["SPS_hk416_11_glm_hk_ctr_black_f","","sps_M300C_MAWL_IR","SPS_EOTech_Black_5xMAG_up",["SPS_HKG3PMAG_30Rnd_556x45_B",30],[],""],
	[],
	["CUP_hgun_M17_Black","","","",["CUP_21Rnd_9x19_M17_Black",21],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_IR_Strobe_Item",1],["ItemcTabHCam",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_PlottingBoard",1],["ACE_elasticBandage",10],["ACE_quikclot",5],["kat_chestSeal",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_salineIV_500",2],["ACE_Kestrel4500",1],["acex_intelitems_notepad",1,1]]],
	["CUP_V_B_GER_Armatus_BB_Fleck",[["ACE_microDAGR",1],["CUP_21Rnd_9x19_M17_Black",1,21],["SmokeShellPurple",3,1],["SPS_HKG3PMAG_30Rnd_556x45_B",4,30],["SmokeShellRed",3,1],["SmokeShellGreen",3,1],["SmokeShellOrange",2,1],["SmokeShellBlue",2,1],["SmokeShellYellow",2,1],["ACE_HandFlare_Red",2,1],["ACE_HandFlare_Green",2,1],["B_IR_Grenade",2,1],["ACE_Chemlight_HiGreen",3,1],["ACE_Chemlight_HiRed",3,1],["ACE_Chemlight_IR",1,1],[["ACE_Vector","","","",[],[],""],1]]],
	["tfw_ilbeMR3000_whip_foxflk",[["tfw_rf3080Item",1],["GerRng_rations_HydrationBladder_3L",1],["UGL_FlareGreen_F",4,1],["UGL_FlareRed_F",4,1],["1Rnd_SmokePurple_Grenade_shell",4,1],["1Rnd_SmokeRed_Grenade_shell",4,1],["1Rnd_SmokeGreen_Grenade_shell",4,1],["CUP_1Rnd_StarCluster_Red_M203",2,1]]],
	"CUP_H_OpsCore_Covered_Fleck","",["Laserdesignator_02_ghex_F","","","",["Laserbatteries",1],[],""],
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