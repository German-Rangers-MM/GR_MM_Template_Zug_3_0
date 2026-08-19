//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Romeo_TF
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Romeo_TF"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36CA3","","CUP_acc_LLM_black","SPS_EOTech_Black50",["CUP_30Rnd_556x45_G36",30],[],""],
	[],
	["CUP_hgun_M17_Black","","","",["CUP_17Rnd_9x19_M17_Black",17],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",2],["tsp_lockpick",1],["ACE_elasticBandage",10],["ACE_quikclot",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_artilleryTable",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],
	["gerrng_PlateCarrier1_Flecktarn",[["ACE_EntrenchingTool",1],["ACE_Kestrel4500",1],["CUP_NVG_PVS15_black",1],["GerRng_rations_HydrationBladder_3L",1],["GerRng_rations_EPa_typ_xviii",1],["ace_flags_purple",5],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["SmokeShellRed",2,1],["CUP_30Rnd_556x45_G36",4,30],["CUP_21Rnd_9x19_M17_Black",1,21],["SmokeShellYellow",2,1],["SmokeShellPurple",2,1]]],
	["tfw_ilbeRT1523_whip_flk",[["ACE_wirecutter",1],["ToolKit",1],["tfw_rf3080Item",1],["ACE_Fortify",1]]],
	"CUP_H_OpsCore_Covered_Fleck","G_Bandanna_shades",["Laserdesignator_02_ghex_F","","","",["Laserbatteries",1],[],""],
	["ItemMap","ItemcTab","TFAR_anprc152","ItemCompass","ItemWatch",""]
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